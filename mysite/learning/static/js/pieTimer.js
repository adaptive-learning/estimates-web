var interval;
function drawTimer(ele,sec,width,height,r,t,fr){
	$('<canvas>').attr({
	    id: "testTimer"
	}).css({
	    width: r*4,
	    height: r*2, 
	}).appendTo('#'+ele);

	var canvas = $("#testTimer").get(0);
	var context=canvas.getContext("2d");
	// fr = parseFloat(testP) ;
	var start_angle = 1.5*Math.PI;
    end_angle = (2 * Math.PI); //to start from north and end at north

    var increase_end_angle = 0, //to increase/animate the arc  in to circle.
    scale = 2, /// for high resolution

    x = width/2 ; /// offset 0.5 to make sharper drawing
    y = height/2 ;

	context.lineWidth = 6 * scale;
   	var startTime = parseInt(fr);
   	// var startTime = 1425639356376;
   	testP = startTime;
	interval = setInterval(anim, 60);
	function anim() {
	    diff = (new Date()).getTime() - startTime;

	    diff = diff / (sec*1000); //60000ms = 60s
	    increase_end_angle = start_angle - (end_angle * diff);
	    context.clearRect(0, 0, canvas.width, canvas.height);
	    context.beginPath();
	    context.arc(x, y, r, start_angle, increase_end_angle);

	    context.stroke();
	    if(diff >= 1){
			clearInterval(interval);
	    } 
	    // else {
	    	// testP = increase_end_angle;
	    // }
	}
}
