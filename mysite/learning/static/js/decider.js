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
var type_pictures_question = {
	"water":"Koľko percent vody je v pohari?",
	"angle": "Koľko ° má uhol?",
	"line": "koľko krát je spodná priamka väčšia ako vrchná?",
	"obj" : "koľko je na obrázku objektov?",
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

function createQuestion(type,question, p1,p2){
	$("#label").append(deciderType(type,question, p1,p2,"?"));
}

function deciderType(type,question, p1,p2,answer){
var type_question = {
	"equa": question + " = " + answer,
	"sqrt": "\u221A" + question + " = " + answer,
	"sqr": parseInt(question)+p1.sup()+" = " + answer,
};

	if (type in type_pictures_question){
		return (type_pictures_question[type]);
	} else if(type in type_question) {
		return (type_question[type]);
	} else {
		return (question+ decider(p1)+ " = "+ answer + decider(p2) );
	}
}

function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
