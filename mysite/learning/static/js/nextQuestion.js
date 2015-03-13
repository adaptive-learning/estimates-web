var testP;

function handleNextQuestion(t,test,testParam){
	// window.onbeforeunload=goodbye;
	if(test == "set"){
		if (testParam > 10){
			testParam = 10;
			get_result(t);
		}
		$("#timeCounter").hide();
		$("#testCounter").show();
		$("#testCounter").append("<span style=\"width: "+(testParam-1)*10+"%;\" class=\"meter custom\"></span>");
		var v=testParam;
	 	if (v>100){
	 		throw 404;
	 	}
	 	v*=10;
		$(".custom").animate({width:v.toString()+"%"});
	} else if (test == "time"){
		$("#testCounter").hide();
		$("#timeCounter").show();
		drawTimer("timeCounter",200,250,130,50,t,testParam);
	}


}
function goodbye(e) {
	event.preventDefault();
    timer_is_on = 0;
    
    $.ajax({
		beforeSend: function(xhr, settings) {
    	    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        	    xhr.setRequestHeader("X-CSRFToken", csrftoken);
        	}
    	},    
    	url : "/learning/clear_session", // the endpoint
        type : "POST", // http method
        data : { }, // data sent with the post request
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
}