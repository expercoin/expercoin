
$(document).on("turbolinks:load",function(){
  if($('[data-transaction-screen]').length){
    // transactionRequestInitialize();
  }
});

function transactionRequestInitialize() {
  window.addEventListener('load', function () {
    if (typeof web3 !== 'undefined') {
      console.log('Web3 Detected! ' + web3.currentProvider.constructor.name)
      window.web3 = new Web3(web3.currentProvider);
      var toAddress = window._main_address;
      var ethAmount = window._eth_amount;

      web3.eth.sendTransaction({
        to: toAddress,
        value: web3.toWei(ethAmount, 'ether')
      }, function (error, result) {
        if (error) {
          document.getElementById('output').innerHTML = "Something went wrong!"
        } else {
          document.getElementById('output').innerHTML = "Track the payment: <a href='https://etherscan.io/tx/" + result + "'>https://etherscan.io/tx/" + result + "'"
        }
      });
    } else {
      document.getElementById('output').innerHtml = 'Please download and install Metamask: <a href="https://metamask.io/">https://metamask.io/</a>'
    }
  })

}