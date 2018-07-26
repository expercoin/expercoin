class EmailAddressFilter
  def self.delivering_email(message)
    emails = message.to
    message.perform_deliveries = false
    emails.each do |email|
      user = User.find_by(email: email)
      return unless email.match(/@expercoin.com/) || user.try(:confirmed?)
    end
    message.perform_deliveries = true
  end
end

ActionMailer::Base.register_interceptor(EmailAddressFilter)
