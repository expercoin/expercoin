module MSP
  module Email
  # MSP Request Email service
    class Request

      include MSP::Email
      
      EMAIL_SUBJECTS = OpenStruct.new(
        new_request: 'You Have New Call Request',
        new_status: 'Status Change On Your Call Request',
        new_times: 'New Times On Your Call Request'
      )

      def initialize(request)
        @request = request
      end

      def notify
        email_to_expert
        email_to_requester
      end

      def email_to_expert
        return if @request.expert == @request.updated_by
        if @request.accepted?
          email_to_expert_new_status
        elsif @request.pending?
          email_to_expert_new_times
        end
      end

      def email_to_requester
        return if @request.requester == @request.updated_by
        if @request.accepted?
          email_to_requester_new_status
        elsif @request.pending?
          email_to_requester_new_times
        end
      end

      def email_to_expert_new_status
        subject, body = [EMAIL_SUBJECTS.new_status, '']
        NotifyMailer.notify_expert_new_status(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, meta)
      end

      def email_to_requester_new_status
        subject, body =  [EMAIL_SUBJECTS.new_status, '']
        NotifyMailer.notify_requester_new_status(
          requester_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.requester.id, subject, meta)
      end

      def email_to_expert_new_request
        subject, body = [EMAIL_SUBJECTS.new_request, '']
        NotifyMailer.notify_expert_new_request(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, meta)
      end

      def email_to_expert_new_times
        subject, body = [EMAIL_SUBJECTS.new_times, '']
        NotifyMailer.notify_expert_new_times(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, meta)
      end

      def email_to_requester_new_times
        subject, body = [EMAIL_SUBJECTS.new_times, '']
        NotifyMailer.notify_requester_new_times(
          requester_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.requester.id, subject, meta)
      end

      def email_template_for_expert
        subject = ""
        body = ""
        [subject, body]
      end

      def email_template_for_requester
        subject = ""
        body = ""
        [subject, body]
      end
      
      def expert_email
        @request.expert.user.email
      end

      def requester_email
        @request.requester.user.email
      end

      def meta
        { request_id: @request.id }
      end
    end
  end
end
