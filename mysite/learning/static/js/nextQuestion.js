var testP;
window.onload=function(){
	$("#input").focus();
};
function handleNextQuestion(t,testParam,maxQ){
		$("#timeCounter").hide();
		$("#testCounter").show();
		$("#testCounter").append("<span style=\"width: "+(testParam-1)*maxQ+"%;\" class=\"meter custom\" \
			align='center'></span>");
		
		var v=testParam;
	 	if (v>100){
	 		throw 404;
	 	}
	 	v*=maxQ;
		$(".custom").animate({width:v.toString()+"%"});
	// if (test == "time"){
		// $("#testCounter").hide();
		// $("#timeCounter").show();
	// }
}

