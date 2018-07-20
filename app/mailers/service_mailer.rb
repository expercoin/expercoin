class ServiceMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def published(service)
    @service = service
    email = service.owner.user.email
    subject = 'Your offer has been published'
    mail_record = mail_record(email, service, subject)
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
      mail_type: 'Service'
    )
  end
end
