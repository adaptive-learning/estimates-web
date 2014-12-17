function answer(diff,result){
	
	var img = document.createElement('img');
	resize(img);
	var div = document.getElementById("assigment");
	delet(div);
	div.appendChild(img);
	var d = document.getElementById("next");
	delet(d);
	onclick = function(){
		document.forms["assigForm"].submit();
	};
	
	if(diff > -0.0001 && diff < 0.0001){
		img.src = "/static/img/true.png";
		setTimeout(onclick,3000);
		return false;		
	} else {
		img.src = "/static/img/false.png";
	}
	var next = document.createElement("input");
	next.value = "Ďalej";		
	next.setAttribute('type','submit');
	next.setAttribute('class','button');
	
	if (next.addEventListener) 
			next.addEventListener('click',onclick,false); //everything else    
		else if (choice.attachEvent)
	    	next.attachEvent('onclick',onclick); //IE only
	
	d.appendChild(next);
	var a = document.getElementById("answer");
	delet(a);
	a.appendChild(document.createTextNode("správna odpoveď bola: " + result + " líšili ste sa o: " + diff));
	return false;
}

function delet(div){
	while(div.firstChild){
		div.removeChild(div.firstChild);
	}
}

function resize(img){
	img.setAttribute("width","35");
	img.setAttribute("height","35");
}

Number.prototype.round = function(places) {
  return +(Math.round(this + "e+" + places)  + "e-" + places);
};
