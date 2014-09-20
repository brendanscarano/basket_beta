// $(document).ready(function(){
//   // var html = "<%= escape_javascript(render('folders/share')) %>";
//   $('.link-share').draggable({
//     containment: 'window',
//     helper: 'clone'
//   })

//   $('.link-share').on('click', function(){
//     id = $(this).attr('data');
//     $('.save-share-div.' + id).slideDown("medium", function(){})

//     ajaxCalls(id);
    
//   });
// });

// function ajaxCalls(folder_id){
//     console.log(folder_id);

//     $.ajax({
//       type: "GET",
//       url: "/users_folders"
//     }).done(function(response){
//       $('.basket-list.' + folder_id).append(response);
//     })

//     $.ajax({
//       type: "GET",
//       url: "/users_friends"
//     }).done(function(response){
//       $('.friend-list-wrapper.' + folder_id).append(response);
//     })
// }