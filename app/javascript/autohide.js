$(function() {
  $('.hover').on('mouseenter mouseleave', function() {
    $('nav').toggleClass('toggleNav');
  });
});