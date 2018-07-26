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

  def mail_record(email, meta, subject, type)
    recipient_id = User.find_by_email(email).id
    MailRecord.create(
      recipient_id: recipient_id,
      sent: false,
      subject: subject,
      meta: meta.to_json,
      mail_type: type
    )
  end
end
