# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/service_mailer
class ServiceMailerPreview < ActionMailer::Preview
  def published
    service = Service.published.where(owner: Profile.first).sample
    ServiceMailer.published(service)
  end
end
