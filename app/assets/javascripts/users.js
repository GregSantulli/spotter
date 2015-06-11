
function fader() {
  var navBar = $('.navigation_container')
  dt = $(document).scrollTop()
  $('.navigation_container').css(
    "background-color", "rgba(51,71,122," +  (0.6 + (dt/500)) + ")")
}

function geoSearch(position) {
  var lat = position.coords.latitude
  var lon = position.coords.longitude
  var input = $('.search input').val()
  var data = {
    coords: {
      latitude: lat,
      longitude: lon,},
    term: input,
  }
  $.ajax({
    url: '/search',
    type:'post',
    data: data,
  }).done(function(response){
    console.log(response)
    if(input !== ""){
      $('#search-results-header').html('Gyms matching "' + input +'"')
    }
    var context = {search_results: response.businesses};
    var html = $('#search_result_template').html();
    var templatingFunction = Handlebars.compile(html);
    $('.near_you_results').html(templatingFunction(context));
  }).fail(function(){
    console.log('search ajax fail')
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
    // var marker = new google.maps.Marker({
    //   position: results[i].geometry.location,
    //   map: map,
    //   icon: 'assets/fitness_small.svg',
    //   infowindow: myinfowindow,
    // })
    // var myinfowindow = new google.maps.InfoWindow({
    //   content: "<div>"+ results[i].name + "</div>"
    // });
    // google.maps.event.addListener(marker, 'click', function() {
    //   this.infowindow.open(map,this);
    // });
  };
}

function initializeMap(location) {
  var mapOptions = {
    center: new google.maps.LatLng(location.coords.latitude, location.coords.longitude),
    zoom: 15
  };
  map = new google.maps.Map(document.getElementById('map_container'),
    mapOptions);
  // google.maps.event.addListenerOnce(map, 'bounds_changed', performSearch);
  var marker = new google.maps.Marker({
    position: map.center,
    map: map,
  })
}


function swipeListener(){
  $('.choice.btn').on('click', function(e){
    e.preventDefault();
    var formData = $(this).parent().serialize();
    var clickedButton = $(this);
    var user = $(this).parents(".col-md-6");
    $.ajax({
      url: "/swipe",
      type: "POST",
      data: formData,
    }).done(function(response) {
      if(response.match){
        console.log(response.match.first_name);
        updateMatchModal(response.match);
        jQuery.noConflict();
        $('#myModal').modal('show');
      }else{
        console.log("no match")
      }
    }).fail(function(){
    });
    if(clickedButton.hasClass('no')){
      user.animate({left: '-200%'}, 500).fadeOut()
    }else{
      user.animate({right: '-200%'}, 500).fadeOut()
    }
  });
}


function updateMatchModal(match){
  $('#modal_user_name').html(match.first_name)
  $('#modal_message_button').html("Message " + match.first_name)
  if(match.provider === 'facebook'){
    $('#modal_image').attr('src', "http://graph.facebook.com/<%= match.uid %>/picture?type=large").attr('alt', "<%= match.first_name %>")
  }else{
    $('#modal_image').attr('src', match.thumbnail_link).attr('alt', "<%= match.first_name %>")
  }
}



function geoSearchListener(){
  $('button#gym-search').on('click', function(){
    $('.near_you_results').html("<span class='list-group-item'>Searching...</span>")
    navigator.geolocation.getCurrentPosition(geoSearch)
  });
}


$( document ).ready(function() {
  $(document).bind('scroll', fader);
  swipeListener()
  geoSearchListener()
  navigator.geolocation.getCurrentPosition(geoSearch)
});

