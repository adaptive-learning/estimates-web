function get_result(t,data) {
	window.sessionStorage.clear();
	window.onbeforeunload=null;
    $.ajaxSetup({
	    beforeSend: function(xhr, settings) {
	        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	            xhr.setRequestHeader("X-CSRFToken", csrftoken);
	        }
		}
	});
    $.ajax({
    	url : "/learning/finish", // the endpoint
        type : "POST", // http method
        data : { type: t, data:data}, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	var r = response.split("//");
           	$("#label").text("");
        	$("#label").append("vas priemerny odhad je: "+((1-parseFloat(r[0]).toFixed(2))*100).toString()+"%");
            if (r.length == 2 ){
 				$("#label").append("vase score v danej oblasi je: "+(r[1]*100).toString()+"%");
       		} 
         	$("#userPart").remove();
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};