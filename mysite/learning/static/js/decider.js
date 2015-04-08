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


function decider(curr){
	if (/[a-z]+\*\*[2-9]/.test(curr)){
		str = curr.split("**");
		return str[0]+str[1].sup();
	} else if (curr in symbol_dict) {
			return symbol_dict[curr];
		} else {
	    	return curr;
		}
		
}


function createQuestion(element,type,translated,question, p1,p2){
	$("#"+element).append(deciderType(type,translated,question, p1,p2,"?"));
}

function deciderType(type,translated,question, p1,p2,answer){
var type_question = {
	"equa":  p1 + " = " + answer,
	"sqrt": "\u221A" + question + " = " + answer,
	"sqr": parseInt(question)+p1.sup()+" = " + answer,
};
	if (translated != "False"){
		return (translated);
	} else if(type in type_question) {
		return (type_question[type]);
	} else {
		return (question+ decider(p1)+ " = "+ answer + decider(p2) );
	}
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
