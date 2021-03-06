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

function getHint(ele, type, p1,p2,param){

	if (type == "temp"){
		var label = $("#"+ele);
		if (param == "1"){
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
			label.text("°F = 5/9 (Kelvin - 32) + 273");
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
        data : { type:type, p1 : p1, p2 : p2, par : param }, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	$(document).ready(function(){
        		$("#"+ele).empty();
        		var pa1 = p1;
        		var pa2 = p2;
        		if (param == "1"){
        			var pa1 = p2;
        			var pa2 = p1;
        		}
        		$("#"+ele).append(deciderType(type,"False",1,pa1,pa2,response));
        	});
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