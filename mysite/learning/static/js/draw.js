function Point(x,y){
	this.x = x;
	this.y = y;
}

function draw(type,question,p1,p2){
	var c = $("#myCanvas")[0];
	var ctx = c.getContext("2d");
	question = question.replace(',','.');
	switch(type){
		case 'angle':
			var A = new Point(160,60);
			var B = new Point(80,60);
			var C = drawAngle(ctx,A,B,question,90);
			drawAngleSymbol(p1,ctx,A,B,C);
			break;
		case 'water':
			drawGlass(ctx,question,parseInt(p1),parseInt(p2));
			break;
		case 'line':
			drawLines(ctx,parseFloat(question),parseFloat(p1));
			break;
		default:
			$("#canvasDiv").insertAfter("<br/>");
			$("#canvasDiv").hide();
			break;
	}
}
function drawAngle(ctx,A,B,angle,size){

	var C = new Point(
					B.x + size * Math.cos(Math.PI * angle / 180.0),
					B.y + size * Math.sin(Math.PI * angle / 180.0)
					);
    ctx.save();
	ctx.fillStyle = "black";
	ctx.beginPath();
	ctx.moveTo(A.x,A.y);
	ctx.lineTo(B.x,B.y);
	ctx.lineTo(C.x,C.y);
	ctx.stroke();
	ctx.stroke();
	ctx.closePath();
	ctx.restore();
	
	return C;
}

function drawAngleSymbol(type,ctx,A, B, C) {
	var M = new Point(C.x-B.x,C.y-B.y);
	var E = new Point(A.x-B.x,A.y-B.y);
	var A1 = new Point(Math.atan2(E.y,E.x),Math.atan2(M.y,M.x));
    ctx.save();
    ctx.beginPath();
    ctx.moveTo(B.x, B.y);	
    if ( type == "out"){
    	ctx.arc(B.x, B.y, 20, A1.y, A1.x);
    } else {
    	ctx.arc(B.x, B.y, 50, A1.x, A1.y);
    }
    ctx.closePath();
	ctx.fillStyle = "red";
    ctx.globalAlpha = 0.25;
    ctx.fill();
    ctx.restore();
    ctx.fillStyle = "black";
}

function drawGlass(ctx,v,base,height){
	
	if (height > ctx.canvas.height)
		height = ctx.canvas.height;
	
	
	
	var bx = (ctx.canvas.width - base)/2;
	var by = height+40;
	var A = new Point(bx,by);
	var B = new Point(bx+base,by);
	var C = new Point(bx,by-height);
	var D = new Point(bx+base,by-height);

	ctx.save();
	ctx.beginPath();

	
	ctx.fillStyle = "black";
	ctx.lineWidth=5;
		ctx.moveTo(A.x,A.y);
		ctx.lineTo(B.x,B.y);
		ctx.stroke();
		ctx.lineWidth=2;
		ctx.moveTo(B.x,B.y);
		ctx.lineTo(D.x,D.y);
		ctx.moveTo(A.x,A.y);
		ctx.lineTo(C.x,C.y);
	ctx.stroke();
	ctx.closePath();
	ctx.restore();
	
	v = (v/100)*(height);
	var m1 = new Point(A.x,by-v);
	var m2 = new Point(B.x,by-v);
	ctx.fillStyle = "blue";
	ctx.beginPath();
		ctx.moveTo(A.x-1,A.y-2);
		ctx.lineTo(B.x-1,B.y-2);
		ctx.lineTo(m2.x-1,m2.y-1);
		ctx.lineTo(m1.x+1,m2.y-1);
		ctx.lineTo(A.x+1,A.y-1);
		
	ctx.closePath();
// 	
	ctx.fill();
}


function find_angle(A,B,C) {
    var AB = Math.sqrt(Math.pow(B.x-A.x,2)+ Math.pow(B.y-A.y,2));    
    var BC = Math.sqrt(Math.pow(B.x-C.x,2)+ Math.pow(B.y-C.y,2)); 
    var AC = Math.sqrt(Math.pow(C.x-A.x,2)+ Math.pow(C.y-A.y,2));
    return Math.acos((BC*BC+AB*AB-AC*AC)/(2*BC*AB)) * 180/Math.PI;
}

function drawLines(ctx,small, big){

	if (big > ctx.canvas.width){
		alert("is bigger");
		newB = ctx.canvas.width - 10;
		var per = (newB)/big;
		big = newB;
		small = per * small;
	}
	quaterH = ctx.canvas.height/3;
	var x = ctx.canvas.width/2 - small/2;
	var x1 = ctx.canvas.width/2 - big/2;
	S1 = new Point(x,quaterH);
	S2 = new Point(x+small,quaterH);
	B1 = new Point(x1,2*quaterH);
	B2 = new Point (x1 + big,2*quaterH);
	
	ctx.beginPath();
	ctx.lineWidth = 3;
		ctx.moveTo(S1.x,S1.y);
		ctx.lineTo(S2.x,S2.y);
ctx.moveTo(B1.x,B1.y);
ctx.lineTo(B2.x,B2.y);
ctx.stroke();
	ctx.closePath();
}

function drawObjs(ctx,sq,cir,tri){
}
