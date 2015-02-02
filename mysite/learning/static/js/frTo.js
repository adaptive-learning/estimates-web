include('answerForm.js');




function decider(curr){
	var symbol_dict = {'EUR': '€ (EUR)',
					   'USD': '$ (USD)',
				       'PLN': 'zł (PLN)',
				       'HUF': 'Ft (HUF)',
				       'CZK': 'kč (CZK)',
				       'CHF': 'Fr. (CHF)',
				       'GBP': '£ (GBP)',
				       'RUB': 'руб (RUB)',
				       'degF': '°f (fahrenheit)',
				       'degC': '°C (celsium)',
				       'kelvin': 'K (kelvin)',
				       'are': 'a (are)',
				       'ft': 'ft (foot)',
				       'inch': '″ (inch)',
					  };
	if (/[a-z]+\*\*[2-9]/.test(curr)){
		str = curr.split("**");
		document.write(str[0]+str[1].sup());
	} else if (curr in symbol_dict) {
			document.write(symbol_dict[curr]);
		} else {
	    	document.write(curr);
		}
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
