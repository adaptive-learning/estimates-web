function drawTimer(ele,width,height){
	$('<canvas>').attr({
	    id: "timer"
	}).css({
	    width: width + 'px',
	    height: height + 'px'
	}).appendTo('#'+ele);

	var canvas = $("#timer");
	var ctx=canvas.getContext("2d");
	alert("okeej");
	ctx.beginPath();
	ctx.arc(100,75,50,0,2*Math.PI);
	ctx.stroke();
	alert("all ok");
		
}

function start(fr,time){
	
}
