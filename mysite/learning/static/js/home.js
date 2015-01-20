
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
	switch(a){
		case 'math':
			createHrefButton('a','Odmocniny/mocniny','learning/math/sqrt',choice,false);
			createHrefButton('a','Priklady','learning/math/equa',choice,true);
			document.getElementById('header').innerHTML = 'Odhady matematickych prikladov';
			break;
		case 'fyz':
			document.getElementById("header").innerHTML = "Odhady Fyzikalnych jednotiek";
			break;
		case 'curr':
			createHrefButton('a','Eurá (€)','learning/curr/e',choice,false);
			createHrefButton('a','České koruny (CZK)','learning/curr/c',choice,true);
			document.getElementById("header").innerHTML = "Odhady meny";
			break;
		case 'home':
			createButton('a','Mena',function() {home('curr');},choice,false);
			createButton('a','Matematika',function() {home('math');},choice,false);
			createButton('a','Fyzika',function() {home('fyz');},choice,true);
			document.getElementById("header").innerHTML = "Odhad prevodu jednotiek";
			break;
			
	}
}