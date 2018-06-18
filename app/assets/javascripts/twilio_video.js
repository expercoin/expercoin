$(document).on('turbolinks:load',function(){
  videoTwilioInitialize();
});

function videoTwilioInitialize(){
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
        $('#stop-share-screen').attr("id", 'get-screen');
        $('.session-share-icon').removeClass('active');
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
      room.on('participantConnected', function() {
        $('#session-time-form [type="submit"]').click();
        resetTracks();
      })

      room.on('participantDisconnected', function(participant) {
        detachTracks(participant.tracks);
      });

      room.on('disconnected', function(room) {
        $('[data-twillio-session="end"]')[0].click();
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
    clearTracksFromPage();
    window.room.participants.forEach(function(participant) {
      attachParticipantTracks(participant);
      addParticipantTrackAddedEvent(participant);
      addParticipantTrackRemovedEvent(participant);
    });
  };
  
  if(window.room_token){
    enterRoom(window.room_token);
    // twilioActions.startCameraPreview()();
    getUserScreen();
  }

  function addParticipantTrackRemovedEvent(participant) {
    participant.on('trackRemoved', function() {
      resetTracks();
    });
  }

  function addParticipantTrackAddedEvent(participant) {
    participant.on('trackAdded', function(track) {
      if(track.kind == 'video') {
        addOneVideoTrack(track);
      }else{
        appendTrack(track);
      }
    });
  }

  function attachParticipantTracks(participant) {
    participant.tracks.forEach( function(track) {
      appendTrack(track);
    });
  }

  function clearTracksFromPage() {
    $('#remote-media-div').html('');
  }

  function appendTrack(track) {
    $('#remote-media-div').append(track.attach());
  }
  
  function addOneVideoTrack(track) {
    if($('#remote-media-div video').length){
      $('#remote-media-div video').replaceWith(track.attach());
    } else {
      appendTrack(track);
    }
  }
  if(window.room_token){
    $('[data-twillio-session="end"]').on('click', twilioActions.leaveRoom());
    $('#mute-audio').on('click', twilioActions.muteAudio());
    $('#unmute-audio').on('click', twilioActions.unmuteAudio());
    $('#mute-video').on('click', twilioActions.muteVideo());
    $('#unmute-video').on('click', twilioActions.unmuteVideo());
    $('#full-screen-disable-remote').on('click', twilioActions.fullScreenDisableRemote());
    $('#full-screen-disable-remote').on('click', twilioActions.fullScreenDisableRemote());
    $('#full-screen-remote').on('click', twilioActions.fullScreenRemote());
    $('body').on('click', '#stop-share-screen', twilioActions.stopSharing());
    $('#share-screen').on('click', twilioActions.startSharing());
    $('#enter-room').on('click', twilioActions.enterRoom());
    $('#leave-room').on('click', twilioActions.leaveRoom());
    $('#stop-camera-preview').on('click', twilioActions.stopCameraPreview());
    $('#start-camera-preview').on('click', twilioActions.startCameraPreview());  
    window.addEventListener('beforeunload', twilioActions.leaveRoom()());
  }
}

