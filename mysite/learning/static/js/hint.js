function hint(p1,p2){
	var c = $("#hint")[0];
	var ctx = c.getContext("2d");
	var im = document.createElement("img");	
	// im.src="/static/img/"+p1+p2+".png";
	im.src = "/static/img/fb.png";
	im.onload = function(){
		ctx.beginPath();
		ctx.drawImage(im,0,0,70,70);
		ctx.closePath();
	};
};
