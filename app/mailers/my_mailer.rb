class MyMailer < Devise::Mailer
  helper :application 
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  def confirmation_instructions(record, token, opts={})
    mail_record(record.id, record, "Confirmation")
    super
  end
end
