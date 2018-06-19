# frozen_string_literal: true

class FloatFormater
  def initialize(number)
    @number = number.to_f
  end

  def with_dots
    return @number if number_formated?
    numbers_before_decimal << '.' << numbers_after_decimal.first(5) << '...'
  end

  private

  def numbers_after_decimal
    @number.to_s[/\.(.+)/, 1]
  end

  def numbers_before_decimal
    @number.to_s[/(.+)\./, 1]
  end

  def number_formated?
    @number.to_s.include?('e') || numbers_after_decimal.length < 6
  end
end
