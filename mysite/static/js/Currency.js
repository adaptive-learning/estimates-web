include('answerForm.js');

function decider(curr){
	switch(curr){
		case 'USD': 
			document.write("$");
			break;
		case 'PLN': 
			document.write("zł");
			break;
		case 'HUF': 
			document.write("Ft");
			break;
		case 'CZK': 
			document.write("kc");
			break;
		case 'CHF': 
			document.write("Fr.");
			break;
		case 'GBP': 
			document.write("£");	
			break;
		case 'RUB': 
			document.write("руб");	
			break;
		case 'EUR': 
			document.write("€");	
			break;
	}
}

function answerC(answer,result){
	
	var res = process(answer,roundToTwo(result));
	if(res){
		var diff = result - answer.value;
		
		var a = document.getElementById("answer");
		delet(a);
		a.appendChild(document.createTextNode("správna odpoveď bola: " + result + " líšili ste sa o: " + roundToTwo(diff)));
	}
	return false;
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
