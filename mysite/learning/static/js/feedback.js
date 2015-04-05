function sendFeedback(){
	event.preventDefault();
	$.ajax({
		beforeSend: function(xhr, settings) {
    	    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        	    xhr.setRequestHeader("X-CSRFToken", csrftoken);
        	}
    	},    
    	url : "/learning/send_mail", // the endpoint
        type : "POST", // http method
        data : { email:$("#email").val(), data: $("#userMessage").val() }, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
			if (response = "1"){
				$('#feedback').foundation('reveal', 'close');	
			}
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
}
