function Point(x,y){
	this.x = x;
	this.y = y;
}

function draw(type,question,p1,p2){
	var c = $("#myCanvas")[0];
	var ctx = c.getContext("2d");
	switch(type){
		case 'angle':
			var A = new Point(160,60);
			var B = new Point(80,60);
			var C = drawAngle(ctx,A,B,question,90);

			drawAngleSymbol(p1,ctx,A,B,C);

			break;
		case 'water':
			drawGlass(ctx,parseInt(question),parseInt(p1),parseInt(p2),120);
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
				
	ctx.moveTo(A.x,A.y);
	ctx.lineTo(B.x,B.y);
	ctx.lineTo(C.x,C.y);
	ctx.stroke();
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

function drawGlass(ctx,v,base,angle,origD){
	// v = 80;
	// alert("v% "+v);
	angle -= 90;
	if (origD == null){
		origD=(ctx.canvas.height - 10);
	}
	var bx = (ctx.canvas.width - base)/2;
	var by = origD+20;
	var A = new Point(bx,by);
	var B = new Point(bx+base,by);
	var C = drawAngle(ctx,B,A,angle-102,origD);
	var D = drawAngle(ctx,A,B,angle-90,origD);
	var origV = Math.abs(C.y-A.y);
	v = (v/100)*(origV);
	
	// alert("origD "+origD);
	// alert("origV "+origV);
	// alert("v: "+v);
	// alert("C.y "+C.y);
	// alert("pot x"+(by-v));
// 	
// 	
	// alert("distance "+Math.sqrt(Math.pow(A.y-C.y,2)+Math.pow(A.x-C.x,2)));
	
	angle *= (Math.PI/180);
	var missing = Math.abs(Math.tan(angle)*v);
	// alert("missing "+missing);
	// var newX = ctx.canvas.height-(10 + Math.sqrt(Math.pow(v,2)-Math.pow(missing,2)));
	// alert("by "+by);
	var m1 = new Point(A.x-missing,by-v);
	var m2 = new Point(B.x+missing,by-v);
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



