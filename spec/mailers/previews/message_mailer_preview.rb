# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  def new_message
    message = Message.where(parent: nil).last
    MessageMailer.new_message(message)
  end

  def reply_message
    message = Message.where.not(parent: nil).last
    MessageMailer.reply_message(message)
  end
end
