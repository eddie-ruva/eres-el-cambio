window.EresElCambioApp = {
	createCicReport: function createCicReport(data, success, error) {
		$.ajax({
			type: 'POST',
			url: "http://api.nl.cic.mx/0/nl/reports.json", 
			//contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			xhrFields: {withCredentials: false},
			headers: {},
			// Data must have at least a content field, that represents the description
			data: data,
      dataType: "jsonp",
			success: function(data,textStatus,jqXHR) {
				console.log("DATA from CIC " + data);
        success();
			},
			error: function(jqXHR, textStatus, errorThrown) {
				if (errorThrown == "") errorThrown = "Assumed CORS issue !";
				console.error(errorThrown);
        error();
			},
			complete: function(jqXHR, textStatus){}
		});
	},
  writeCookie: function writeCookie(cname, cvalue, cexpire) {
    document.cookie = cname + '=' + escape(cvalue) +
      (typeof cexpire == 'date' ? 'expires=' + cexpire.toGMTString() : '') +
      ',path=/;domain=about.com';
  },
  readCookie: function readCookie(cname) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var     i=0;i < ca.length;i++) {
      var c = ca[i];
      while (c.charAt(0)==' ') c        = c.substring(1,c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
  }
}
