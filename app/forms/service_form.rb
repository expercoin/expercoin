class ServiceForm < FormObject
  attribute :rate, Float
  attribute :expercoin_rate, Float
  attribute :title, String
  attribute :content, String
  attribute :cover_image, String
  attribute :category_id, Integer
  attribute :owner_id, Integer

  validate :entered_rate
  validates_presence_of :title, :content

  private

  def calculated_rate
    ::PercentageCalculate.new(7, expercoin_rate).decrease
  end

  def entered_rate
    return errors.add(:rate, 'Wrong number') unless rate.round(2) == calculated_rate.round(2)
    self.expercoin_rate = expercoin_rate * 100
    self.rate = rate * 100
  end
end
