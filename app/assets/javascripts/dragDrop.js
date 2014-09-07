$(document).ready(function(){
  $('.folder-container').draggable({
    containment: 'window',
    cursor: 'move',
    cursorAt: { botton: 10},
    // helper: myHelper
    revert: true
  });

  function myHelper(){
    // var folderLink = $(this).find('h3').text();
    var test = "Why how do ya do!"
    return '<div id="draggableHelper">' + test + '</div>';
  }

  // $('.folder-container').on('click', function(){
  //   console.log(folderLink);
  // });
});