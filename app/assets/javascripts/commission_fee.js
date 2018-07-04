$(function(){
  commissionFeeInitialize();
});

$(document).on("turbolinks:load",function(){
  commissionFeeInitialize();
});

$(document).on("page:load",function(){
  commissionFeeInitialize();
});

function commissionFeeInitialize() {
  var commissionFee = parseFloat($('[data-rate="hourly"]').attr('data-fee')) / 100;
  var eth_usd_rate = parseFloat($('[data-rate="expercoin-eth"').attr('data-eth-usd-rate'));

  $('body').on('keyup', '[data-rate="expercoin"]', function(){
    var expercoin_amount = parseFloat($(this).val());
    var amount = expercoin_amount - (expercoin_amount * commissionFee);
    if(isNaN(amount)) return;
    $('[data-rate="hourly"]').val(amount.toFixed(2));
    $('[data-rate="expercoin-eth"]').text((expercoin_amount / eth_usd_rate));
  });

  $('body').on('keyup','[data-rate="hourly"]', function(){
    var reverseCommissionFee = ((100 - parseFloat($('[data-rate="hourly"]').attr('data-fee'))) * 0.01);
    var my_hourly_amount = parseFloat($(this).val());
    var amount = 1 / reverseCommissionFee *  my_hourly_amount;
    if(isNaN(amount)) return;
    $('[data-rate="expercoin"]').val(amount.toFixed(2));
    $('[data-rate="expercoin-eth"]').text((amount / eth_usd_rate));
  });
}
