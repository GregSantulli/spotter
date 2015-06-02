
function fader() {
  var navBar = $('.navigation_container')
  dt = $(document).scrollTop()
  $('.navigation_container').css(
    "background-color", "rgba(51,71,122," +  (0.6 + (dt/500)) + ")")
}



function searchListener() {
  $('.search_button').on('click', function(e){
    e.preventDefault()
    $('html, body').animate({
      scrollTop: $(".results_container").offset().top
    }, 1500);
    var input = $('.search_input')
    performSearch()
    // $.ajax({
    //   url: '/search',
    //   type:'post',
    //   data: input
    // }).done(function(response){
    //   var context = {search_results: response.businesses};
    //   var html = $('#search_result_template').html();
    //   var templatingFunction = Handlebars.compile(html);
    //   $('.search_results').html(templatingFunction(context));
    // }).fail(function(){
    //   console.log('ajax fail')
    // })
  })
}



function loginListener(){
  $('.login_button').on('click', function(){
    var menuType = $(this).attr('data-type')
    var clickedMenu = $('.' + menuType)

    if (clickedMenu.hasClass('active')){
      $('.' + menuType).fadeOut()
      $('.login').removeClass('active')
      $('.signup').removeClass('active')
    }
    else{
      $('.login').fadeOut()
      $('.signup').fadeOut()
      $('.login').removeClass('active')
      $('.signup').removeClass('active')
      $('.' + menuType).fadeIn()
      clickedMenu.addClass('active')
    }
  })
}

function signUpListener(){
  $('form').on('submit', function(e){
    console.log('click!')
    e.preventDefault()
    var formData = $(this).serialize()
    $.ajax({
      type:'post',
      url: '/users',
      data: formData,
    }).done(function(response){
      $('.errors').replaceWith(response[0])
    })
  })
};



var map;
var service;

function handleSearchResults(results, status){

  console.log(results)

  for (var i = 0; i < results.length; i++) {

    var marker = new google.maps.Marker({
      position: results[i].geometry.location,
      map: map,
      icon: 'assets/fitness_small.svg',
      infowindow: myinfowindow,
    })

    var myinfowindow = new google.maps.InfoWindow({
      content: "<div>"+ results[i].name + "</div>"
    });

    google.maps.event.addListener(marker, 'click', function() {
      this.infowindow.open(map,this);
    });

  };
}

function performSearch(){
  var request = {
    bounds: map.getBounds(),
    types: ['gym'],

  };
  service.nearbySearch(request, handleSearchResults)
}


function initializeMap(location) {

  var mapOptions = {
    center: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
    zoom: 15
  };


  map = new google.maps.Map(document.getElementById('map_container'),
    mapOptions);

  service = new google.maps.places.PlacesService(map);

  google.maps.event.addListenerOnce(map, 'bounds_changed', performSearch);

  var marker = new google.maps.Marker({
    position: map.center,
    map: map,
  })


}



$( document ).ready(function() {
  $(document).bind('scroll', fader);
  loginListener()
  searchListener()
  // signUpListener()
  // initializeMap()
  navigator.geolocation.getCurrentPosition(initializeMap)
});
