class PercentageCalculate
  def initialize(percentage, amount)
    @percentage = percentage.to_f
    @amount = amount.to_f
  end

  def decrease
    @amount - (@amount * @percentage / 100.0)
  end

  def increase
    (100.0 / reverse_percentage * @amount).to_f
  end

  private

  def reverse_percentage
    100.0 - @percentage
  end
end
