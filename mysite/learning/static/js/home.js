
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
			createHrefButton('a','Odmocniny','/learning/math/sqrt',choice,false);
			createHrefButton('a','Priklady','/learning/math/equa',choice,false);
			createHrefButton('a','Všetko','/learning/math/math-all/',choice,true);
			document.getElementById('header').innerHTML = 'Odhady matematickych prikladov';
			break;
		case 'fyz':
			createHrefButton('a','Vzdialenosť','/learning/conv/len',choice,false);
			createHrefButton('a','Plocha','/learning/conv/surf',choice,false);
			createHrefButton('a','Objem','/learning/conv/vol',choice,false);		
			createHrefButton('a','Teplota','/learning/conv/temp',choice,false);
			createHrefButton('a','Všetko','/learning/conv/phys-all/',choice,true);
			document.getElementById("header").innerHTML = "Odhady Fyzikalnych jednotiek";
			break;
		case 'curr':
			createHrefButton('a','Eurá (€)','/learning/conv/e',choice,false);
			createHrefButton('a','České koruny (CZK)','/learning/conv/c',choice,false);
			createHrefButton('a','Všetko','/learning/conv/curr-all/',choice,true);
			document.getElementById("header").innerHTML = "Odhady meny";
			break;
		case 'home':
			createButton('a','Mena',function() {home('curr');},choice,false);
			createButton('a','Matematika',function() {home('math');},choice,false);
			createButton('a','Fyzika',function() {home('fyz');},choice,false);
			createHrefButton('a','Všetko','/learning/all/',choice,true);
			document.getElementById("header").innerHTML = "Odhad prevodu jednotiek";
			break;
			
	}
}