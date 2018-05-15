namespace :requests do
  desc "TODO"
  task create_test_requests: :environment do
    profiles = Profile.all
    profiles.each do |requester_profile|
      rand_num = rand(1..20)
      rand_num.times do
        profile = Profile.find_by(id: rand(1..30))
        next if requester_profile == profile
        first_date = Faker::Time.forward(23, :morning)
        second_date = Faker::Time.forward(25, :day)
        third_date = Faker::Time.forward(28, :evening)
        Request.create!(
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
      end
    end
  end
  desc "Update some requests to accepted"
  task update_requests_to_accepted: :environment do
    35.times do
      request = Request.pending.sample
      next unless request
      sugested_times = request.sugested_times.map(&:formated_datetime)
      request.update(
        status: 'accepted',
        selected_date: sugested_times.sample,
        updated_by: request.expert
      )
    end
  end
  desc "Update some requests to completed"
  task update_requests_to_completed: :environment do
    20.times do
      request = Request.accepted.sample
      next unless request
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
      request.save
    end
  end

end
