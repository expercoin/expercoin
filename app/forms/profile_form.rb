class ProfileForm < FormObject
    attribute :first_name, String
    attribute :last_name, String
    attribute :name, String
    attribute :title, String
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
end
