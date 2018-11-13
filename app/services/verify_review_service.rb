# frozen_string_literal: true

class VerifyReviewService < BaseService
  def initialize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash).perform
  end

  def review_verified?
    review.completed?
  end

  def perform
    return false unless valid?

    update_review_tx_hash
    update_status
    verifying_review_job
  end

  def error_message
    Eth::ErrorMessage.new(@transaction).perform
  end

  def pending?
    @transaction['hash'] && !@transaction['blockNumber'] && AddressValidator.new(@transaction['to']).valid?
  rescue StandardError
    false
  end

  private

  def valid?
    @transaction.present? && hex_value == @transaction['input']
  end

  def hex_value
   '0x' + "Review message: #{review.message}, rate: #{review.rate}".each_byte.map { |b| b.to_s(16) }.join
  end

  def review
    @params[:review]
  end

  def tx_hash
    review.tx_hash
  end

  def verifying_review_job
    return if !review.verifying? || transaction_failed? || !review.id

    UpdateVerifyingReviewJob.set(wait: 2.minutes).perform_later(review)
  end

  def transaction_failed?
    Eth::StatusTransaction.new(tx_hash).fail?
  end

  def update_review_tx_hash
    return unless AddressValidator.new(@transaction['to']).valid?
    review.description_hash = hex_value
    review.save
    review.update(tx_hash: @transaction['hash'])
  end

  def update_status
    return if !AddressValidator.new(@transaction['to']).valid? || transaction_failed?

    review.update(status: status)
  end

  def status
    return 'completed' if Eth::StatusTransaction.new(tx_hash).success?

    'verifying'
  end
end

