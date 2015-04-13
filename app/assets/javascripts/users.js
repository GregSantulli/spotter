
function fader() {
  var navBar = $('.navigation_container')
  dt = $(document).scrollTop()
  $('.navigation_container').css(
    "background-color", "rgba(0,0,0," +  (0.6 + (dt/500)) + ")")
}



function searchListener() {
  $('.search_button').on('click', function(e){
    e.preventDefault()
    console.log('click!')

    $('html, body').animate({
        scrollTop: $(".results_container").offset().top
    }, 1500);


    var input = $('.search_input')



    $.ajax({
      url: '/search',
      type:'post',
      data: input
      // debugger
    }).done(function(response){
      console.log("ajax success")
      console.log(response.businesses)
      var context = {search_results: response.businesses};
      var html = $('#search_result_template').html();
      var templatingFunction = Handlebars.compile(html);
      $('.search_results').html(templatingFunction(context));


    }).fail(function(){
      console.log('ajax fail')
    })


  })
}

function autocompleter(){



  var availableGyms =[]
  var input = $('.search_input')

     $.ajax({
      url: '/search',
      type:'post',
      data: input
    }).done(function(response){

      var gyms =response.businesses

      for(var i=0; i<=10; i++){
        availableGyms.push(gyms[i])
        // console.log(response.businesses[i].name)
      }

      console.log(availableGyms)

      $( ".search_input" ).autocomplete({
      source: availableGyms
    });

    }).fail(function(){
      console.log('ajax fail')
    })







  };


// $(document).keypress(function(){
//   autocompleter()
//   console.log("trigger!")
// })


// Event on scroll
$( document ).ready(function() {
  $(document).bind('scroll', fader);
  searchListener()
});
