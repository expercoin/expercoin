// $(function(){
//   requestFormInitialize();
// });
//= require request_cost_calculator

$(document).on("turbolinks:load",function(){
  requestFormInitialize();
});

function requestFormInitialize() {
  var pickerOptsGeneral = {
    format: "D M dd yyyy",
    autoclose: true,
    todayHighlight: true
  };

  $('.date-picker-input').datepicker(pickerOptsGeneral).on('changeDate', function(event) {
    if ( $(this).not('input') ) {
      var selected_date = new Date(event.date);
      $(this).parent().find('input').val(selected_date.toDateString());
    }
  });

  $('.pick-time').timepicker();

  $('[data-block*="-form"]').hide();

  $('[data-block*="-toggle"]').on('click', function(e){
    e.preventDefault();
    belongs = $(this).data()['block'].split('-')[0];
    $('[data-block*="' + belongs +'-info"]').toggle();
    $('[data-block*="' + belongs +'-form"]').toggle();
    // Calculating cost
    // --------------------------------------------
    var length = $('#request_requested_length').val();
    length = /\d+/g.exec(length);
    var price = $('[data-request="price"]').html();
    price = /\d+.*/g.exec(price);
    var cost = price * length;
    $('[data-request="length"]').html(length);
    var cryptocurrency = window._cryptocurrency;
    $('[data-request="cost"]').html('$' + cost);
    // --------------------------------------------
    $(this).html() === "Change" ? $(this).html('Cancel') : $(this).html('Change');
  });

  $('.select-picker-tags').each(function(i, element) {
    var existingTags = $(this).data('existing-tags');
    var data = [];

    if (existingTags) {
      var tags = existingTags.split(',');

      tags.forEach(function(tag, index) {
        data.push( { id: tag, text: tag } );
      });

      $(this).select2({
        width: '100%',
        allowClear: true,
        multiple: true,
        data: data
      });

    } else {
      $(this).select2({
        width: '100%',
        allowClear: true,
        multiple: true,
        tags: true,
        formatNoMatches: function() {
          return '';
        }
      });
    }
  });

  // EXPR and USD sublabels in requests/new
  if ($("[data-request-sublabel]").length > 0) {
    var exprLabel = $("[data-request-sublabel='expr-value']");
    var usdLabel = $("[data-request-sublabel='usd-value']");
    var usdEthRate = $("[data-request='usd_eth_rate']").val();
    var cryptocurrency = window._cryptocurrency;

    exprLabel.html(cryptocurrency + ": " + RequestCostCalculactor(usdEthRate));
    usdLabel.html("USD: " + RequestCostCalculactor(1).toFixed(2));
    $("#request_requested_length").on("change", function() {
      exprLabel.html(cryptocurrency + ": " + RequestCostCalculactor(usdEthRate));
      usdLabel.html("USD: " + RequestCostCalculactor(1).toFixed(2));
    });
  }
}
