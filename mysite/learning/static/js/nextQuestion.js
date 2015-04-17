var testP;
window.onload=function(){
	$("#input").focus();
};
function handleNextQuestion(t,testParam,maxQ){
		$("#timeCounter").hide();
		$("#testCounter").show();
		if (testParam == 0){
			startCounter = 0;
		} else {
			startCounter = testParam -1;
		}

		$("#testCounter").append("<span id='customCounter' style=\"width: "+(startCounter)*maxQ+"%;\" class=\"meter custom\" \
			align='center'></span>");
		
		var v=testParam;
	 	if (v>100){
	 		throw 404;
	 	}
	 	v*=maxQ;
		$("#customCounter").animate({width:v.toString()+"%"});
	// if (test == "time"){
		// $("#testCounter").hide();
		// $("#timeCounter").show();
	// }
}

