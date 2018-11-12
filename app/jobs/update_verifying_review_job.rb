class UpdateVerifyingRequestJob < ApplicationJob
  queue_as :default

  def perform(review)
    return unless review.verifying?
    VerifyReviewService.new(params(review)).perform
  rescue StandardError
    'Fail'
  end

  private

  def params(review)
    {
      sender: review.request.requester.user,
      tx_hash: review.tx_hash,
      request: review.request
    }
  end
end
