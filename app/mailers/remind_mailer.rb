class RemindMailer < ApplicationMailer
  default from: 'support@expercoin.com'
  helper :decorator

  def call_remind_expert(request)
    add_attachments
    @request = request
    email = request.expert.user.email
    subject = "You have scheduled call session at #{request.selected_date}"
    mail_record = mail_record(email, request, subject, 'Remind')
    event
    mail(to: email, subject: subject)
  end

  def call_remind_requester(request)
    add_attachments
    @request = request
    @request = request
    email = request.requester.user.email
    subject = "You have scheduled call session at #{request.selected_date}"
    mail_record = mail_record(email, request, subject, 'Remind')
    event
    mail(to: email, subject: subject)
  end

  private

  def event
    ical = Icalendar::Calendar.new
    e = Icalendar::Event.new
    e.dtstart =  DateTime.parse((@request.selected_date).to_s)
    e.dtend   =  DateTime.parse((@request.selected_date+@request.requested_length_in_minutes).to_s)
    e.summary = @request.title
    e.organizer = 'support@expercoin.com'
    e.description = ""
    e.ip_class    = "PRIVATE"
    ical.add_event(e)
    ical.publish
    attachments['event.ics'] = { mime_type: 'text/calendar', content: ical.to_ical }
  end
end
