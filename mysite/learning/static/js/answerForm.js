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

// function create_post(mId,urlPath) {
function create_post(data,t,skipped) {
	if (sessionStorage.getItem("sended") == "true") {
    	return ;
	} else {
    	sessionStorage.setItem("sended", true);
	}
	$("#divPie").hide();
	start = 0;	
	$("#sub").attr("disabled", "disabled");
	timer_is_on = 0;
    $.ajax({
		beforeSend: function(xhr, settings) {
    	    if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
        	    xhr.setRequestHeader("X-CSRFToken", csrftoken);
        	}
    	},    
    	url : "", // the endpoint
        type : "POST", // http method
        data : { skip: skipped, answer : $('#input').val(), time:  time, data: data, type: t}, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	response = response.split("//");
            answer(response[0],response[1],response[2]);
            return false;
        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};
function createImgPack(number,toAppend,maxHeight){
	var img = [];
	for(var i=0;i<number;i++){	
		var x = document.createElement('img');
		img.push(x);
		resize(img[i],maxHeight);
		toAppend.appendChild(img[i]);
	}
	return img;
}

function answer(diff,result,percentil){

	var div = document.getElementById("assigment");
	var timeDiv = document.getElementById("timeAssig");
	delet(div);
	delet(document.getElementById("hint"));
	var stars = createImgPack(5,div,35);
	var lights = createImgPack(5,timeDiv,20);
	var d = document.getElementById("next");
	delet(d);
	if (diff < 0.03){
		setStars(stars,5);	
	} else if (diff < 0.06){
		setStars(stars,4);	
	} else if (diff < 0.09){
		setStars(stars,3);	
	} else if (diff < 0.12){
		setStars(stars,2);	
	} else if (diff < 0.15){
		setStars(stars,1);	
	} else{
		setStars(stars,0);	
	}
	if (percentil < 20){
		setLight(lights,5);
	} else if(percentil < 40 ){
		setLight(lights,4);
	} else if(percentil < 60){
		setLight(lights,3);
	} else if (percentil < 80){
		setLight(lights,2);
	} else {
		setLight(lights,1);
	}
	var txt_message = "spravna odpoved bola: "+result;
	$("#answer").append(document.createTextNode(txt_message));
	setTimeout(function () {
		window.location.href = $('#assigForm').attr('action');
		return false;
		},1500 );
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
}

function delet(div){
	if (div != null){
		while(div.firstChild){
			div.removeChild(div.firstChild);
		}
	}
}

function resize(img,max){
	var byWindow = ((5*$(window).height())/100);
	if (byWindow < max){
		img.setAttribute("width",byWindow);
		img.setAttribute("height",byWindow);
	} else {
		img.setAttribute("width",max);
		img.setAttribute("height",max);
	}
}

Number.prototype.round = function(places) {
  return +(Math.round(this + "e+" + places)  + "e-" + places);
};

function setLight(img, number){
	for (var p=0; p < number; p++){
		img[p].src = "/static/img/light.png";
	}
}
