$(document).on("turbolinks:load",function(){
  timerInitialize();
});

function timerInitialize() {
  if (!$('[data-time-start]').attr('data-time-start')) return;
  var startTime = new Date($('[data-time-start]').attr('data-time-start'));
  window.setInterval(function(){
    updateTimer(startTime);
  }, 1000);
}

function utcDateTimeStart() {
  return parseInt($('[data-time-start]').attr('data-time-start'));
}

function utcDateTimeCurrent() {
  return new Date().getTime();
}

function  updateTimer(startTime){
  var difference = getTimeDifferenceInSeconds(startTime);
  var days = getDays(difference);
  var hours = getHours(difference, days);
  var minutes = getMinutes(difference, days, hours);
  var seconds = getSeconds(difference);
  var minutes_with_hours = minutes + (hours * 60);
  setMinutes(minutes_with_hours);
  setSeconds(seconds);
}
function setDays(days){
  if (!document.querySelector('[data-timer="days"]')) return;
  document.querySelector('[data-timer="days"]').innerHTML = days;
}
function setHours(hours){
  if (!document.querySelector('[data-timer="hours"]')) return;
  document.querySelector('[data-timer="hours"]').innerHTML = hours;
}
function setMinutes(minutes){
  if (!document.querySelector('[data-timer="minutes"]')) return;
  document.querySelector('[data-timer="minutes"]').innerHTML = minutes;
}
function setSeconds(seconds){
  if (!document.querySelector('[data-timer="seconds"]')) return;
  var secondsFormat = addZeroToSingleDigit(seconds);
  document.querySelector('[data-timer="seconds"]').innerHTML = secondsFormat;
}
function getTimeDifferenceInSeconds(startTime){
  var currentTime = new Date();
  var timeDiff = currentTime.getTime() - startTime.getTime();
  diff = timeDiff / 1000;
  if(Math.sign(diff) == -1){
    diff = 0;
  }
  return diff;
}
function getDays(difference){
  return Math.floor(difference / 24 / 60 / 60); 
}
function getHours(difference, days){
  var hoursLeft = Math.floor(difference - (days * 86400));
  return Math.floor(hoursLeft / 3600);
}
function getMinutes(difference, days, hours){
  var hoursLeft = Math.floor(difference - (days * 86400));
  var minutesLeft = Math.floor((hoursLeft) - (hours * 3600));
  return  Math.floor(minutesLeft / 60);
}
function getSeconds(difference){
  var remainingSeconds = difference % 60;
  return parseInt(remainingSeconds);
}
function addZeroToSingleDigit(number) {
  return ('0' + number).slice(-2);
}