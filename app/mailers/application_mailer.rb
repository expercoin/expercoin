# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def is_confirmed?(email)
    User.find_by_email(email).confirmed?
  end
end
