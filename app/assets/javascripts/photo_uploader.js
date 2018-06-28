$(document).on("turbolinks:load",function(){

  if ($('#photo_uploader').length > 0) {
    var elmFileUpload = document.getElementById('photo_uploader');

    function onFileUploadChange(e) {
      var file = e.target.files[0];
      var fr = new FileReader();
      fr.onload = onFileReaderLoad;
      fr.readAsDataURL(file);
    }

    function onFileReaderLoad(e) {
      elmFileShow = document.getElementById('photo_show');
      elmFileShow.src = e.target.result;

    };

    elmFileUpload.addEventListener('change',onFileUploadChange,false);
  }
});
