# frozen_string_literal: true

class NotifyMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator
  TYPES = [
    OpenStruct.new(action: :notify_expert_new_status, role: :requester),
    OpenStruct.new(action: :notify_requester_new_status, role: :expert),
    OpenStruct.new(action: :notify_expert_new_request, role: :requester),
    OpenStruct.new(action: :notify_expert_new_times, role: :requester),
    OpenStruct.new(action: :notify_requester_new_times, role: :expert)
  ].freeze

  TYPES.each do |type|
    define_method type.action do |email, subject, body, request|
      @body = body
      @request = request
      instance_variable_set("@#{type.role}", request.send(type.role))
      mail_record = mail_record(email, request, subject, 'Notify')
      mail(to: email, subject: subject)
    end
  end
end
