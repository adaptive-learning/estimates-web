function drawTimer(ele,sec,width,height){
	$('<canvas>').attr({
	    id: "timer"
	}).css({
	    width: width + 'px',
	    height: height + 'px'
	}).appendTo('#'+ele);

	var canvas = $("#timer").get(0);
	var ctx=canvas.getContext("2d");
	
	ctx.beginPath();
	ctx.arc(width/2,height/2,50,0,2*Math.PI,true);
	ctx.stroke();
	alert("all ok");
		
}

function start(fr,time){
	
}
