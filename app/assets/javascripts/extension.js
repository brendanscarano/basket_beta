$(document).ready(function(){
  $('.download-extension-btn').on('click', function() {
    console.log("Clicked");
    chrome.webstore.install();
  });
});