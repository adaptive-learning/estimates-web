var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
function Point(x,y){
	this.x = x;
	this.y = y;
}

function draw(type,question,p1,p2){

	switch(type){
		case 'angle':
			drawAngle(question,p1,90);
			break;
		case 'water':
			drawGlass(question,p1,p2);
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

function drawGlass(v,top,height){
	v=50;
	var top = base + 20;
	var h = 10;
	var tx = (ctx.canvas.width - top)/2;
	var bx = (ctx.canvas.width - base)/2;
	var hy = (ctx.canvas.height - h);
	v = (v/100)*(hy-h);
	var A = new Point(bx,hy);
	var B = new Point(bx+base,hy);
	var C = new Point(tx+top,h);
	var D = new Point(tx,h);
	ctx.moveTo(A.x,A.y);
	ctx.lineTo(B.x,B.y);
	ctx.lineTo(C.x,C.y);
	ctx.moveTo(A.x,A.y);	
	ctx.lineTo(D.x,D.y);
	var angle = (find_angle(D,A,B) - 90) * (Math.PI/180);
	var missing = Math.abs(Math.tan(angle)*v);
	var m1 = new Point(A.x-missing,hy-v);
	var m2 = new Point(B.x+missing,hy-v);
	ctx.moveTo(m1.x,m1.y);
	ctx.lineTo(m2.x,m2.y);
	ctx.stroke();
	ctx.fillStyle = "blue";
	ctx.beginPath();
		ctx.moveTo(A.x-1,A.y-1);
		ctx.lineTo(B.x-1,B.y-1);
		ctx.lineTo(m2.x-1,m2.y-1);
		ctx.lineTo(m1.x+1,m2.y-1);
		ctx.lineTo(A.x+1,A.y-1);
	ctx.closePath();
	ctx.fill();
}


function find_angle(A,B,C) {
    var AB = Math.sqrt(Math.pow(B.x-A.x,2)+ Math.pow(B.y-A.y,2));    
    var BC = Math.sqrt(Math.pow(B.x-C.x,2)+ Math.pow(B.y-C.y,2)); 
    var AC = Math.sqrt(Math.pow(C.x-A.x,2)+ Math.pow(C.y-A.y,2));
    return Math.acos((BC*BC+AB*AB-AC*AC)/(2*BC*AB)) * 180/Math.PI;
}



