function draw(angle,type,size){
	var c = document.getElementById("myCanvas");
	var ctx = c.getContext("2d");
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
    // draw angleSymbol
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