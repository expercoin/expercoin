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
  $('body').on('keyup', '[data-rate="expercoin"]', function(){
    var expercoin_amount = parseFloat($(this).val());
    var amount = expercoin_amount - (expercoin_amount * commissionFee);
    if(isNaN(amount)) return;
    $('[data-rate="hourly"]').val(amount);
  });

  $('body').on('keyup','[data-rate="hourly"]', function(){
    var reverseCommissionFee = ((100 - parseFloat($('[data-rate="hourly"]').attr('data-fee'))) * 0.01);
    var my_hourly_amount = parseFloat($(this).val());
    var amount = 1 / reverseCommissionFee *  my_hourly_amount;
    if(isNaN(amount)) return;
    $('[data-rate="expercoin"]').val(amount);
  });
}
