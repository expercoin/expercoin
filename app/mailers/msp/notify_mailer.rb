module MSP
  # Notify mailer for MSP
  class NotifyMailer < ActionMailer::Base
    default from: 'support@expercoin.com'

    def notify_expert_new_status(email, subject, body)
      @body = body
      mail(to: email, subject: subject) unless Rails.env.test?
    end

    def notify_requester_new_status(email, subject, body)
      @body = body
      mail(to: email, subject: subject) unless Rails.env.test?
    end

    def notify_expert_new_times(email, subject, body)
      @body = body
      mail(to: email, subject: subject) unless Rails.env.test?
    end

    def notify_requester_new_times(email, subject, body)
      @body = body
      mail(to: email, subject: subject) unless Rails.env.test?
    end
  end
end
