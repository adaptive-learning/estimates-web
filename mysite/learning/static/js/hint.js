function csrfSafeMethod(method) {
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');

function getHint(ele, type, p1,p2,reverse){
	
	if (type == "temp"){
		var label = $("#"+ele);
		if (reverse){
			fr = p2;
			to = p1;
		} else {
			fr = p1;
			to = p2;
		}
			
		
		if (fr == "degF" && to == "degC"){
			label.text("°C = (°F - 32) × 5/9");		
		} else if(fr == "degC" && to == "degF"){
			label.text("°F = °C × 9/5 + 32");
		} else if(fr == "degF" && to == "kelvin"){
			label.text("Kelvin = (°F + 459.67) x 5/9");	
		} else if(fr == "kelvin" && to == "degF"){
			label.text("K = 5/9 (°F - 32) + 273");
		} else if(fr == "degC" && to == "kelvin"){
			label.text("Kelvin = °C + 273.15");
		} else if(fr == "kelvin" && to == "degC"){
			label.text("°C = Kelvin - 273.15");
		}
	} else {
	
$.ajax({
		beforeSend: function(xhr, settings) {
    	    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        	    xhr.setRequestHeader("X-CSRFToken", csrftoken);
        	}
    	},    
    	url : "/learning/get_hint", // the endpoint
        type : "POST", // http method
        data : { type:type, p1 : p1, p2 : p2, rev : reverse }, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	$("#"+ele).text(deciderType(type,"False",1,p1,p2,response));
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
   }
}