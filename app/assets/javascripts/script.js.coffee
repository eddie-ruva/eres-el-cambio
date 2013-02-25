$(document).ready ->

  # Graphic for percentage
  $(".knob").knob
    min: 0
    max: 100
    readOnly: true


  $('#county-search-form').bind("ajax:success", (event, data, status, xhr) ->
    $(".content").show()
    $(".empty-results").hide()
    $("#city-name").html data.name
    $("#comunidad").val(data.community).trigger "change"
    $("#propuestas_ciudadanas").val(data.citizen_proposals).trigger "change"
    $("#seguridad").val(data.security).trigger "change"
    $("#servicios_publicos").val(data.public_services).trigger "change"
    $("#happiness").val(data.welfare).trigger "change"

    $("html, body").animate scrollTop: $(".seguridad").offset().top

  ).bind("ajax:error", (event, xhr, status, error) ->
    $(".content").hide()
    $(".empty-results").show()

    $("html, body").animate scrollTop: $(".empty-results").offset().top
  )
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

