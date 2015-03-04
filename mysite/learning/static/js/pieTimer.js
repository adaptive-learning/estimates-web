function drawTimer(ele,sec,width,height,r,t){
	$('<canvas>').attr({
	    id: "timer"
	}).css({
	    width: r*4,
	    height: r*2, 
	}).appendTo('#'+ele);

	var canvas = $("#timer").get(0);
	var context=canvas.getContext("2d");
	
    start_angle = 1.5 * Math.PI, //to start from north
    end_angle = 2 * Math.PI, //to start from north and end at north
    increase_end_angle = 0, //to increase/animate the arc  in to circle.
    scale = 2, /// for high resolution

    startTime = (new Date()).getTime();
    x = width/2 ; /// offset 0.5 to make sharper drawing
    y = height/2 ;

	context.lineWidth = 6 * scale;

	var interval = setInterval(anim, 120);
	
	function anim() {
	    var diff = (new Date()).getTime() - startTime;
	    diff = diff / (sec*1000); //60000ms = 60s
	    
	    increase_end_angle = start_angle - (end_angle * diff);
	    context.clearRect(0, 0, canvas.width, canvas.height);
	    context.beginPath();
	    context.arc(x, y, r, start_angle, increase_end_angle);
	    context.stroke();
	    if(diff >= 1){
			clearInterval(interval);
			alert(window.sessionStorage.getItem("testType"));
			get_result(t,window.sessionStorage.getItem("testType"));
	    } else {
	    	window.sessionStorage.setItem("time",increase_end_angle);
	    }
	    return increase_end_angle;
	}
}

// function start(ctx,canvas,fr,time){
	// ctx.clearRect(0,0,canvas.width,canvas.height);
	// ctx.beginPath();
	// t++;
	// var amount = (2*Math.PI)/(fr*1000);
	// ctx.arc(width/2,height/2,50,amount,2*Math.PI,true);
	// window.sessionStorage.setItem("time",t);
// }
