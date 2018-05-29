class MessageMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_message(message)
    @message = message
    mail(to: message.receiver.email, subject: 'New message on Expercoin') unless Rails.env.test?
  end
end
