class UpdateVerifyingRequestJob < ApplicationJob
  queue_as :default

  def perform(request)
    return unless request.verifying?
    VerifyRequestService.new(params(request)).perform
  rescue StandardError
    'Fail'
  end

  private

  def params(request)
    {
      sender: request.requester.user,
      tx_hash: request.tx_hash,
      request: request
    }
  end
end
