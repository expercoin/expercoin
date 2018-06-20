# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, /robohash.org/)
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'CarrierWave/1.2.2'
        }
      )
      .to_return(
        status: 200,
        body: File.open("#{Rails.root}/public/images/expercoin_logo.png").read,
        headers: { 'Content-Type' => 'image/png' }
      )
  end
end
