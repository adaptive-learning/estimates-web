function process(answer, result){
	
	if(!answer.value) {
    	alert("zadajte odpoved");
    	return false;
	}
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
	
	if(answer.value != result){
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
	return true;
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
