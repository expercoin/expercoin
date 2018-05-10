class CallLength
  def initialize(calls)
    @calls = calls
  end

  def average_length
    (total_length / total_calls.to_f).round(1)
  end

  def total_price
    
  end

  private

  def total_length
    mapped_length = @calls.map { |call| call.requested_length.to_i }
    mapped_length.sum
  end

  def total_calls
    @calls.count
  end
end
