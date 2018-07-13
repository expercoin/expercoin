document.addEventListener("turbolinks:load", function() {
  if ($('#add-specialization-item').length > 0) {
    $('#add-specialization-item').on('click', addSpecializationItemField);
  }

  $('body').on('change','#profile_form_photo', function() {
    $('[name="commit"]').click();
  });

});


function addSpecializationItemField(event) {
  var target = $(this).data('target');
  var index = $(target).find('[data-name=specialization-item]').length + 1;
  if (index < 20) {
    var newEl = $(target).find('[data-name=specialization-item]').last().clone();
    var newElInput = newEl.find('input');
    newElInput.attr('id', 'profile_form_specialization_item_' + index);
    newElInput.attr('name', 'profile_form[specialization][item_' + index +']');
    newElInput.val('');
    newEl.find('span.input-group-text').html(index);
    $(target).append(newEl);
  }
}
