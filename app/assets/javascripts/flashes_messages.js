$(document).ready(function () {
  $('.flash-messages').hide().fadeIn();
  setTimeout(function () {
    $('.flash-messages').fadeOut();
  }, 2000);
  $(window).click(function () {
    $('.flash-messages').fadeOut();
  });
});
