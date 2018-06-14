module MSP
  class UpdateRequestStatus
    def initialize(request)
      @request = request
    end

    def perform
      pending_status
      accepted_status
      verifying_status
      verified_status
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

    def verifying_status
      return unless valid_for_verifying_status?
      @request.update(status: 'verifying')
    end

    def valid_for_verifying_status?
      @request.tx_hash && @request.accepted? && !@request.eth_transaction
    end

    def verified_status
      return unless valid_for_verified_status?
      @request.update(status: 'verified')
    end

    def valid_for_verified_status?
      @request.eth_transaction && (@request.accepted? || @request.verifying?)
    end

    def inprogress_status
      return unless valid_for_inprogress_status?
      @request.update(status: 'inprogress')
    end

    def valid_for_inprogress_status?
      (@request.caller || @request.invitee) && !@request.ended_at && @request.verified?
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