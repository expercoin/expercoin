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
          status: 0,
          requester: requester_profile,
          expert: profile,
          updated_by: requester_profile,
          message: Faker::OnePiece.quote,
          title: Faker::Movie.quote,
          cell_number: Faker::PhoneNumber.cell_phone,
          first_date: first_date.to_date,
          first_time: first_date.to_time,
          second_date: second_date.to_date,
          second_time: second_date.to_time,
          third_date: third_date.to_date,
          third_time: third_date.to_time,
          requested_length: ['15min', '30min', '45min'].sample
        )
      end
    end
  end

end