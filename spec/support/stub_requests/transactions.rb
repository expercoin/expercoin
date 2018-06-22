# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, 'https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr')
      .with(
        body: '{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params":["0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917"],"id":1}',
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'Host' => 'ropsten.infura.io',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(
        status: 200,
        body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x0afa7af4e5420bb929d712c89b4ca95630200d29253235ad8ef97e8e68bfc577\",\"blockNumber\":\"0x3462f4\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gas\":\"0x5208\",\"gasPrice\":\"0xee6b2800\",\"hash\":\"0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917\",\"input\":\"0x\",\"nonce\":\"0x1\",\"to\":\"0xcbde01a6de9e0bb6f4053df9423008b2f5b08d40\",\"transactionIndex\":\"0x9\",\"value\":\"0x354a6ba7a18000\",\"v\":\"0x2a\",\"r\":\"0xfffe4635b1e9ebb0f429b99544d56e3c58636712616846df70a4890fa89e8c8f\",\"s\":\"0x45a2130095b2a3514f4ba597b70d6c64ad89c3e056e79738fb710bdf2dd2a3df\"}}\n",
        headers: {}
      )

    stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
        with(
          body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionReceipt\",\"params\":[\"0x8b305a999064d73d751348af9ee89aa18f49eb58a350b59a6c0a691533becef5\"],\"id\":1}",
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'Host'=>'ropsten.infura.io',
        'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0xf49328a289ed7da060fe2a5800f31dba001874613fce3d5619e833188fa4a52f\",\"blockNumber\":\"0x4bcd9d\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x29fe46\",\"from\":\"0x926686387dcdcb812c244f25049945abfbe558d0\",\"gasUsed\":\"0x5208\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x1\",\"to\":\"0xcc42b587493bc5ebd850d44448888ec9bb65c9e4\",\"transactionHash\":\"0x8b305a999064d73d751348af9ee89aa18f49eb58a350b59a6c0a691533becef5\",\"transactionIndex\":\"0x4f\"}}\n", headers: {})

        stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
        with(
          body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionReceipt\",\"params\":[\"0x9642f3652dbdb01956611e67811183c635c7e2cb9311822240f5bfafc5a36135\"],\"id\":1}",
          headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'Host'=>'ropsten.infura.io',
        'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0xccc873ae9e67192b1524decd43c595c9bf25f2872bcf3ff7800142500d3d771f\",\"blockNumber\":\"0x4bc080\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x632798\",\"from\":\"0x926686387dcdcb812c244f25049945abfbe558d0\",\"gasUsed\":\"0xabb8\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x0\",\"to\":\"0xb5572c64f2dd352e68d7c708473838f1ac218d90\",\"transactionHash\":\"0x9642f3652dbdb01956611e67811183c635c7e2cb9311822240f5bfafc5a36135\",\"transactionIndex\":\"0xfc\"}}\n", headers: {})

    stub_request(:post, 'http://localhost:3001/transactions')
      .with(
        body: { 'address' => /0x\w{40}/, 'amount' => '2500000000000000', 'api_key' => 'MjN1T5xZTKT9DP3KsBXr', 'from' => /0x\w{40}/, 'key' => '710f751aa5f90f63597dac37fa339985bf635fa24c657a740fed26b13ca0fb11' },
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Host' => 'localhost:3001',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200,
                 body: { hash: '0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917' }.to_json,
                 headers: {})
  end
end
