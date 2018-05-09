class ProfileRating
  def initialize(profile)
    @profile = profile
  end

  # def student_rating(student)
  #   reviews = MSP::Review.where(user: student, expert: @mentor)
  #   return nil if reviews.count.zero?
  #   calculate_rate reviews
  # end

  def average_rating
    reviews = @profile.reviews
    return nil if reviews.count.zero?
    calculate_rate reviews
  end

  private

  def calculate_rate(reviews)
    (reviews.sum(:rate).to_f / reviews.count).round(1)
  end
end
