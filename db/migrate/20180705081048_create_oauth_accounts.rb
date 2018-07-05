class CreateOauthAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :oauth_accounts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :uid
      t.string :provider
      t.string :image_url
      t.string :profile_url
      t.string :access_token
      t.text :raw_data

      t.timestamps
    end
  end
end
