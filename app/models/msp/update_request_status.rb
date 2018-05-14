module MSP
  class UpdateRequestStatus
    def initialize(request)
      @request = request
    end

    def perform
      pending_status
      accepted_status
      inprogress_status
      completed_status
    end

    private
    
    def pending_status
      return unless valid_for_pending_status?
      @request.update(status: 'pending')

    end

    def valid_for_pending_status?
      @request.draft?
    end

    def accepted_status
      return unless valid_for_accepted_status?
      @request.update(status: 'accepted')
    end

    def valid_for_accepted_status?
      @request.selected_date && @request.pending?
    end

    def inprogress_status
      return unless valid_for_inprogress_status?
      @request.update(status: 'inprogress')
    end

    def valid_for_inprogress_status?
      @request.started_at && !@request.ended_at && @request.accepted?
    end

    def completed_status
      return unless valid_for_completed_status?
      @request.update(status: 'completed')
    end

    def valid_for_completed_status?
      @request.ended_at && @request.inprogress?
    end
  end
end