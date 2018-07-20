class AdminMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def new_offer(offer)
    add_attachments
    @offer = offer
    subject = 'New Offer submitted'
    mail(to: 'mentor@expercoin.com', subject: subject)
    mail_record(offer, subject)
  end

  private

  def mail_record(meta, subject)
    MailRecord.create(
      sent: true,
      subject: subject,
      meta: meta.as_json,
      mail_type: 'Admin'
    )
  end
end
