document.addEventListener("turbolinks:load", function() {
  $('.category-item').mouseenter(function() {
    var category_id = $(this).data('id');
    var subcategory_menu = $('.category-subcategories[data-id="' + category_id +'"]');
    subcategory_menu.show();
  });
  $('.category-item').mouseleave(function() {
    var category_id = $(this).data('id');
    if ($('.category-subcategories[data-id="' + category_id +'"]:hover').length == 0) {
      $('.category-subcategories[data-id="' + category_id +'"]').hide();
    }
  });  
  // $('.category-subcategories').mouseleave(function() {
  //   var subcategory_id = $(this).data('id');
  //   if ($('.category-item[data-id="' + subcategory_id +'"]:hover').length == 0) { 
  //     $(this).hide();
  //   }  
  // });  
});