$(document).ready(function() {

  var cities = {
    "Juárez" : "juarez",
    "General Escobedo": "gral-escobedo",
    "Sfo": "sfo",
    "Pesquería": "pesqueria",
    "Benito Juárez": "cd-benito-juarez",
    "San Pedro Garza García": "san-pedro-garza-garcia",
    "Guadalupe": "guadalupe",
    "García": "garcia",
    "Apodaca": "apodaca",
    "Santa Catarina": "santa-catarina",
    "Monterrey": "monterrey",
    "San Nicolás De Los Garza": "san-nicolas-de-los-garza",
    "La Reforma": "la-reforma"
  }

  /* Graphic for percentage*/
  $(".knob").knob({
    'min':0
    ,'max':100
    ,'readOnly':true
  });

  /* Submit search for city */
  $("#search-city").click(function() {
    var self = this;
    human_name = $('#city-to-search').val();
    endpoint = "/county/" + cities[human_name] + ".json";
    $.get(endpoint, function(data) {
      if(data.error) {
        $('.content').hide();
        $('.empty-results').show();

        // scroll to first category 
        $('html, body').animate({
          scrollTop: $('.empty-results').offset().top
        });
      } else {
        $('.content').show();
        $('.empty-results').hide();
        $('#city-name').html(human_name);
        $('#comunidad').val(data.comunidad || 0).trigger('change');;
        $('#propuestas_ciudadanas').val(data.propuestas_ciudadanas || 0).trigger('change');;
        $('#seguridad').val(data.seguridad || 0).trigger('change');;
        $('#servicios_publicos').val(data.servicios_publicos || 0).trigger('change');;
        $('#bienestar').val(data.welfare || 0).trigger('change');;
        console.log(data);

        // scroll to first category 
        $('html, body').animate({
          scrollTop: $('.seguridad').offset().top
        });
        EresElCambioApp.writeCookie("current-city", cities[human_name]);
      }
    });
    return true;
  });

  /* jquery UI Autocomplete */
  $('#city-to-search').autocomplete({
    source: Object.keys(cities)
  });


  $('.nav-place').waypoint('sticky');

  /* Proposal modal */
  $(".help").leanModal({ 
    overlay : 0.4, 
    closeButton: ".modal_close" 
  });

  $('.welfare').click(function(e) {
    e.preventDefault();
    city = EresElCambioApp.readCookie("current-city");
    city = 'monterrey';
    endpoint = "/county/" + city + ".json";
    $.post(endpoint, {value: $(this).data('value')}, function(data) {
      $('p', '.vote').fadeOut('500', function () {
        $(this).text('Que tengas un buen día').fadeIn('500', function() {
          setTimeout(function() {
            $('.vote').fadeOut('slow');
          }, 1500);
        });
      });
    });
  });

  $('#create_report').submit(function () {
    var data = {
      content: $('#problem_text').val(),
      address: $('#problem_location').val()
    };
    EresElCambioApp.createCicReport(data, function(data, textStatus, jqXHR) {
      $('.modal_close').click();
    }, function (jqXHR, textStatus, errorThrown) {
      $('.modal_close').click();
    });
    return false;
  });

  $('#create_proposal').submit(function () {
    var data = {
      content: $('#process._debugProcess();osal_text').val()
    };
    EresElCambioApp.createCicReport(data, function(data, textStatus, jqXHR) {
      $('.modal_close').click();
    }, function (jqXHR, textStatus, errorThrown) {
      $('.modal_close').click();
    });
    return false;
  });



});
