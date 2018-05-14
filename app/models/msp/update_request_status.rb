module MSP
  class UpdateRequestStatus
    def initialize
      @request = request
      @status = request.status
    end

    def perform
      accepted_status
    end

    private

    def accepted_status
      return unless valid_for_accepted_status?
      @status = 1
    end

    def valid_for_accepted_status?
      @request.selected_date && @request.pending?
    end

    def update
      @request.update(status: @status)
    end
  end
end