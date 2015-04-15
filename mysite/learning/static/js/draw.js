function Point(x,y,size){
	this.x = x;
	this.y = y;
	this.size = size;
}

function draw(type,question,p1,p2){
	var c = $("#myCanvas")[0];
	var ctx = c.getContext("2d");
	question = question.replace(',','.');
		// ctx.beginPath();
	// ctx.moveTo(ctx.canvas.width,ctx.canvas.height);
	// ctx.lineTo(0,0);
	// ctx.stroke();
	// ctx.closePath();
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
		case 'obj':
			drawObjs(ctx,question,parseFloat(p1),parseFloat(p2));
			break;
		case 'objsVol':
			drawObjsVol(ctx,p1,p2);			break;
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
		newB = ctx.canvas.width - 10;
		var per = (newB)/big;
		big = newB;
		small = per * small;
	}
	quaterH = ctx.canvas.height/3;
	var x = 10;
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
function generateObjects(ctx,k,size,points) {
	var newPoints = [];
	for (var i=0;i<k;i++){
		var counter = 0;
		var ok = true;	
		do{
			x = Math.floor((Math.random() * (ctx.canvas.width-size)) );
			y = Math.floor((Math.random() * (ctx.canvas.height-size)) ); 
			for (var l=0;l<points.length;l++){
				point = points[l];

				bordersX = [point.x,point.x+point.size];
		
				bordersY = [point.y,point.y+point.size];
				
				bX = [x,x+size];
				bY = [y,y+size];
				
				if ((bX[0] > bordersX[0] && bX[0] < bordersX[1]) ||
					(bX[1] > bordersX[0] && bX[1] < bordersX[1]) ||
					 (bY[0] < bordersY[1] && bY[0] > bordersY[0]) ||
					 (bY[1] < bordersY[1] && bY[1] > bordersY[0]) ||
					 bX[0] == bordersX[0] && bY[0] == bordersY[0]){
			
			 	 	ok = false;

			 		break;
			 	} else {
					ok = true;
			 	}
			}
		}while(ok != true );
		var P = new Point(x,y,size);
		points.push(P);
		newPoints.push(P);
	}	

  	return newPoints;
}

function drawObjs(ctx,sq,cir,tri){

var points = [];

var squares = (generateObjects(ctx,sq,15,points));
var imSquare = get_objImg("square.png");
imSquare.onload = function(){
	points = points.concat(drawObjects(ctx,squares,imSquare));
	var triangles = (generateObjects(ctx,tri,15,points));
	var imTriangle = get_objImg("triangle.svg");
	imTriangle.onload = function(){
		points = points.concat(drawObjects(ctx,triangles,imTriangle));
		var circles = (generateObjects(ctx,cir,15,points));
		var imCircle = get_objImg("circle.svg");
		imCircle.onload = function(){
			points = points.concat(drawObjects(ctx,circles,imCircle));
		};
	};
};


	function get_objImg(what){
		var im = document.createElement("img");
		im.src="/static/img/"+what;
		return im;
	}
	function drawObjects(ctx,array,img){
		for (x=0;x<array.length;x++){
			ctx.beginPath();
	

			ctx.drawImage(img,array[x].x,array[x].y,array[x].size,array[x].size);
			ctx.closePath();
		}
		return array;
	}
}

function drawObjsVol(ctx,a,b){
		var objA = JSON.parse(a);
		var objB = JSON.parse(b);
		objs = normalizeObjects(ctx,[objA,objB]);

		objA = objs[0];
		objB = objs[1];

		Axy = findXY(ctx,0,objA);
		Bxy = findXY(ctx,1,objB);
		
		drawObjVolByType(ctx,objA,Axy,"red",0.5);
		drawObjVolByType(ctx,objB,Bxy,"blue",0.5);
		var offset = 8;
		ctx.beginPath();
		
		ctx.font="20px Georgia";
		ctx.globalAlpha = 1.0;
		ctx.fillStyle = "black";
		ctx.fillText("A",Axy[0]-offset,Axy[1]+offset);
		ctx.fillText("B",Bxy[0]-offset,Bxy[1]+offset);
		ctx.closePath();
}

function normalizeObjects(ctx,objs){
	var sizes;
	var x = 0;
	for (i in objs){
		if (objs[i]["t"] == "c"){
			x += parseInt(objs[i]["r"])*2;
			y = x;
		}
	}

	if (ctx.canvas.width < x+20){
		var n = ctx.canvas.width/2 - 20;
		if (objs[0]["t"] == "c"){
			var change = n / (2*objs[0]["r"]);
			objs[0]["r"] = n/2;
		}
		for (var i = 1; i<objs.length; i++){
			if (objs[i]["t"] == "c"){
				objs[i]["r"] = ((objs[i]["r"]*2) * change)/2;
			}
		}
	}
	return objs;
}
	

function drawObjVolByType(ctx, obj,pos,color,alpha){
	switch(obj["t"]){
		case "c":
			ctx.beginPath();
			ctx.arc(pos[0],pos[1],obj["r"],0,2*Math.PI);
			ctx.fillStyle = color;
    		ctx.globalAlpha = alpha;
			ctx.stroke();
			ctx.fill();
			ctx.closePath();
			break;
	}
}
function findXY(ctx, num, obj){
	if (num == 0){
		switch(obj["t"]){
			case "c":
				return [ctx.canvas.width -10 - obj["r"]
						, ctx.canvas.height -10 - obj["r"]];
			}		
	} else if (num == 1){
		switch(obj["t"]){
			case "c":
				var pos = 10+obj["r"];
				return [pos,pos];
			}
	}

}
