module MSP
  module Email
    def create_email_record(id, subject, meta)
      MailRecord.create(
        recipient_id: id,
        sent: true,
        subject: subject,
        meta: meta,
        mail_type: 'MSP'
      )
    end
  end
end