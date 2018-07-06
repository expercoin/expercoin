module OmniauthMacros
  def mock_auth_hash
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
      'provider' => 'linkedin',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url',
        'first_name' => 'john',
        'last_name' => 'doe',
        'email' => 'john@doe.com',
        'urls' => {
          'public_profile' => 'http://test.test/public_profile'
        }
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      },
      'extra' => {
        'raw_info' => '{"json":"data"}'
      }
    }.with_indifferent_access)
    OmniAuth.config.test_mode = true
  end
end
