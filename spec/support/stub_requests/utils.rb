# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'https://api.coinmarketcap.com/v1/ticker/ethereum/')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(
        status: 200,
        body: "[\n    {\n        \"id\": \"ethereum\", \n        \"name\": \"Ethereum\", \n        \"symbol\": \"ETH\", \n        \"rank\": \"2\", \n        \"price_usd\": \"539.197\", \n        \"price_btc\": \"0.0798828\", \n        \"24h_volume_usd\": \"1667150000.0\", \n        \"market_cap_usd\": \"54024114825.0\", \n        \"available_supply\": \"100193649.0\", \n        \"total_supply\": \"100193649.0\", \n        \"max_supply\": null, \n        \"percent_change_1h\": \"1.22\", \n        \"percent_change_24h\": \"0.54\", \n        \"percent_change_7d\": \"13.68\", \n        \"last_updated\": \"1529505862\"\n    }\n]",
        headers: {}
      )
  end
end
