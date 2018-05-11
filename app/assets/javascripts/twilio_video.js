$(function(){
  videoTwilioInitialize();
});

$(document).on("page:load",function(){
  videoTwilioInitialize();
});

function videoTwilioInitialize(twilo=2){
  window.room_token = $('#remote-media-div').attr('data-token');
  var twilioActions = {
    stopCameraPreview: function () {
      return function() {
        detachTracks([window.local_video_track]);
        $('#stop-camera-preview').hide();
        $('#start-camera-preview').show();
      }
    },
    startCameraPreview: function() {
      return function() {
        Twilio.Video.createLocalVideoTrack().then(function(track) {
          window.local_video_track = track;
          $('#local-media-ctr').html('');
          var localMediaContainer = $('#local-media-ctr');
          localMediaContainer.append(track.attach());
        });
        $('#start-camera-preview').hide();
        $('#stop-camera-preview').show();
      }
    },
    leaveRoom: function() {
      return function() {
        if(window.room) {
          $('#remote-media-div').html('');
          window.room.disconnect();
          window.room = null;
          $('#enter-room').show();
          $('#leave-room').hide();
        }
      }
    },
    enterRoom: function() {
      return function() {
        if(window.room_token) {
          enterRoom(window.room_token);
        }
      }
    },
    startSharing: function() {
      return function() {
        if(window.stream_share){
          var screenLocalTrack = window.stream_share.getVideoTracks()[0];
          window.room.localParticipant.publishTrack(screenLocalTrack);
          $('#share-screen').hide();
          $('#stop-share-screen').show();
          $('.twilio-error h3').first().html('');  
        }else{
          $('.twilio-error h3').first().html('You Must Select Screen To Share');
        }
      }
    },
    stopSharing: function() {
      return function() {
        var screenLocalTrack = window.stream_share.getVideoTracks()[0];
        window.room.localParticipant.unpublishTrack(screenLocalTrack);
        window.stream_share.getTracks().forEach(function(track) { track.stop()});
        window.stream_share = null;
        $('#stop-share-screen').hide();
        $('#share-screen').show();
        // $('#screen-view').src = '';
      }
    },
    fullScreenRemote: function() {
      return function() {
        $('#full-screen-remote').hide();
        $('#full-screen-disable-remote').show();        
        $('#remote-media-div').css({'width': '100%'});
        $('#remote-media-div video').css({'display': 'none'});
        $('#remote-media-div video').last().css({'display': 'inline-block','width': '100%', 'height': '100%'});
      }
    },
    fullScreenDisableRemote: function() {
      return function() {
        $('#full-screen-remote').show();
        $('#full-screen-disable-remote').hide();
        $('#remote-media-div video').css({'display': 'inline-block'});
        $('#remote-media-div').css({'width': 'auto'});
        $('#remote-media-div video').css({'width': '200px', 'height': '200px'});
      }
    },
    muteAudio: function() {
      return function() {
        window.room.localParticipant.audioTracks.forEach(function (audioTrack) {
          audioTrack.disable();
        });
        $('#mute-audio').hide();
        $('#unmute-audio').show();
      }
    },
    muteVideo: function() {
      return function() {
        window.room.localParticipant.videoTracks.forEach(function (videoTrack) {
          videoTrack.disable();
        });
        $('#mute-video').hide();
        $('#unmute-video').show();
      }
    },
    unmuteAudio: function() {
      return function() {
        window.room.localParticipant.audioTracks.forEach(function (audioTrack) {
          audioTrack.enable();
        });
        $('#unmute-audio').hide();
        $('#mute-audio').show();
      }
    },
    unmuteVideo: function() {
      return function() {
        window.room.localParticipant.videoTracks.forEach(function (videoTrack) {
          videoTrack.enable();
        });
        $('#unmute-video').hide();
        $('#mute-video').show();
      }
    }
  };

  function enterRoom(token) {
    Twilio.Video.connect(token).then(function(room) {
      window.room = room;
      room.on('participantConnected', function(participant) {
        resetTracks();
      })

      room.on('participantDisconnected', function(participant) {
        detachTracks(participant.tracks);
        console.log('Participant disconnected: ' + participant.identity);
      });

      room.on('disconnected', function(room) {
        detachTracks(room.localParticipant.tracks);
      });
      $('#enter-room').hide();
      $('#leave-room').show();
      resetTracks();
      $('.twilio-error h3').first().html('');
    }, function(error) {
      $('#enter-room').show();
      $('#leave-room').hide();
      $('.twilio-error h3').first().html(error.message);
      console.error('Unable to connect to Room: ' +  error.message);
    });
  }

  function detachTracks(tracks) {
    tracks.forEach(function(track) {
      track.detach().forEach(function(detachedElement) {
        detachedElement.remove();
      });
    });
  }

  function resetTracks(){
    $('#remote-media-div').html('');
    window.room.participants.forEach(function(participant, index){
      participant.tracks.forEach( function(track) {
        $('#remote-media-div').append(track.attach());
      });
      participant.on('trackAdded',  function(track) {
        $('#remote-media-div').append(track.attach());
      });
      participant.on('trackRemoved',  function(track) {
        detachTracks([track]);
      });
    });
  };
  
  if(window.room_token){
    enterRoom(window.room_token);
    twilioActions.startCameraPreview()();
    getUserScreen();
  }



  if(window.room_token){
    $('#mute-audio').on('click', twilioActions.muteAudio());
    $('#unmute-audio').on('click', twilioActions.unmuteAudio());
    $('#mute-video').on('click', twilioActions.muteVideo());
    $('#unmute-video').on('click', twilioActions.unmuteVideo());
    $('#full-screen-disable-remote').on('click', twilioActions.fullScreenDisableRemote());
    $('#full-screen-disable-remote').on('click', twilioActions.fullScreenDisableRemote());
    $('#full-screen-remote').on('click', twilioActions.fullScreenRemote());
    $('#stop-share-screen').on('click', twilioActions.stopSharing());
    $('#share-screen').on('click', twilioActions.startSharing());
    $('#enter-room').on('click', twilioActions.enterRoom());
    $('#leave-room').on('click', twilioActions.leaveRoom());
    $('#stop-camera-preview').on('click', twilioActions.stopCameraPreview());
    $('#start-camera-preview').on('click', twilioActions.startCameraPreview());  
    window.addEventListener('beforeunload', twilioActions.leaveRoom()());
  }
}

