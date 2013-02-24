$(document).ready ->

  # Graphic for percentage
  $(".knob").knob
    min: 0
    max: 100
    readOnly: true


  # Submit search for city
  $("#search-city").click ->
    self = this
    human_name = $("#city-to-search").val()
    endpoint = "/county/" + cities[human_name] + ".json"
    $.get endpoint, (data) ->
      if data.error
        $(".content").hide()
        $(".empty-results").show()

        # scroll to first category 
        $("html, body").animate scrollTop: $(".empty-results").offset().top
      else
        $(".content").show()
        $(".empty-results").hide()
        $("#city-name").html human_name
        $("#comunidad").val(data.comunidad or 0).trigger "change"
        $("#propuestas_ciudadanas").val(data.propuestas_ciudadanas or 0).trigger "change"
        $("#seguridad").val(data.seguridad or 0).trigger "change"
        $("#servicios_publicos").val(data.servicios_publicos or 0).trigger "change"
        $("#bienestar").val(data.welfare or 0).trigger "change"
        console.log data

        # scroll to first category 
        $("html, body").animate scrollTop: $(".seguridad").offset().top
        EresElCambioApp.writeCookie "current-city", cities[human_name]

    true


  # jquery UI Autocomplete 
  $("#county_searched").autocomplete
    minLength: 2
    source: "/counties/search_on_name"


  # City name sticky
  $(".nav-place").waypoint "sticky"

  # Proposal modal
  $(".help").leanModal
    overlay: 0.4
    closeButton: ".modal_close"

  $(".welfare").click (e) ->
    e.preventDefault()
    city = EresElCambioApp.readCookie("current-city")
    city = "monterrey"
    endpoint = "/county/" + city + ".json"
    $.post endpoint,
      value: $(this).data("value")
    , (data) ->
      $("p", ".vote").fadeOut "500", ->
        $(this).text("Que tengas un buen día").fadeIn "500", ->
          setTimeout (->
            $(".vote").fadeOut "slow"
          ), 1500




  $("#create_report").submit ->
    data =
      content: $("#problem_text").val()
      address: $("#problem_location").val()

    EresElCambioApp.createCicReport data, ((data, textStatus, jqXHR) ->
      $(".modal_close").click()
    ), (jqXHR, textStatus, errorThrown) ->
      $(".modal_close").click()

    false

  $("#create_proposal").submit ->
    data = content: $("#process._debugProcess();osal_text").val()
    EresElCambioApp.createCicReport data, ((data, textStatus, jqXHR) ->
      $(".modal_close").click()
    ), (jqXHR, textStatus, errorThrown) ->
      $(".modal_close").click()

    false

