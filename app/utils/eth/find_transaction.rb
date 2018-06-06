module Eth
  class FindTransaction
    API_KEY = 'PH26WWT52U6F4M9EQ1CUU6KCHF85AHCU8A'
    EXPERCOIN_ETH = '0xbfdbbA3223F3ec256eddE4916BdF343725481CFA'

    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def perform
      return false unless results.present?
      results.map{ |t| t if t['from'] == @tx_hash }.compact.last
    end

    private

    def results
      JSON.parse(open(url_string).read)['result']
    rescue StandardError
      []
    end

    def url_string
      "http://api.etherscan.io/api?module=account&action=txlist&address=#{EXPERCOIN_ETH}&sort=asc&apikey=#{API_KEY}"
    end
  end
end
