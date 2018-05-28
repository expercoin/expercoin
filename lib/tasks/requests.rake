namespace :requests do
  desc "TODO"
  task create_test_requests: :environment do
    profiles = Profile.all
    profiles.each do |requester_profile|
      rand_num = rand(5..30)
      rand_num.times do
        profile = Profile.all.sample
        next if requester_profile == profile
        first_date = Faker::Time.forward(23, :morning)
        second_date = Faker::Time.forward(25, :day)
        third_date = Faker::Time.forward(28, :evening)
        request = Request.create!(
          status: 'pending',
          requester: requester_profile,
          expert: profile,
          updated_by: requester_profile,
          message: Faker::OnePiece.quote,
          title: Faker::Movie.quote,
          cell_number: Faker::PhoneNumber.cell_phone,
          first_date: first_date.to_date,
          first_time: first_date.to_time.strftime('%I:%M %p'),
          second_date: second_date.to_date,
          second_time: second_date.to_time.strftime('%I:%M %p'),
          third_date: third_date.to_date,
          third_time: third_date.to_time.strftime('%I:%M %p'),
          requested_length: ['15min', '30min', '45min'].sample,
          time_zone: "Eastern Time (US & Canada)"
        )
        puts "Request created, Requester: #{request.requester.id} Expert: #{request.expert.id} Message: #{request.message}"
      end
    end
  end
  desc "Update some requests to accepted"
  task update_requests_to_accepted: :environment do
    requests = Request.pending.sample(80)
    requests.each do |request|
      sugested_times = request.sugested_times.map(&:formated_datetime)
      request.update(
        status: 'accepted',
        selected_date: sugested_times.sample,
        updated_by: request.expert
      )
      puts "Request with id #{request.id} updated to status accepted"
    end
  end
  desc "Update some requests to completed"
  task update_requests_to_completed: :environment do
    requests = Request.accepted.sample(60)
    requests.each do |request|
      start_time = request.selected_date
      min_length = request.requested_length.to_i - 10
      max_length = request.requested_length.to_i + 10
      end_time = request.selected_date + rand(min_length..max_length).minutes
      request.update(
        status: :completed,
        started_at: start_time,
        ended_at: end_time,
        updated_by: request.expert
      )
      puts "Request with id #{request.id} updated to status completed"
    end
  end

end
