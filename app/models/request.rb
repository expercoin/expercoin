class Request < ApplicationRecord

  TIMEZONES = ActiveSupport::TimeZone::MAPPING.keys
  DATETIMES = [
    %I[first_time first_date],
    %I[second_time second_date],
    %I[third_time third_date]
  ].freeze

  belongs_to :requester, class_name: 'Profile', foreign_key: 'requester_id'
  belongs_to :expert, class_name: 'Profile', foreign_key: 'expert_id'
  belongs_to :updated_by, class_name: 'Profile', foreign_key: 'updated_by_id'
 
  has_one :review

  enum requested_length: %w[15min 30min 45min]
  enum status: %I[draft pending accepted inprogress completed rejected upcoming expired closed]

  validates(
    :title,
    :message,
    :first_time,
    :first_date,
    :second_time,
    :second_date,
    :third_time,
    :third_date,
    :cell_number,
    presence: true
  )

  validate :dates_cannot_be_in_past
  validate :date_must_be_from_request_date_list, on: :update
  # validate :must_be_able_to_pay_call_on_accepts, on: :update

  def must_be_able_to_pay_call_on_accepts
    return unless status_was == 'pending'
    return if MSP::Stripe::SetupTransaction.new(self).can_pay_amount?
    errors.add(:status, 'not enough funds to pay')
  end

  def date_must_be_from_request_date_list
    return unless selected_date
    return if sugested_times.map(&:formated_datetime).include?(selected_date)
    errors.add(:selected_date, 'must be from the list')
  end

  def dates_cannot_be_in_past
    DATETIMES.each do |datetime|
      dt = "#{send(datetime[1])} #{send(datetime[0])}".to_datetime
      next unless dt < Time.now
      errors.add(datetime[1], "can't be in the past")
      times_cannot_be_in_past(datetime[0])
    rescue
      errors.add(datetime[1], "can't be in the past")
    end
  end

  def times_cannot_be_in_past(time)
    dt = "#{Time.now.to_date} #{send(time)}".to_datetime
    return unless dt < Time.now
    errors.add(time, "can't be in the past")
  rescue
    errors.add(time, "can't be in the past")
  end

  def sugested_times
    datetimes = []
    DATETIMES.each do |datetime|
      dt = "#{send(datetime[1])} #{send(datetime[0])}".to_datetime
      os = OpenStruct.new(
        timezone_datetime: dt.in_time_zone(time_zone),
        formated_datetime: dt
      )
      datetimes << os
    end
    datetimes
  end

  DATETIMES.each do |datetime|
    define_method "formated_#{datetime[1]}" do
      send(datetime[1]).strftime('%a %b %d, %Y')
    end
  end
end
