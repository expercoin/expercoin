$(document).on('turbolinks:load', function() {
  var $notifications, $room_id;
  $notifications = $('#notifications');
  $room_id = $notifications.attr('data-room-id');

  if ($notifications.length > 0) {
    App.notification = App.cable.subscriptions.create({
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
  var length = $('#notifications a').length;
  if(length) {
    $('#notification_dropdown').html(
      '<i class="fa fa-bell" aria-hidden="true"></i>'+
      '<span class="notification-counter">'+length+'</span>'
    );
  }
}
