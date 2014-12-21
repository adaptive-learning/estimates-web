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