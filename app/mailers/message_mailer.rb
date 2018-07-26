class MessageMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_message(message)
    add_attachments
    @message = message
    email = message.receiver.email
    subject = 'New message on Expercoin'
    mail_record = mail_record(email, message, subject, 'Message')
    send_mail(email, subject, mail_record)
  end

  def reply_message(message)
    add_attachments
    @message = message
    @parent = message.parent
    email = message.receiver.email
    subject = 'New message on Expercoin'
    mail_record = mail_record(email, message, subject, 'Message')
    send_mail(email, subject, mail_record)
  end
end
