include('answerForm.js');
function decider(curr){
	var symbol_dict = {
					   'EUR': '€ (EUR)',
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
		return str[0]+str[1].sup();
	} else if (curr in symbol_dict) {
			return symbol_dict[curr];
		} else {
	    	return curr;
		}
}
function deciderType(type,question, p1,p2){
var type_messages = {
	"water":"Koľko percent vody je v pohari?",
	"angle": "Koľko ° má uhol?",
	"equa": question + " = ?",
	"sqrt": "\u221A" + question + " = ?",
	"sqr": parseInt(question)+p1.sup()+" = ?",
	"line": "koľko krát je spodná priamka väčšia ako vrchná?",
	"obj" : "koľko je na obrázku objektov?",
}; 
	if(type in type_messages){
		$("#label").append(type_messages[type]);
	}else {
		$("#label").append(question + " "+ decider(p1)+ " = ? " + decider(p2) );
	}
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
