class MessageMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_message(message)
    add_attachments
    @message = message
    email = message.receiver.email
    subject = 'New message on Expercoin'
    mail_record = mail_record(email, message, subject)
    return unless is_confirmed?(email)
    mail(to: email, subject: subject)
    mail_record.update(sent: true)
  end

  def reply_message(message)
    add_attachments
    @message = message
    @parent = message.parent
    email = message.receiver.email
    subject = 'New message on Expercoin'
    mail_record = mail_record(email, message, subject)
    return unless is_confirmed?(email)
    mail(to: email, subject: subject)
    mail_record.update(sent: true)
  end

  private

  def mail_record(email, meta, subject)
    recipient_id = User.find_by_email(email).id
    MailRecord.create(
      recipient_id: recipient_id,
      sent: false,
      subject: subject,
      meta: meta.as_json,
      mail_type: 'Notify'
    )
  end
end
