
function fader() {
  var navBar = $('.navigation_container')
  dt = $(document).scrollTop()
    $('.navigation_container').css(
      "background-color", "rgba(0,0,0," +  (0.6 + (dt/500)) + ")")
}

// Event on scroll
$( document ).ready(function() {
  $(document).bind('scroll', fader);
});
