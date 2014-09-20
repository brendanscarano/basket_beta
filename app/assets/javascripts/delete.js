$(document).ready(function(){
  $('.link-trash').on('click', function(){
    if (typeof id === 'undefined'){
      id = $(this).attr('data');
      $('.delete-link.' + id).slideDown("medium", function(){})
    } else {
      $('.delete-link.' + id).slideUp("medium", function(){})  

      id = $(this).attr('data');
      $('.delete-link.' + id).slideDown("medium", function(){})
    };
  });

  $('.cancel-delete').on('click', function(){
    $('.delete-link.' + id).slideUp("medium", function(){})
  });

  $('.confirm-delete').on('click', function(){
    $('.delete-link.' + id).hide();
  });
});
