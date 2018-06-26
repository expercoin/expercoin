class ServiceRating
  def initialize(service)
    @service = service
  end

  def average_rating
    reviews = @service.profiles.map(&:reviews).flatten
    return nil if reviews.count.zero?
    calculate_rate reviews
  end

  private

  def calculate_rate(reviews)
    (reviews.sum(&:rate).to_f / reviews.count).round(1)
  end
end
