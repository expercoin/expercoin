/**
 * Get a MediaStream containing a MediaStreamTrack that represents the user's
 * screen.
 * 
 * This function sends a "getUserScreen" request to our Chrome Extension which,
 * if successful, responds with the sourceId of one of the specified sources. We
 * then use the sourceId to call getUserMedia.
 * 
 * @param {Array<DesktopCaptureSourceType>} sources
 * @param {string} extensionId
 * @returns {Promise<MediaStream>} stream
 **/

function guessBrowser() {
  if (typeof webkitRTCPeerConnection !== 'undefined') {
    return 'chrome';
  } else if (typeof mozRTCPeerConnection !== 'undefined') {
    return 'firefox';
  } else if (typeof RTCPeerConnection !== 'undefined') {
    if (typeof navigator !== 'undefined' && navigator.userAgent.match(/AppleWebKit\/(\d+)\./)) {
      return 'safari';
    }
    // NOTE(mroberts): Could be Edge.
  }
  return null;
}
window.EXTENSION_ID = 'pghnakdhcfnjndfenldecfbjblfigjmm';
if(guessBrowser() === 'chrome'){
  function getUserScreen() {
    // var video = document.getElementById('screen-view');
    var getScreen = document.getElementById('get-screen');
    var request = { sources: ['window', 'screen', 'tab'] };
    var stream;

    getScreen.addEventListener('click',function(event) {
      chrome.runtime.sendMessage(window.EXTENSION_ID, request, function (response) {
        if (response && response.type === 'success') {
          navigator.mediaDevices.getUserMedia({
            video: {
              mandatory: {
                chromeMediaSource: 'desktop',
                chromeMediaSourceId: response.streamId,
              }
            }
          }).then(function(returnedStream) {
            stream = returnedStream;
            window.stream_share = stream;
            $('.twilio-error h3').first().html('');  
            // video.src = URL.createObjectURL(stream);
          }).catch(function(err) {
            console.error('Could not get stream: ', err);
          });
        } else {
          console.error('Could not get stream');
        }
      });
    });
  };
}else if(guessBrowser()==='firefox'){
  function getUserScreen() {
    // var video = document.getElementById('screen-view');
    var getScreen = document.getElementById('get-screen');
    var stream;

    getScreen.addEventListener('click',function(event) {
      var mediaSource = document.querySelector('[name=capture]:checked').value;
      navigator.mediaDevices.getUserMedia({
        video: {
          mediaSource: mediaSource
        }
      }).then(function(returnedStream) {
        stream = returnedStream;
        window.stream_share = stream;
        $('.twilio-error h3').first().html('');  
        // video.src = URL.createObjectURL(stream);
      }).catch(function(err) {
        console.error('Could not get stream: ', err);
      });
    });
  }
}

