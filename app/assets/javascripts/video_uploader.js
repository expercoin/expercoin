$(document).on("turbolinks:load",function(){

  if ($('#video_uploader').length > 0) {
    var elmVideoUpload = document.getElementById('video_uploader');

    function onVideoUploadChange(e) {
      var url = e.currentTarget.value;
      var elmVideoShow = document.getElementById('video_show');
      if ( url.match(/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=|\?v=)([^#\&\?]*).*/) ) {
        var youtubeURL = YouTubeGetID(url);
        url = "https://www.youtube.com/embed/" + youtubeURL;
      }
      if ( url.match(/https:\/\/(www\.)?vimeo.com\/(\d+)($|\/)/) ){
        var vimeoID = VimeoGetID(url);
        url = "https://player.vimeo.com/video/" + vimeoID;
      }
      document.getElementById('profile_form_video_url').value = url;
      elmVideoShow.src = url;
    }

    elmVideoUpload.addEventListener('keyup',onVideoUploadChange,false);
  }
});

function YouTubeGetID(url){
  var ID = '';
  url = url.replace(/(>|<)/gi,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
  if(url[2] !== undefined) {
    ID = url[2].split(/[^0-9a-z_\-]/i);
    ID = ID[0];
  }
  else {
    ID = url;
  }
  return ID;
}

function VimeoGetID(url) {
  var match = /vimeo.*\/(\d+)/i.exec( url );

  // If the match isn't null (i.e. it matched)
  if ( match ) {
    // The grouped/matched digits from the regex
    return match[1];
  }
}
