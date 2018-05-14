module MSP
  module Email
  # MSP Request Email service
    class Request

      include MSP::Email

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
        subject, body = email_template_for_expert
        NotifyMailer.notify_expert_new_status(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, body)
      end

      def email_to_requester_new_status
        subject, body = email_template_for_requester
        NotifyMailer.notify_requester_new_status(
          requester_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.requester.id, subject, body)
      end

      def email_to_expert_new_request
        subject, body = email_template_for_expert
        NotifyMailer.notify_expert_new_request(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, body)
      end

      def email_to_expert_new_times
        subject, body = email_template_for_expert
        NotifyMailer.notify_expert_new_times(
          expert_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.expert.id, subject, body)
      end

      def email_to_requester_new_times
        subject, body = email_template_for_requester
        NotifyMailer.notify_requester_new_times(
          requester_email,
          subject,
          body,
          @request
        ).deliver_now
        create_email_record(@request.requester.id, subject, body)
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
    end
  end
end
