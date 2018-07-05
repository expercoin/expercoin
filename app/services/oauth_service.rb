class OauthService
  attr_reader :auth_hash

  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def create_oauth_account!
    unless oauth_account = OauthAccount.where(uid: @auth_hash[:uid]).first
      oauth_account = OauthAccount.create!(oauth_account_params)
    end
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

end
