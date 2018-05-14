// $(function(){
//   requestFormInitialize();
// });

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
    price = /\d+/g.exec(price);
    var cost = price * length;
    $('[data-request="length"]').html(length);
    $('[data-request="cost"]').html('EXC ' + cost);
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
}
