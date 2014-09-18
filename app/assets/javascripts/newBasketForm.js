$(document).ready(function() {
  $('#new_folder').on('click', function(e) {
    e.preventDefault();
    $('#new-basket-form-container').slideDown("medium", function() {

    })
  });

  $('.hide_button').on('click', function(){
    $('#new-basket-form-container').slideUp("medium", function() {});     
  })
});
