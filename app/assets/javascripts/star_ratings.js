$(document).on("turbolinks:load",function(){
  requestReviewRating();
});

function requestReviewRating() {
  $('#new_review input[type="radio"]').on('click', function() {
    $(".star-label").html('<i class="fa fa-star-o"></i>');
    var id = $(this).attr("id");
    $("label[for='" + id + "']").html('<i class="fa fa-star"></i>'); 
    $("label[for='" + id + "']").closest("li").prevAll().find("label").html('<i class="fa fa-star"></i>'); 
  });
}
