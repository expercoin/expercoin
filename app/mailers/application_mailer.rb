# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def is_confirmed?(email)
    User.find_by_email(email).confirmed?
  end

  def add_attachments
    attachments.inline['expercoin_logo.png'] = File.read(
      "#{Rails.root}/public/images/expercoin_logo.png"
    )
  end

  def send_mail(email, subject, mail_record)
    send_mail = mail(to: email, subject: subject)
    mail_record.update(sent: true) if EmailAddressFilter.delivering_email(send_mail)
  end

  def mail_record(email, meta, subject, type)
    recipient_id = User.find_by_email(email).id
    MailRecord.create(
      recipient_id: recipient_id,
      sent: false,
      subject: subject,
      meta: meta.email_identifier,
      mail_type: type
    )
  end
end
