$(document).ready(function(){
  

  FB.init({
    appId:'1444194725830602',
    cookie:true,
    status:true,
    xfbml:true
  });

  function FacebookInviteFriends(){
    FB.ui({
      method: 'apprequests',
      message: 'Your Message diaolog'
    });
  }


  $('.invite-friends-btn').on('click', function(){
    console.log("This was clicked");
    FacebookInviteFriends();
  })
});
