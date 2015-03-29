var testP;
window.onload=function(){
	$("#input").focus();
};
function handleNextQuestion(t,test,testParam){
	// window.onbeforeunload=goodbye;
	if(test == "set"){
		if (testParam > 5){
			testParam = 10;
			get_result(t);
		}
		$("#timeCounter").hide();
		$("#testCounter").show();
		$("#testCounter").append("<span style=\"width: "+(testParam-1)*10+"%;\" class=\"meter custom\"></span>");
		var v=testParam;
	 	if (v>100){
	 		throw 404;
	 	}
	 	v*=10;
		$(".custom").animate({width:v.toString()+"%"});
	} else if (test == "time"){
		$("#testCounter").hide();
		$("#timeCounter").show();
		drawTimer("timeCounter",200,250,130,50,t,testParam);
	}


}
function goodbye(e) {
	event.preventDefault();
    timer_is_on = 0;
}
