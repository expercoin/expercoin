$(document).on('turbolinks:load', function() {
  var $notifications, $room_id;
  $notifications = $('#notifications');
  $room_id = $notifications.attr('data-room-id');

  if ($notifications.length > 0) {
    App.chat = App.cable.subscriptions.create({
      channel: "NotificationChannel", room: $room_id
    }, {
      connected: function() {
      },
      disconnected: function() {},
      received: function(data) {
        if (data['notification']) {
          $notifications.append(data['notification']);
          updateNotifications();
        }
      }
    });
  }
});


function updateNotifications() {
  $('.notification-counter').html($('#notifications a').length);
}