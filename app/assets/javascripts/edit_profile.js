document.addEventListener("turbolinks:load", function() {
    if ($('#add-specialization-item').length > 0) {
      $('#add-specialization-item').on('click', addSpecializationItemField);
    }
});


function addSpecializationItemField(event) {
  var target = $(this).data('target');
  var index = $(target).find('[data-name=specialization-item]').length + 1;
  var html = '<div class="input-group mb-2" data-name="specialization-item">'
    + '<div class="input-group-prepend">'
    + '<span class="input-group-text">' + index + '</span>'
    + '</div>'
    + '<input class="form-control" type="text" name="profile_form[specialization][item_' + index + ']" id="profile_form_specialization_item_' + index + '">' + '</div>';
  if (index < 20) {
    $(target).append(html)
  }
}
