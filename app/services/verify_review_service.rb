# frozen_string_literal: true

class VerifyReviewService < BaseService
  PARAMS_KEYS = %i[tx_hash review].freeze

  def initialize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash).perform
  end

  def review_verified?
    review.completed?
  end

  def perform
    debugger
    return false unless @transaction.present?

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

  def verifying_review_job
    return if !review.verifying? || transaction_failed?

    UpdateVerifyingReviewJob.set(wait: 2.minutes).perform_later(review)
  end

  def transaction_failed?
    Eth::StatusTransaction.new(tx_hash).fail?
  end

  def update_review_tx_hash
    return unless AddressValidator.new(@transaction['to']).valid?
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

  PARAMS_KEYS.each do |key|
    define_method key.to_s do
      @params[key]
    end
  end
end
