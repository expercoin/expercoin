class OauthService
  attr_reader :auth_hash

  def initialize(auth_hash, user = nil)
    @auth_hash = auth_hash
    @user = user || find_or_create_user
  end

  def create_oauth_account!
    unless oauth_account = OauthAccount.where(uid: uid).first
      oauth_account = OauthAccount.new(oauth_account_params)
      oauth_account.user = @user
      oauth_account.save
    end
    @user.verified!
    oauth_account
  end

  private

  def oauth_account_params
    {
      uid: @auth_hash[:uid],
      provider: @auth_hash[:provider],
      image_url: @auth_hash[:info][:image],
      profile_url: @auth_hash[:info][:urls][:public_profile],
      raw_data: @auth_hash[:extra][:raw_info].to_json
    }
  end

  def find_or_create_user
    OauthAccount.find_by(uid: uid).try(:user) || User.create!(user_params)
  end

  def user_params
    {
      email: email,
      password: SecureRandom.hex(10),
      first_name: first_name,
      last_name: last_name
    }
  end

  def uid
    @auth_hash[:uid]
  end

  def email
    @auth_hash[:info][:email]
  end

  def first_name
    @auth_hash[:info][:first_name]
  end

  def last_name
    @auth_hash[:info][:last_name]
  end
end
