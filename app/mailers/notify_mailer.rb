class NotifyMailer < ActionMailer::Base
  default from: 'support@expercoin.com'
  helper :decorator

  def notify_expert_new_status(email, subject, body, request)
    @body = body
    @request = request
    @requester = request.requester
    mail(to: email, subject: subject) unless Rails.env.test?
  end

  def notify_requester_new_status(email, subject, body, request)
    @body = body
    @request = request
    @expert = request.expert
    mail(to: email, subject: subject) unless Rails.env.test?
  end

  def notify_expert_new_request(email, subject, body, request)
    @body = body
    @request = request
    @requester = request.requester
    mail(to: email, subject: subject) unless Rails.env.test?
  end

  def notify_expert_new_times(email, subject, body, request)
    @body = body
    @request = request
    @requester = request.requester
    mail(to: email, subject: subject) unless Rails.env.test?
  end

  def notify_requester_new_times(email, subject, body, request)
    @body = body
    @request = request
    @expert = request.expert
    mail(to: email, subject: subject) unless Rails.env.test?
  end
end