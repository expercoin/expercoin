$(document).on("turbolinks:load",function(){
  listenersInitialize();
});

function listenersInitialize() {
  if($('#messages .chat-message').length > 0) {
    $('#messages').animate({
      scrollTop: $('.chat-message:last').offset().top - $('#messages').offset().top + $('#messages').scrollTop()
    });
  }
 
  $('#message-attachment').change(function(){
    $('#chat-attachment-name').html($(this).get(0).files[0].name);
  });

  $('body').on('click', '#chat-attachment-upload', function(){
    $('#message-attachment').click();
  });

  $('body').on('change', function(){
    removeNotice();
  });
  removeNotice();

  $('body').on('change', '[name="profile_form[country]"]', function(){
    getStates();
  });

  $('body').on('change', '[name="profile_form[state]"]', function(){
    getCities();
  });
}

function removeNotice() {
  if($('[data-notice="success"]').length) {
    setTimeout(function(){
      $('[data-notice="success"]').removeClass('show');
    }, 3000);
  }
  if($('[data-notice="error"]').length) {
    setTimeout(function(){
      $('[data-notice="error"]').removeClass('show');
    }, 3000);
  }
}


function getStates() {
  var country = $('[name="profile_form[country]"]').val();
  $.get('settings/states?profile_form[country]='+country);
}

function getCities() {
  var country = $('[name="profile_form[country]"]').val();
  var state = $('[name="profile_form[state]"]').val();
  $.get('settings/cities?profile_form[country]='+country+'&profile_form[state]='+state);
}