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
  $('[data-rate="expercoin"]').on('keyup', function(){
    var my_hourly = $('[data-rate="hourly"]');
    var expercoin_amount = parseFloat($(this).val());
    var my_hourly_amount = parseFloat(my_hourly.val());
    var amount = expercoin_amount - (expercoin_amount * commissionFee);
    if(isNaN(amount)) return;
    $('[data-rate="hourly"]').val(amount.toFixed(2));
  });

  $('[data-rate="hourly"]').on('keyup', function(){
    var reverseCommissionFee = ((100 - parseFloat($('[data-rate="hourly"]').attr('data-fee'))) * 0.01);
    var expercoin = $('[data-rate="expercoin"]');
    var expercoin_amount = parseFloat(expercoin.val());
    var my_hourly_amount = parseFloat($(this).val());
    var amount = 1 / reverseCommissionFee *  my_hourly_amount;
    if(isNaN(amount)) return;
    $('[data-rate="expercoin"]').val(amount.toFixed(2));
  });
}
