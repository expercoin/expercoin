class RequestCalculator
  def initialize(request)
    @request = request
  end

  def calculate_cost(price)
    length.to_i * price.to_i
  end

  private

  def length
    @request.requested_length.to_i
  end
end
