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
  attribute :zip_code, Integer
  attribute :about, String
  attribute :category_ids, Array
  attribute :specialization, Hash

  validate :entered_rate

  def initialize(*attrs)
    super
    self.rate = rate_from_hex if rate =~ /\A0x\w+/
    self.expercoin_rate = expercoin_rate_from_hex if expercoin_rate =~ /\A0x\w+/
  end

  def update_categories(profile)
    categories = Category.where(id: category_ids)
    profile.categories = categories
  end

  private

  def calculated_rate
    ::PercentageCalculate.new(7, expercoin_rate).decrease
  end

  def rate_to_hex
    Eth::ValueFormatter.new(rate).to_hex
  end

  def rate_from_hex
    Eth::ValueFormatter.new(rate).from_hex
  end

  def expercoin_rate_from_hex
    Eth::ValueFormatter.new(expercoin_rate).from_hex
  end

  def expercoin_rate_to_hex
    Eth::ValueFormatter.new(expercoin_rate).to_hex
  end

  def entered_rate
    return unless rate
    return errors.add(:rate, 'Wrong number') unless rate.round(5) == calculated_rate.round(5)
    self.rate = rate_to_hex
    self.expercoin_rate = expercoin_rate_to_hex
  end
end
