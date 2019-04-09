document.addEventListener("turbolinks:load", function () {
  $('#tabs li').on('click', function () {
    var tab = $(this).data('tab');

    $('#tabs li').removeClass('is-active');
    $(this).addClass('is-active');

    $('#tab-content li').removeClass('is-active');
    $('li[data-content="' + tab + '"]').addClass('is-active');
  });
});
