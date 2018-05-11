class PercentageCalculate
  def initialize(percentage, amount)
    @percentage = percentage.to_f
    @amount = amount.to_f
  end

  def decrease
    @amount - (@amount * percentage_divided)
  end

  def increase
    1 / reverse_percentage_divided *  @amount;
  end

  private

  def reverse_percentage_divided
    (100.0 - @percentage) / 100.0
  end

  def percentage_divided
    @percentage / 100.0
  end
end
