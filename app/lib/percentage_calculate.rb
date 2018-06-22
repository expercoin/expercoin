class PercentageCalculate
  def initialize(percentage, amount)
    @percentage = percentage.to_f
    @amount = amount.to_f
  end

  def decrease
    @amount * reverse_percentage
  end

  def increase
    @amount / reverse_percentage
  end

  private

  def reverse_percentage
    (100.0 - @percentage) / 100
  end
end
