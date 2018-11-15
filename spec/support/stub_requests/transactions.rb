# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, 'https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr')
      .with(
        body: '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917"],"id":1}',
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'Host' => 'ropsten.infura.io',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x0afa7af4e5420bb929d712c89b4ca95630200d29253235ad8ef97e8e68bfc577\",\"blockNumber\":\"0x3462f4\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x660147\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gasUsed\":\"0x5208\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x1\",\"to\":\"0xcbde01a6de9e0bb6f4053df9423008b2f5b08d40\",\"transactionHash\":\"0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917\",\"transactionIndex\":\"0x9\"}}\n", headers: {})

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

    stub_request(:post, 'https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr')
      .with(
        body: '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0x8b305a999064d73d751348af9ee89aa18f49eb58a350b59a6c0a691533becef5"],"id":1}',
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'Host' => 'ropsten.infura.io',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0xf49328a289ed7da060fe2a5800f31dba001874613fce3d5619e833188fa4a52f\",\"blockNumber\":\"0x4bcd9d\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x29fe46\",\"from\":\"0x926686387dcdcb812c244f25049945abfbe558d0\",\"gasUsed\":\"0x5208\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x1\",\"to\":\"0xcc42b587493bc5ebd850d44448888ec9bb65c9e4\",\"transactionHash\":\"0x8b305a999064d73d751348af9ee89aa18f49eb58a350b59a6c0a691533becef5\",\"transactionIndex\":\"0x4f\"}}\n", headers: {})

    stub_request(:post, 'https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr')
      .with(
        body: '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0x9642f3652dbdb01956611e67811183c635c7e2cb9311822240f5bfafc5a36135"],"id":1}',
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type' => 'application/json',
          'Host' => 'ropsten.infura.io',
          'User-Agent' => 'Ruby'
        }
      )
      .to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0xccc873ae9e67192b1524decd43c595c9bf25f2872bcf3ff7800142500d3d771f\",\"blockNumber\":\"0x4bc080\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x632798\",\"from\":\"0x926686387dcdcb812c244f25049945abfbe558d0\",\"gasUsed\":\"0xabb8\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x0\",\"to\":\"0xb5572c64f2dd352e68d7c708473838f1ac218d90\",\"transactionHash\":\"0x9642f3652dbdb01956611e67811183c635c7e2cb9311822240f5bfafc5a36135\",\"transactionIndex\":\"0xfc\"}}\n", headers: {})

      stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
        with(
          body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionByHash\",\"params\":[\"0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374\"],\"id\":1}",
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'Host'=>'ropsten.infura.io',
            'User-Agent'=>'Ruby'
          }).
          to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x4e9de2ef4b2a42a7a65dde8e6dc73869b8ef7718acface3db7922d4bd49e4334\",\"blockNumber\":\"0x437449\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gas\":\"0x33450\",\"gasPrice\":\"0x3b9aca00\",\"hash\":\"0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374\",\"input\":\"0x526576696577206d6573736167653a207267686572686572686572682c20726174653a2033\",\"nonce\":\"0x2b\",\"r\":\"0xdd5154fd01986259799aabe7377b8f4e9bb85e0ea2037b549a12cff63dacb0a1\",\"s\":\"0x51d92e15dbc53320552223ae29b67449f0f72b2ff8968b5b78f3d076dbd08f94\",\"to\":\"0xcbde01a6de9e0bb6f4053df9423008b2f5b08d40\",\"transactionIndex\":\"0x18\",\"v\":\"0x29\",\"value\":\"0x0\"}}", headers: {})

      stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
        with(
          body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionReceipt\",\"params\":[\"0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374\"],\"id\":1}",
          headers: {
      	  'Accept'=>'*/*',
      	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      	  'Content-Type'=>'application/json',
      	  'Host'=>'ropsten.infura.io',
      	  'User-Agent'=>'Ruby'
          }).
          to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x4e9de2ef4b2a42a7a65dde8e6dc73869b8ef7718acface3db7922d4bd49e4334\",\"blockNumber\":\"0x437449\",\"contractAddress\":null,\"cumulativeGasUsed\":\"0x18126e\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gasUsed\":\"0x5bdc\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x1\",\"to\":\"0xcbde01a6de9e0bb6f4053df9423008b2f5b08d40\",\"transactionHash\":\"0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374\",\"transactionIndex\":\"0x18\"}}", headers: {})

        stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
          with(
            body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionByHash\",\"params\":[\"0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539\"],\"id\":1}",
            headers: {
        	  'Accept'=>'*/*',
        	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        	  'Content-Type'=>'application/json',
        	  'Host'=>'ropsten.infura.io',
        	  'User-Agent'=>'Ruby'
            }).
          to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x6004f17d3b440b42981f8a61837022ea252073e31dd0454c4635ea9d64707bd4\",\"blockNumber\":\"\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gas\":\"0x2dc6c0\",\"gasPrice\":\"0x3b9aca00\",\"hash\":\"0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539\",\"input\":\"0x608060408190526004805460ff191690556060806104ad83398101604090815281516020830151919092015160008054600160a060020a0319908116331790915560018054600160a060020a03958616908316179055600391909155600280549390921692169190911790556104338061007a6000396000f30060806040526004361061008d5763ffffffff7c010000000000000000000000000000000000000000000000000000000060003504166324600fc381146100925780633306c905146100a95780633ea51b4a146100da57806350335810146101335780635d4ee2521461014b5780635e6b3b91146101a4578063b19c8a1a146101cb578063d321fe29146101e0575b600080fd5b34801561009e57600080fd5b506100a76101f5565b005b3480156100b557600080fd5b506100be61025a565b60408051600160a060020a039092168252519081900360200190f35b3480156100e657600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526100a79436949293602493928401919081908401838280828437509497506102699650505050505050565b34801561013f57600080fd5b506100a760043561031c565b34801561015757600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526100a794369492936024939284019190819084018382808284375094975061037e9650505050505050565b3480156101b057600080fd5b506101b9610395565b60408051918252519081900360200190f35b3480156101d757600080fd5b506100a761039b565b3480156101ec57600080fd5b506101b9610402565b600154600160a060020a0316331461020c57600080fd5b60045460ff161561021c57600080fd5b60008054604051600160a060020a0390911691303180156108fc02929091818181858888f19350505050158015610257573d6000803e3d6000fd5b50565b600154600160a060020a031690565b600254600160a060020a0316331461028057600080fd5b7f82d925c043a2eb8def88594d70814f576bc3a73e52b8f735a32498ba0ba34baf816040518080602001828103825283818151815260200191508051906020019080838360005b838110156102df5781810151838201526020016102c7565b50505050905090810190601f16801561030c5780820380516001836020036101000a031916815260200191505b509250505060405180910390a150565b600154600160a060020a0316331461033357600080fd5b600254604051600160a060020a039091169082156108fc029083906000818181858888f1935050505015801561036d573d6000803e3d6000fd5b50506004805460ff19166001179055565b600054600160a060020a0316331461028057600080fd5b60035490565b600154600160a060020a031633146103b257600080fd5b60045460ff1615156103c357600080fd5b600154600160a060020a03166108fc6103da610402565b6040518115909202916000818181858888f19350505050158015610257573d6000803e3d6000fd5b3031905600a165627a7a72305820a18e76e3bcc0cd4210b6409128ffa04d15a20fc2a7de27b28839c34f891425bc0029000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d40000000000000000000000000cf827998ea2aa7c4fee48b08ab4be80e12bec0430000000000000000000000000000000000000000000000000000000000000001000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d40000000000000000000000000cf827998ea2aa7c4fee48b08ab4be80e12bec04300000000000000000000000000000000000000000000000000000000000000e4\",\"nonce\":\"0x45\",\"r\":\"0xb7c7f6ec25ecaa2a4d3db62fe5fadd54faf506055ac53bf6be04dd4931d0eda7\",\"s\":\"0x487c6614e8301ff1eb3e14c18cec0a07698f87a40c985265d4b7273298f07bdf\",\"to\":null,\"transactionIndex\":\"0x14\",\"v\":\"0x2a\",\"value\":\"0x1dba6ac14fbf7e\"}}", headers: {})

       stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
         with(
           body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getTransactionReceipt\",\"params\":[\"0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539\"],\"id\":1}",
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/json',
       	  'Host'=>'ropsten.infura.io',
       	  'User-Agent'=>'Ruby'
           }).
           to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":{\"blockHash\":\"0x6004f17d3b440b42981f8a61837022ea252073e31dd0454c4635ea9d64707bd4\",\"blockNumber\":\"\",\"contractAddress\":\"0x6be86bf4492799e80467099abf1cdff65f7386d5\",\"cumulativeGasUsed\":\"0x1ee99e\",\"from\":\"0x1f606341b4785450e7c861374fe54f746100ae21\",\"gasUsed\":\"0x69786\",\"logs\":[],\"logsBloom\":\"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\",\"status\":\"0x1\",\"to\":null,\"transactionHash\":\"0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539\",\"transactionIndex\":\"0x14\"}}", headers: {})

       stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
         with(
           body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_call\",\"params\":[{\"to\":\"0x6be86bf4492799e80467099abf1cdff65f7386d5\",\"data\":\"0x3306c905\"},\"latest\"],\"id\":1}",
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/json',
       	  'Host'=>'ropsten.infura.io',
       	  'User-Agent'=>'Ruby'
           }).
           to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":\"0x000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d40\"}", headers: {})

     stub_request(:post, "https://ropsten.infura.io/MjN1T5xZTKT9DP3KsBXr").
       with(
         body: "{\"jsonrpc\":\"2.0\",\"method\":\"eth_call\",\"params\":[{\"to\":\"0x6be86bf4492799e80467099abf1cdff65f7386d5\",\"data\":\"0xd321fe29\"},\"latest\"],\"id\":1}",
         headers: {
     	  'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'Content-Type'=>'application/json',
     	  'Host'=>'ropsten.infura.io',
     	  'User-Agent'=>'Ruby'
         }).
         to_return(status: 200, body: "{\"jsonrpc\":\"2.0\",\"id\":1,\"result\":\"0x000000000000000000000000000000000000000000000000001dba6ac14fbf7e\"}", headers: {})

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
