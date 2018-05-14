document.addEventListener("turbolinks:load", function() {
    if ($('#add-specialization-item').length > 0) {
      $('#add-specialization-item').on('click', addSpecializationItemField);
    }
});


function addSpecializationItemField(event) {
  var target = $(this).data('target');
  var index = $(target).find('[data-name=specialization-item]').length + 1;
  if (index < 20) {
    $(target).find('[data-name=specialization-item]').last().clone().appendTo(target).find('.input-group-text').text(index);
  }
}
