$(document).on("turbolinks:load",function(){
  $('body').on('change','#photo_uploader', function() {
    $('[name="commit"]').click();
  });
});
