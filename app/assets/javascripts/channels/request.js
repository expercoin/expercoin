$(document).on('turbolinks:load', function() {
  var $request, $room_id;
  $request = $('#request');
  $room_id = $request.attr('data-room-id');

  if ($request.length > 0) {
    App.notification = App.cable.subscriptions.create({
      channel: "RequestChannel", room: $room_id
    }, {
      connected: function() {
      },
      disconnected: function() {},
      received: function(data) {
        if (data['request']) {
          $request.html(data['request']);
        }
      }
    });
  }
});
