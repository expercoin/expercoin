class ProfileForm < FormObject
  attribute :first_name, String
  attribute :last_name, String
  attribute :name, String
  attribute :title, String
  attribute :professional_role, String
  attribute :years_of_experience, Integer
  attribute :photo, 'PhotoUploader'
  attribute :photo_url, String
  attribute :rate, Float
  attribute :expercoin_rate, Float
  attribute :address, String
  attribute :country, String
  attribute :state, String
  attribute :city, String
  attribute :zip_code, String
  attribute :about, String
  attribute :category_ids, Array
  attribute :specialization, Hash

  validate :entered_rate

  def update_categories(profile)
    categories = Category.where(id: category_ids)
    profile.categories = categories
  end

  private

  def calculated_rate
    ::PercentageCalculate.new(7, expercoin_rate).decrease
  end

  def entered_rate
    return unless rate
    return errors.add(:rate, 'Wrong number') unless rate.round(5) == calculated_rate.round(5)
  end
end
