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
      message: 'Check out B@sket, an awesome way to save and share your favorite links!'
    });
  }


  $('.invite-friends-btn').on('click', function(){
    FacebookInviteFriends();
  })
});
