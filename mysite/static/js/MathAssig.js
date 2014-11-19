

function answer(e,b){
	if(!e.value) {
    	alert("zadajte odpoved");
    	return false;
	}
	var img = document.createElement('img');
	resize(img);
	var div = document.getElementById("assigment");
	while(div.firstChild){
		div.removeChild(div.firstChild);
	}
	div.appendChild(img);
	var d = document.getElementById("next");
	while(d.firstChild){
		d.removeChild(d.firstChild);
	}
	onclick = function(){
		document.forms["assigForm"].submit();
	};
	if(e.value != b){
		img.src = "/static/img/false.png";		
	} else {
		img.src = "/static/img/true.png";
		setTimeout(onclick,3000);
		return false;
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
	return false;
}

function exit(){
	return true;
}
function resize(img){
	img.setAttribute("width","35");
	img.setAttribute("height","35");
}
