include ('time.js');
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


// function create_post(mId,urlPath) {
function create_post(data,t) {
	
	timer_is_on = 0;
    $.ajaxSetup({
	    beforeSend: function(xhr, settings) {
	        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	            xhr.setRequestHeader("X-CSRFToken", csrftoken);
	        }
		}
	});
    $.ajax({
    	url : "", // the endpoint
        type : "POST", // http method
        data : { answer : $('#input').val(), time:  minutes*60 + c, data: data, type: t}, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	response = response.split("//");
            answer(response[0],response[1]);
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};

function answer(diff,result){
	var div = document.getElementById("assigment");
	delet(div);
	delet(document.getElementById("hint"));
	var img = [];
	for(var i=0;i<5;i++){	
		var x = document.createElement('img');
		img.push(x);
		resize(img[i]);
		div.appendChild(img[i]);
	}
	var d = document.getElementById("next");
	delet(d);
	onclick = function(){
		window.onbeforeunload=null;
		window.location.href = $('#assigForm').attr('action');
	};
	if (diff < 0.03){
		setStars(img,5);	
	} else if (diff < 0.06){
		setStars(img,4);	
	} else if (diff < 0.09){
		setStars(img,3);	
	} else if (diff < 0.13){
		setStars(img,2);	
	} else if (diff < 0.15){
		setStars(img,1);	
	} else{
		setStars(img,0);	
	}
	var txt_message = "spravna odpoved bola: "+result;
	$("#answer").append(document.createTextNode(txt_message));
	setTimeout(function alertFunc() {
		window.onbeforeunload=null;	
		window.location.href = $('#assigForm').attr('action');
		},3000);
	return false;
}
function setStars(im,x){
	for (var p=0;p<im.length;p++){
		if (p<x){
			im[p].src="/static/img/star.png";
		} else {
			im[p].src="/static/img/star-outline.png";
		}
	}
	return null;
}

function delet(div){
	if (div != null){
		while(div.firstChild){
			div.removeChild(div.firstChild);
		}
	}
}

function resize(img){
	img.setAttribute("width","35");
	img.setAttribute("height","35");
}

Number.prototype.round = function(places) {
  return +(Math.round(this + "e+" + places)  + "e-" + places);
};
