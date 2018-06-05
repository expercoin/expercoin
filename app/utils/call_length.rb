class CallLength
  def initialize(calls)
    @calls = calls
  end

  def average_length
    (total_requested_length / total_calls.to_f).round(1).to_i
  rescue StandardError
    0
  end

  def total_price; end

  def total_length
    mapped_length = @calls.map do |call|
      call.session_length || (call.ended_at - call.started_at) / 60
    end
    mapped_length.sum.to_i
  end

  private

  def total_requested_length
    mapped_length = @calls.map { |call| call.requested_length.to_i }
    mapped_length.sum.to_i
  end

  def total_calls
    @calls.count
  end
end
