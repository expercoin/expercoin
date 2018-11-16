# frozen_string_literal: true

# Date Time Validator
class DateTimeValidator
  def initialize(date, time, time_zone)
    @date = date
    @time = time
    @time_zone = time_zone
  end

  def valid?
    @date_time
  end

  def date_time_in_future?
    date_time_with_time_zone.utc > Time.now.utc
  end

  private

  def date_time
    @date_time ||= "#{@date} #{@time}".to_datetime
  end

  def date_time_with_time_zone
    @date_time_with_time_zone ||= DateTime.new
      .in_time_zone(@time_zone)
      .change(
        year: date_time.year,
        month: date_time.month,
        day: date_time.day,
        hour: date_time.hour,
        min: date_time.min,
        sec: date_time.sec
      )
  end
end
