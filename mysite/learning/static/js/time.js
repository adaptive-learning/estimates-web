var t;
var timer_is_on=1;
var time;
var pieTimerTimeout;
function times(){
	if(timer_is_on){
		var timer = $("#timer");
		timer.empty();


		time = time+1;
		t=setTimeout("times()",1000);
	}
}

function timer(sec,color,anti,stay,start,end,itotal){
	
    canvas = document.getElementById('pie-countdown');
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
                draw_next(step,color,anti,stay,start,end);
            };
        })();


        pieTimerTimeout = setTimeout(delayed,-1000/fps*(i-total));
    	}
    }
}
        
function draw_next(step,color,anti,stay,start,end) { // step between 0 and 1

    function draw_circ(s,an){
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
		draw_circ(step,anti);           
    } else {
    	if (stay == true){
			draw_circ(1,true);
      	} else {
			timer(30,"#750000",false,true,1,1,0);
	  	}
    }
}


$(document).ready(function() {
});