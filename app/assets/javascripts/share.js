$(document).ready(function(){
  // var html = "<%= escape_javascript(render('folders/share')) %>";
  $('.fa-share').on('click', function(){
    $('.save-share-div').slideDown("medium", function(){
      // $('.save-share-div-container').html(html)
    })

    $.ajax({
      type: "GET",
      url: "/users_folders"
    }).done(function(response){
      console.log(response);
      $('.basket-list').append(response);
    })

    $.ajax({
      type: "GET",
      url: "/users_friends"
    }).done(function(response){
      console.log(response);
      $('.friend-list-wrapper').append(response);
    })
    
  });
});