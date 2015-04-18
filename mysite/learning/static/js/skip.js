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

function skipQuestion(){
	alert("q");
	if (sessionStorage.getItem("sended") == "true") {
    	return ;
	} else {
    	sessionStorage.setItem("sended", true);
	}
	// $("#pie-countdown").hide();
	start = 0;	
	$("#sub").attr("disabled", "disabled");
	timer_is_on = 0;
    $.ajax({
		beforeSend: function(xhr, settings) {
    	    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        	    xhr.setRequestHeader("X-CSRFToken", csrftoken);
        	}
    	},    
    	url : "/learning/skip_question", // the endpoint
        type : "POST", // http method
        data : { }, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	alert(response);
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
}
