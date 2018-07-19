# frozen_string_literal: true

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

      ROLLS = %i[expert requester].freeze
      TYPES = %i[new_times new_status new_request].freeze

      def initialize(request)
        @request = request
      end

      def notify
        email_to_expert
        email_to_requester
      end

      ROLLS.each do |role|
        define_method "email_to_#{role}" do
          return if @request.send(role) == @request.updated_by
          if @request.accepted?
            send("email_to_#{role}_new_status")
          elsif @request.pending?
            send("email_to_#{role}_new_times")
          end
        end

        TYPES.each do |type|
          define_method "email_to_#{role}_#{type}" do
            subject = EMAIL_SUBJECTS.send(type)
            body = ''
            NotifyMailer.send(
              "notify_#{role}_#{type}",
              send("#{role}_email"),
              subject,
              body,
              @request
            ).deliver_now
          end
        end
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
