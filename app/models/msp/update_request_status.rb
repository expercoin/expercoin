module MSP
  class UpdateRequestStatus
    def initialize(request)
      @request = request
    end

    def perform
      accepted_status
      completed_status
    end

    private
 
    def accepted_status
      return unless valid_for_accepted_status?
      @request.update(status: 1)
    end

    def valid_for_accepted_status?
      @request.selected_date && @request.pending?
    end

    def completed_status
      return unless valid_for_completed_status?
      @request.update(status: 2)
    end

    def valid_for_completed_status?
      @request.ended_at && @request.accepted?
    end
  end
end