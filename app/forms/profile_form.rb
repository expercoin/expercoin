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
    attribute :eth_address, String

    def update_categories(profile)
      categories = Category.where(id: category_ids)
      profile.categories = categories
    end

    def create_eth_address(profile)
      return unless valid_eth_address
      profile.eth_addresses << eth_address if eth_address
      profile.save
    end

    private

    def valid_eth_address
      return false unless eth_address.match(/^0x\w{16,}$/)
      true
    end
end
