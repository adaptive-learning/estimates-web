include('answerForm.js');


function answer(answer,result){
	
	var res = process(answer,result);
	
	
	if(res){
		var diff = result - answer.value;
		
		var a = document.getElementById("answer");
		delet(a);
		a.appendChild(document.createTextNode("správna odpoveď bola: " + result + " líšili ste sa o: " + diff));
	}
	return false;
}
