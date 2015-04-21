var t;
var timer_is_on=1;
var time ;
var pieTimerTimeout;
function times(){
	if(timer_is_on){


		time = time+1;
		t=setTimeout("times()",1000);
	}
}
function afterTestTimer(stay){
	if (stay == true){
		draw_circ(1,true);
  	} else {
		timer('pie-countdown',30,"#750000",false,function(){ return afterTestTimer("true");},1,1,0);
  	}
}


function timer(element,sec,color,anti,func,start,end,itotal){
	

	
    canvas = document.getElementById(element);
    
    ctx = canvas.getContext('2d');
    canvas_size = [canvas.width, canvas.height];
    radius = Math.min(canvas_size[0], canvas_size[1]) / 2;
    center = [canvas_size[0]/2, canvas_size[1]/2];
    fps= 40;
    cycle();
    // setTimeout((function(){
    	// }
    	// ),20000);
    function cycle(){

    	var total = fps*sec;
        for(var i=total;i>=total*itotal;i--) {
        var delayed = (function(){
        	//change this for another start
            var step = start-i/total;
            var left = Math.ceil(i/fps);
            return function() {
                draw_next(step,color,anti,func,start,end);
            };
        })();


        pieTimerTimeout = setTimeout(delayed,-1000/fps*(i-total));
    	}
    }
}
        
function draw_next(step,color,anti,func,start,end) { // step between 0 and 1

    function draw_circ(s,an,color){
	    ctx.clearRect(0,0,canvas_size[0], canvas_size[1]);
    	ctx.beginPath();
        ctx.moveTo(center[0], center[1]); 
		ctx.arc(  
        	center[0],
        	center[1],
    	    	radius,
        	Math.PI * (-0.5 + 0),  
        	Math.PI * (-0.5 + s*2),
        	an
    	);
		ctx.lineTo(center[0], center[1]); 
    	ctx.closePath();
    	ctx.fillStyle = color;    
 		ctx.fill();
    }
    if(step < end) {
		draw_circ(step,anti,color);           
    } else {
		func();
    }
}


function drawPieTimer(fullTime,medTime2f,test){
	$.ajax({
	    beforeSend: function(xhr, settings) {
	        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	            xhr.setRequestHeader("X-CSRFToken", csrftoken);
	        }
		},
    	url : "/learning/save_time", // the endpoint
        type : "POST", // http method
        data : { data:new Date().getTime() / 1000}, 
        success: function(response){
			splitted = response.split("//");
			if (splitted[0] == "true"){
				time = Math.floor(parseFloat(splitted[1]));
			}	 else {
				time = 0;
			}
        	if (test == "time"){
        		timerSet(response,fullTime);
        	} 	
        	times();
        },
		async: false,
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });	
}
function timerSet(response,fullTime){

	splitted = response.split("//");
	if (splitted[0] == "true"){
		var medTime = parseFloat(fullTime);
		var medTime = parseFloat(fullTime);
		var start = time / medTime;
		var end = 0;
		
		if (time > medTime){
			
			var Newtime = time - medTime;
			
			if (Newtime > 30){
				timer('pie-countdown', 0, "#750000", false, function(){ return afterTestTimer("true"); },0,0,0);
			} else {
				start = Newtime / 30;
				timer('pie-countdown',30,"#750000",false,true,start,end,start);
			}
		} else {
			timer('pie-countdown',fullTime,"#0F482D",true,function(){ return afterTestTimer("true");},start,end,start);
		}
	} else {
		var end = 1;
		var start = 1;
		var total = 0;
		timer('pie-countdown',parseFloat(fullTime),"#0F482D",true,function(){ return afterTestTimer("true");},start,end,total);
	}	
} 

function timerTime(response,fullTime){
	splitted = response.split("//");
	if (splitted[0] == "true"){
		time = Math.floor(parseFloat(splitted[1]));
	} else {
		time = 0;
	}
	var start = Math.floor(parseFloat(splitted[2])) / fullTime;
	var end = 0;
	timer('testTimer',fullTime,"#0F482D",true,get_result,start,end,start);
}

function resizeCounter(min){
	alert("k");	
	 	var newWidth = $(window).width()/25;
	 	if (newWidth < min){
 			newWidth = min;
	 	}
		$("#pie-countdown").css("width",newWidth);
}

