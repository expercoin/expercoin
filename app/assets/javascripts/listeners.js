$(document).on("turbolinks:load",function(){
  listenersInitialize();
});

function listenersInitialize() {
  $('body').on('change', function(){
    removeNotice();
  });
  removeNotice();
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