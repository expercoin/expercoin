class MessageMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_message(message)
    @message = message
    mail(to: message.receiver.email, subject: 'New message on Expercoin')
  end

  def reply_message(message)
    @message = message
    @parent = message.parent
    mail(to: message.receiver.email, subject: 'New message on Expercoin')
  end
end
