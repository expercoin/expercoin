class MyMailer < Devise::Mailer
  helper :application 
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'
  def confirmation_instructions(record, token, opts={})
    mail_record(record.id, record, "Confirmation")
    super
  end

  def mail_record(recipient_id, meta, subject)
    MailRecord.create(
      recipient_id: recipient_id,
      sent: true,
      subject: subject,
      meta: meta.as_json,
      mail_type: 'Devise'
    )
  end
end
