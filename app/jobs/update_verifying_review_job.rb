class UpdateVerifyingReviewJob < ApplicationJob
  queue_as :default

  def perform(review)
    return unless review.verifying?
    VerifyReviewService.new(review: review).perform
  rescue StandardError
    'Fail'
  end
end
