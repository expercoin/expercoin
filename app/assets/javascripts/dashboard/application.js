//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require select2
//= require categories_dropdown
//= require request_form
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require star_ratings
//= require photo_uploader
//= require twilio
//= require twilio_screen_share
//= require twilio_video
//= require timer
//= require listeners
//= require web3
//= require web3_setup
//= require tinymce/tinymce.min

document.addEventListener("turbolinks:load", function() {
  $('.selectpicker').select2();
  $('.selectpicker-time').select2();
  $('[data-toggle="popover"]').popover();
  tinymce.init({
    selector: '.wysiwyg'
  });
});
