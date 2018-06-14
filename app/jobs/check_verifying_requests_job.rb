class CheckVerifyingRequestsJob < ApplicationJob
  queue_as :default

  def perform
    Request.verifying.tx_hash.each do |request|
      VerifyRequestService.new(params(request)).perform
    end
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
