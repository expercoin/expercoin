module MSP
  module Email
    def create_email_record(id, subject, body)
      MailRecord.create(
        recipient_id: id,
        sent: true,
        subject: subject,
        body: body,
        meta: { 
          body: body
        },
        mail_type: 'MSP'
      )
    end
  end
end