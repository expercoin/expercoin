# Preview all emails at http://localhost:3000/rails/mailers/remind_mailer
class RemindMailerPreview < ActionMailer::Preview
  def call_remind_expert
    request = Request.accepted.where(expert: Profile.first).last
    RemindMailer.call_remind_expert(request)
  end

  def call_remind_requester
    request = Request.accepted.where(requester: Profile.first).last
    RemindMailer.call_remind_requester(request)
  end

end
