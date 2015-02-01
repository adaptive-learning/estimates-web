include('answerForm.js');

function decider(curr){
	if (/[a-z]+\*\*[2-9]/.test(curr)){
		str = curr.split("**");
		document.write(str[0]+str[1].sup());
	} else {
	
		switch(curr){
			case 'USD': 
				document.write("$");
				break;
			case 'PLN': 
				document.write("zł ("+curr+")");
				break;
			case 'HUF': 
				document.write("Ft ("+curr+")");
				break;
			case 'CZK': 
				document.write("kc ("+curr+")");
				break;
			case 'CHF': 
				document.write("Fr. ("+curr+")");
				break;
			case 'GBP': 
				document.write("£ ("+curr+")");	
				break;
			case 'RUB': 
				document.write("руб ("+curr+")");	
				break;
			case 'EUR': 
				document.write("€ ("+curr+")");	
				break;
			case 'degF':
				document.write("°f (fahrenheit)");
				break;
			case 'degC':
				document.write("°C (celsium)");
				break;
			case 'kelvin':
				document.write("K ("+curr+")");
				break;
			case 'are':
				document.write("a ("+curr+")");
				break;
			case 'ft':
				document.write("ft (foot)");
				break;
			case 'inch':
				document.write("″ "+"("+curr+")");
				break;
			case 'mile':
			case 'cm':
			case 'm':
			case 'mm':
			case 'dm':
			case 'km':
			case 'ml':
			case 'l':
			case 'dl':
			case 'hl':
			case 'acre':
				document.write(curr);
				break;
		}
	}
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
