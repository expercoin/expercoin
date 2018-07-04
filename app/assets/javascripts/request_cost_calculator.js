function RequestCostCalculactor(eth_usd_rate) {
  var length = getLength();
  var price = getExpertRate() / eth_usd_rate;

  return length * price;

  function getLength() {
    var length = $("[data-request='length']").val();
    return parseInt(length);
  }

  function getExpertRate() {
    var rate = $("[data-request='expert_rate']").val();
    return parseFloat(rate);
  }
}
