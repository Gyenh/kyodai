$(document).ready(function () {
  $('.flash-messages').hide().fadeIn();
  setTimeout(function () {
    $('.flash-messages').slideUp();
  }, 2000);
  $(window).click(function () {
    $('.flash-messages').slideUp();
  });
});
