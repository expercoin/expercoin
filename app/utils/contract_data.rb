module ContractData
  def abi
    [
      {
        "constant": false,
        "inputs": [
          {
            "name": "message",
            "type": "string"
          }
        ],
        "name": "clientReview",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "constant": false,
        "inputs": [
          {
            "name": "message",
            "type": "string"
          }
        ],
        "name": "expertReview",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": false,
            "name": "message",
            "type": "string"
          }
        ],
        "name": "Rating",
        "type": "event"
      },
      {
        "constant": false,
        "inputs": [
          {
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "releaseExpertFunds",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "constant": false,
        "inputs": [],
        "name": "releaseSiteFunds",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "name": "siteAddress",
            "type": "address"
          },
          {
            "name": "expertAddress",
            "type": "address"
          },
          {
            "name": "_callID",
            "type": "uint256"
          }
        ],
        "payable": true,
        "stateMutability": "payable",
        "type": "constructor"
      },
      {
        "constant": false,
        "inputs": [],
        "name": "withdrawFunds",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "constant": true,
        "inputs": [],
        "name": "getAmount",
        "outputs": [
          {
            "name": "",
            "type": "uint256"
          }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      },
      {
        "constant": true,
        "inputs": [],
        "name": "getCallId",
        "outputs": [
          {
            "name": "",
            "type": "uint256"
          }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      },
      {
        "constant": true,
        "inputs": [],
        "name": "getSiteAddress",
        "outputs": [
          {
            "name": "",
            "type": "address"
          }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
      }
    ]
  end

  def code
    '0x608060408190526004805460ff191690556060806104ad83398101604090815281516020830151919092015160008054600160a060020a0319908116331790915560018054600160a060020a03958616908316179055600391909155600280549390921692169190911790556104338061007a6000396000f30060806040526004361061008d5763ffffffff7c010000000000000000000000000000000000000000000000000000000060003504166324600fc381146100925780633306c905146100a95780633ea51b4a146100da57806350335810146101335780635d4ee2521461014b5780635e6b3b91146101a4578063b19c8a1a146101cb578063d321fe29146101e0575b600080fd5b34801561009e57600080fd5b506100a76101f5565b005b3480156100b557600080fd5b506100be61025a565b60408051600160a060020a039092168252519081900360200190f35b3480156100e657600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526100a79436949293602493928401919081908401838280828437509497506102699650505050505050565b34801561013f57600080fd5b506100a760043561031c565b34801561015757600080fd5b506040805160206004803580820135601f81018490048402850184019095528484526100a794369492936024939284019190819084018382808284375094975061037e9650505050505050565b3480156101b057600080fd5b506101b9610395565b60408051918252519081900360200190f35b3480156101d757600080fd5b506100a761039b565b3480156101ec57600080fd5b506101b9610402565b600154600160a060020a0316331461020c57600080fd5b60045460ff161561021c57600080fd5b60008054604051600160a060020a0390911691303180156108fc02929091818181858888f19350505050158015610257573d6000803e3d6000fd5b50565b600154600160a060020a031690565b600254600160a060020a0316331461028057600080fd5b7f82d925c043a2eb8def88594d70814f576bc3a73e52b8f735a32498ba0ba34baf816040518080602001828103825283818151815260200191508051906020019080838360005b838110156102df5781810151838201526020016102c7565b50505050905090810190601f16801561030c5780820380516001836020036101000a031916815260200191505b509250505060405180910390a150565b600154600160a060020a0316331461033357600080fd5b600254604051600160a060020a039091169082156108fc029083906000818181858888f1935050505015801561036d573d6000803e3d6000fd5b50506004805460ff19166001179055565b600054600160a060020a0316331461028057600080fd5b60035490565b600154600160a060020a031633146103b257600080fd5b60045460ff1615156103c357600080fd5b600154600160a060020a03166108fc6103da610402565b6040518115909202916000818181858888f19350505050158015610257573d6000803e3d6000fd5b3031905600a165627a7a72305820a18e76e3bcc0cd4210b6409128ffa04d15a20fc2a7de27b28839c34f891425bc0029000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d40000000000000000000000000cf827998ea2aa7c4fee48b08ab4be80e12bec0430000000000000000000000000000000000000000000000000000000000000001'
  end
end
