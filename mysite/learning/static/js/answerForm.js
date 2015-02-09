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
            var splitter = response.split("//");
            answer(splitter[0],splitter[1],t);
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};

function answer(diff,result,type){
	var img = document.createElement('img');
	resize(img);
	var div = document.getElementById("assigment");
	delet(div);
	div.appendChild(img);
	var d = document.getElementById("next");
	delet(d);
	onclick = function(){
		window.location.href = $('#assigForm').attr('action');
	};
	// if(type == "e" || type == "c"){ 
		if (diff < 0.05){
			txt_message = "vas odhad bol presny" + result;
		} else if (diff < 0.1){
			txt_message = "vas odhad bol takmer presny" + result;	
		} else if (diff < 0.15){
			txt_message = "odhadli ste priblizne správne" + result;
		} else if (diff < 0.2){
			txt_message = "vas odhad nie je správny" + result;
		} else {
			txt_message = "vas odhad je mimo" + result;
		}
	// } else {
		// if(diff > -0.0001 && diff < 0.0001){
			// img.src = "/static/img/true.png";
			// setTimeout(onclick,3000);
			// return false;		
		// } else {
			// img.src = "/static/img/false.png";
			// txt_message = "správna odpoveď bola: " + result + " líšili ste sa o: " + diff;
		// }
	// }
	var next = document.createElement('input');
	next.value = "Ďalej";		
	next.setAttribute('type','button');
	next.setAttribute('class','button');
	
	if (next.addEventListener) 
			next.addEventListener('click',onclick,false); //everything else    
		else if (choice.attachEvent)
	    	next.attachEvent('onclick',onclick); //IE only
	
	d.appendChild(next);
	var a = document.getElementById("answer");
	delet(a);
	a.appendChild(document.createTextNode(txt_message));
	return false;
}

function delet(div){
	while(div.firstChild){
		div.removeChild(div.firstChild);
	}
}

function resize(img){
	img.setAttribute("width","35");
	img.setAttribute("height","35");
}

Number.prototype.round = function(places) {
  return +(Math.round(this + "e+" + places)  + "e-" + places);
};
