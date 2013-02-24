window.EresElCambioApp =
  createCicReport: createCicReport = (data, success, error) ->
    $.ajax
      type: "POST"
      url: "http://api.nl.cic.mx/0/nl/reports.json"
      
      #contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
      xhrFields:
        withCredentials: false

      headers: {}
      
      # Data must have at least a content field, that represents the description
      data: data
      dataType: "jsonp"
      success: (data, textStatus, jqXHR) ->
        console.log "DATA from CIC " + data
        success()

      error: (jqXHR, textStatus, errorThrown) ->
        errorThrown = "Assumed CORS issue !"  if errorThrown is ""
        console.error errorThrown
        error()

      complete: (jqXHR, textStatus) ->


  writeCookie: writeCookie = (cname, cvalue, cexpire) ->
    document.cookie = cname + "=" + escape(cvalue) + ((if typeof cexpire is "date" then "expires=" + cexpire.toGMTString() else "")) + ",path=/;domain=about.com"

  readCookie: readCookie = (cname) ->
    nameEQ = name + "="
    ca = document.cookie.split(";")
    i = 0

    while i < ca.length
      c = ca[i]
      c = c.substring(1, c.length)  while c.charAt(0) is " "
      return c.substring(nameEQ.length, c.length)  if c.indexOf(nameEQ) is 0
      i++
    null