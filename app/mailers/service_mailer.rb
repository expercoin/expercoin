class ServiceMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def published(service)
    add_attachments
    @service = service
    email = service.owner.user.email
    subject = 'Your offer has been published'
    mail_record = mail_record(email, service, subject, 'Service')
    send_mail(email, subject, mail_record)
  end
end
