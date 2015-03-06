include('variables.js');

function createButton(tag,name,onclick,parent,last){
	var btn = document.createElement(tag);
	var t = document.createTextNode(name);
	btn.appendChild(t);
	btn.setAttribute('class', 'button');
	if(onclick){	
		if (btn.addEventListener) 
			btn.addEventListener('click',onclick,false); //everything else    
		else if (choice.attachEvent)
	    	btn.attachEvent('onclick',onclick); //IE only
	}
	parent.appendChild(btn);
	if(!last)
		parent.appendChild(document.createTextNode(' '));
}

function createHrefButton(tag,name,href,parent,last){
	var btn = document.createElement(tag);
	var t = document.createTextNode(name);
	btn.appendChild(t);
	btn.setAttribute('class', 'button');
	
	btn.href = href;
	parent.appendChild(btn);
	if(!last)
		parent.appendChild(document.createTextNode(' '));
}

function home(a){
	var choice = document.getElementById('choice');
	while(choice.firstChild){
		choice.removeChild(choice.firstChild);
	}
	if (a == 'home'){
		for (v in nameTypes[a]){
			var e = nameTypes[a][v];
			createButton('a',nameReal[nameTypes[a][v]][0],function(j) {return function() {home(j);};}(e),choice,false);
		}
		createHrefButton('a','Všetko','/learning/all-all',choice,true);
		$('#back').hide();
	} else {
		for (var v in nameTypes[a]){
			var h = "/learning/"+nameUrls[a]+'/'+nameTypes[a][v];
			createButton('a',typeReal[nameTypes[a][v]],function(j) {return function() {chooseType(j);};}(h),choice,false);
		}
		createHrefButton('a','Všetko','/learning/'+a+'/'+a+'-all/',choice,true);
		$('#back').show();
	}
	document.getElementById("header").innerHTML = nameReal[a][1];
}
function chooseType(href){
	var choice = document.getElementById('choice');
	while(choice.firstChild){
		choice.removeChild(choice.firstChild);
	}
	createHrefButton('a',"test",href+"/set",choice,false);
	createHrefButton('a',"time",href+"/time",choice,false);
}
