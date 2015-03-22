var c=0;
var minutes= 0;
var t;
var timer_is_on=1;

function time(){
	if(timer_is_on){
		var timer = $("#timer");
		timer.empty();

		c = c+1;
		if (c%60 == 0 && c !=0){
			minutes += 1;
			c = 0;
		}
		t=setTimeout("time()",1000);
	}
}
time();
function timer(sec,color,anti,stay){
    canvas = document.getElementById('pie-countdown');
    ctx = canvas.getContext('2d');
    canvas_size = [canvas.width, canvas.height];
    radius = Math.min(canvas_size[0], canvas_size[1]) / 2;
    center = [canvas_size[0]/2, canvas_size[1]/2];
    start = 1; // varia de 1 até 0
    fps= 40;
    seconds = 20;
    cycle();
    // setTimeout((function(){
    	// }
    	// ),20000);
    function cycle(){

    	var total = fps*sec;
        for(var i=total;i>=0;i--) {
        var delayed = (function(){
            var step = 1-i/total;
            var left = Math.ceil(i/fps);
            return function() {
                draw_next(step,color,anti,stay);
            };
        })();
        setTimeout(delayed,-1000/fps*(i-total));
    	}
    }
}
        
function draw_next(step,color,anti,stay) { // step between 0 and 1

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
    if(step < 1) {
		draw_circ(step,anti);           

    } else {
    	if (stay == true){
			draw_circ(1,true);
      } else {
    	timer(30,"#750000",false,true);
		}
    }
}


$(document).ready(function() {
});