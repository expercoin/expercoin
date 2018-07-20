class RemindMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def call_remind_expert(request)
    @request = request
    email = request.expert.user.email
    subject = "You have scheduled call session at #{request.selected_date}"
    mail_record = mail_record(email, request, subject)
    return unless is_confirmed?(email)
    mail(to: email, subject: subject)
    mail_record.update(sent: true)
  end

  def call_remind_requester(request)
    @request = request
    email = request.requester.user.email
    subject = "You have scheduled call session at #{request.selected_date}"
    mail_record = mail_record(email, request, subject)
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
      mail_type: 'Remind'
    )
  end
end
