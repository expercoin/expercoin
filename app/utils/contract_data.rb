module ContractData
  def abi
    [
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
      },
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
        "name": "releaseExpertFunds",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
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
        "constant": false,
        "inputs": [
          {
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "releaseSiteFunds",
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
      }
    ]
  end

  def code
    '0x60806040818152806102d883398101604052805160209091015160008054600160a060020a0319908116331790915560018054600160a060020a03909416939091169290921790915560025561027e8061005a6000396000f3006080604052600436106100775763ffffffff7c010000000000000000000000000000000000000000000000000000000060003504166324600fc3811461007c5780633306c905146100935780633fcb6ba3146100c45780635e6b3b91146100e857806383d4c23b1461010f578063d321fe2914610127575b600080fd5b34801561008857600080fd5b5061009161013c565b005b34801561009f57600080fd5b506100a8610191565b60408051600160a060020a039092168252519081900360200190f35b3480156100d057600080fd5b50610091600435600160a060020a03602435166101a0565b3480156100f457600080fd5b506100fd6101f2565b60408051918252519081900360200190f35b34801561011b57600080fd5b506100916004356101f8565b34801561013357600080fd5b506100fd61024d565b600154600160a060020a0316331461015357600080fd5b60008054604051600160a060020a0390911691303180156108fc02929091818181858888f1935050505015801561018e573d6000803e3d6000fd5b50565b600154600160a060020a031690565b600154600160a060020a031633146101b757600080fd5b604051600160a060020a0382169083156108fc029084906000818181858888f193505050501580156101ed573d6000803e3d6000fd5b505050565b60025490565b600154600160a060020a0316331461020f57600080fd5b600154604051600160a060020a039091169082156108fc029083906000818181858888f19350505050158015610249573d6000803e3d6000fd5b5050565b3031905600a165627a7a72305820431d383d01b8e18fa3fabddc976d3a6e19755e89414f3105cbfc731bcc11de960029000000000000000000000000cbde01a6de9e0bb6f4053df9423008b2f5b08d400000000000000000000000000000000000000000000000000000000000000064'
  end
end
