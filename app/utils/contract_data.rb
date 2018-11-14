module ContractData
  def abi
    [
      {
        "constant": false,
        "inputs": [
          {
            "name": "amount",
            "type": "uint256"
          },
          {
            "name": "expert",
            "type": "address"
          }
        ],
        "name": "relaseExpertFunds",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "constant": false,
        "inputs": [
          {
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "relaseSiteFunds",
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
        "name": "witdrawFunds",
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
    '0x60806040818152806102d883398101604052805160209091015160008054600160a060020a0319908116331790915560018054600160a060020a03909416939091169290921790915560025561027e8061005a6000396000f3006080604052600436106100775763ffffffff7c01000000000000000000000000000000000000000000000000000000006000350416633306c905811461007c5780635e6b3b91146100ad5780636e4fb97e146100d4578063c64564af146100ee578063d321fe2914610112578063d49c5edf14610127575b600080fd5b34801561008857600080fd5b5061009161013c565b60408051600160a060020a039092168252519081900360200190f35b3480156100b957600080fd5b506100c261014b565b60408051918252519081900360200190f35b3480156100e057600080fd5b506100ec600435610151565b005b3480156100fa57600080fd5b506100ec600435600160a060020a03602435166101a6565b34801561011e57600080fd5b506100c26101f8565b34801561013357600080fd5b506100ec6101fd565b600154600160a060020a031690565b60025490565b600154600160a060020a0316331461016857600080fd5b600154604051600160a060020a039091169082156108fc029083906000818181858888f193505050501580156101a2573d6000803e3d6000fd5b5050565b600154600160a060020a031633146101bd57600080fd5b604051600160a060020a0382169083156108fc029084906000818181858888f193505050501580156101f3573d6000803e3d6000fd5b505050565b303190565b600154600160a060020a0316331461021457600080fd5b60008054604051600160a060020a0390911691303180156108fc02929091818181858888f1935050505015801561024f573d6000803e3d6000fd5b505600a165627a7a723058205ac5927f7353bfc8e99a62b3dd5da823c19b0fa7ba0d8f3bc99e16786a8602510029000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d40000000000000000000000000000000000000000000000000000000000000000c'
  end
end
