$(document).on("turbolinks:load",function(){
  timerInitialize();
});

function timerInitialize() {
  if($('[data-time-start]').attr('data-time-start')) {
    console.log(utcDateTimeStart() - utcDateTimeCurrent())
  }
}

function utcDateTimeStart() {
  return parseInt($('[data-time-start]').attr('data-time-start'));
}

function utcDateTimeCurrent() {
  return new Date().getTime();
}
