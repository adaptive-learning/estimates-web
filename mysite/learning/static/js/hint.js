function hint(data) {
    $.ajaxSetup({
	    beforeSend: function(xhr, settings) {
	        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	            xhr.setRequestHeader("X-CSRFToken", csrftoken);
	        }
		}
	});
    $.ajax({
    	url : "/learning/get_hint", // the endpoint
        type : "POST", // http method
        data : { data:data}, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
			$('#after').text(response);
			
    	    $('#myModal').foundation('reveal', 'open');
    	    used_hint = 1;
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};

function tempHint(fr,to){
	if (fr == "degF" && to == "degC"){
		message = "((T(°F) - 32) × 5/9)";		
	} else if(fr == "degC" && to == "degF"){
		message = "(T(°C) × 9/5 + 32)";
	} else if(fr == "degF" && to == "kelvin"){
		message = "((T(°F) + 459.67) × 5/9)";	
	} else if(fr == "kelvin" && to == "degF"){
		message = "((T(°F) + 459.67) × 5/9)";
	} else if(fr == "degC" && to == "kelvin"){
		message = "(T(°C) + 273.15)";
	} else if(fr == "kelvin" && to == "degC"){
		message = "(T(K) - 273.15)";
	}
	$('#after').text(message);
	$('#myModal').foundation('reveal','open');
	used_int = 1;
}
