$(document).ready(function(){
  //Delete links
  $('.link-trash').on('click', function(){
    if (typeof linkId === 'undefined'){
      linkId = $(this).attr('data');
      $('.delete-link.' + linkId).slideDown("medium", function(){})
    } else {
      $('.delete-link.' + linkId).slideUp("medium", function(){})  

      linkId = $(this).attr('data');
      $('.delete-link.' + linkId).slideDown("medium", function(){})
    };
  });

  $('.cancel-delete').on('click', function(){
    $('.delete-link.' + linkId).slideUp("medium", function(){})
  });

  $('.confirm-delete').on('click', function(){
    $('.delete-link.' + linkId).hide();
  });

  //Delete baskets
  $('.basket-trash').on('click', function(){
    if (typeof basketId === 'undefined'){
      basketId = $(this).attr('data');
      $('.delete-basket.' + basketId).slideDown("medium", function(){})
    } else {
      $('.delete-basket.' + basketId).slideUp("medium", function(){})  

      basketId = $(this).attr('data');
      $('.delete-basket.' + basketId).slideDown("medium", function(){})
    };
  });

  $('.cancel-basket-delete').on('click', function(){
    $('.delete-basket.' + basketId).slideUp("medium", function(){})
  });

  $('.confirm-basket-delete').on('click', function(){
    $('.delete-basket.' + basketId).hide();
  });
});

