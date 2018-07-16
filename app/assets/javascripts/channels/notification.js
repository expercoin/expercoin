$(document).on('turbolinks:load', function() {
  var $notifications, $room_id;
  $notifications = $('#notifications');
  $room_id = $('#room_id');

  if ($notifications.length > 0) {
    App.chat = App.cable.subscriptions.create({
      channel: "NotificationChannel", room: $room_id
    }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        if (data['notification']) {
          $notifications.append(data['notification']);
        }
      },
    });
  }
});

