$(document).on("turbolinks:load",function(){
  listenersInitialize();
});

function listenersInitialize() {
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