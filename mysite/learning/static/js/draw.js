var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
function draw(type,question,p1,p2){

	switch(type){
		case 'angle':
			drawAngle(question,p1,90);
			break;
		case 'water':
			drawGlass(question);
			break;
	}

}
function drawAngle(angle,type,size){
	xs = 160;
	ys = 60;
	x1 = 80;
	y1 = 60;
	xe = x1 + size * Math.cos(Math.PI * angle / 180.0);
	ye = y1 + size * Math.sin(Math.PI * angle / 180.0);
	ctx.moveTo(xs,ys);
	ctx.lineTo(x1,y1);
	ctx.moveTo(x1, y1);
	ctx.lineTo(xe,ye);
	ctx.stroke();
	drawAngleSymbol(type,ctx,xs,ys,x1,y1,xe,ye);
}
function drawAngleSymbol(type,ctx,xs,ys, x1,y1, xe,xy) {

    var dx1 = xe - x1;
    var dy1 = ye - y1;
    var dx2 = xs - x1;
    var dy2 = ys - y1;
    var a1 = Math.atan2(dy1, dx1);
    var a2 = Math.atan2(dy2, dx2);
    ctx.save();
    ctx.beginPath();
    ctx.moveTo(x1, y1);
    if ( type == "out"){
    	ctx.arc(x1, y1, 20, a1, a2);
    } else {
    	ctx.arc(x1, y1, 50, a2, a1);
    }
    ctx.closePath();
    ctx.fillStyle = "red";
    ctx.globalAlpha = 0.25;
    ctx.fill();
    ctx.restore();
    ctx.fillStyle = "black";
}

function drawGlass(v){
	v=40;
	var base = 50;
	var top = 70;
	var h = 10;
	var tx = (ctx.canvas.width - top)/2;
	var bx = (ctx.canvas.width - base)/2;
	var hy = (ctx.canvas.height - h);
	var x1=bx;
	var x2=bx + base;
	var x3=tx + top;
	var x4=tx;
	var y1=hy;
	var y2=hy;
	var y3=10;
	var y4=10;
	ctx.moveTo(x1,y1);
	ctx.lineTo(x2,y2);
	ctx.lineTo(x3,y3);
	ctx.moveTo(x1,y1);	
	ctx.lineTo(x4,y4);
	dy = y1 - y3;
	dx = x1 - x3;
	theta = Math.atan2(dy, dx);
	theta *= 180/Math.PI;
	var missing = Math.sqrt((Math.pow(v/Math.sin(theta),2)-Math.pow(v,2)))*2+base;
	var mx1 = x1+base/2 - missing/5;
	var mx2 = x1+ base/2 + missing/5;
	var my1 = hy-v;
	var my2 = hy-v;
	alert(missing);
	alert("x1 "+x1);
	alert("mx1 "+mx1);
	ctx.moveTo(mx1,my1);
	ctx.lineTo(mx2,my2);
	ctx.stroke();
}






