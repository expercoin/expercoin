# frozen_string_literal: true

class DatetimeValidator
  def initialize(date, options = nil)
    @date = date.utc
    @options = options
  end

  def in_range
    (start_date.to_i..end_date.to_i).cover?(@date.to_i)
  end

  private

  def start_date
    @options[:start_date].utc
  end

  def end_date
    @options[:end_date].utc
  end
end
