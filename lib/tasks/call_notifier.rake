namespace :call_notifier do
  desc "Call Notify in 24 hours"
  task notify: :environment do
    Request.verified.one_day_to_call.each do |request|
      expert_id = request.expert.user_id
      requester_id = request.requester.user_id
      unless MailRecord.find_by(meta: request.email_identifier, recipient_id: expert_id)
        puts "Send Expert #{expert_id}"
        RemindMailer.call_remind_expert(request).deliver_now
      end
      unless MailRecord.find_by(meta: request.email_identifier, recipient_id: requester_id)
        puts "Send Client #{requester_id}"
        RemindMailer.call_remind_requester(request).deliver_now
      end
    end
  end
end


