var testP;
window.onload=function(){
	$("#input").focus();
};
function handleNextQuestion(t,test,testParam){

	if(test == "set"){
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
	}
}

