
function hanleNextQuestion(t,test){
	// window.sessionStorage.clear();
	var tType = window.sessionStorage.getItem("testType");
	if (tType == null){
		tType = test;
		window.sessionStorage.setItem("testType",tType);
	}
	if(tType == "test"){

		var qNumber = window.sessionStorage.getItem("numberQuestion");
		if (qNumber == null){
			window.sessionStorage.setItem("numberQuestion","1");
			qNumber = 0;
		} 
		else {
			n = parseInt(qNumber) + 1;
			if (n >10){
				qNumber=10;
				window.sessionStorage.clear();
				window.onbeforeunload=null;
				get_result(t);
			}
			 else {
				window.sessionStorage.setItem("numberQuestion", n.toString());
			}
		}
		$("#testCounter").show();
		$("#testCounter").append("<span style=\"width: "+(parseInt(qNumber))*10+"%;\" class=\"meter custom\"></span>");
		var v=parseInt(window.sessionStorage.getItem("numberQuestion"));
	 	if (v>99){
	 		throw 404;
	 	}
	 	v*=10;
		$(".custom").animate({width:v.toString()+"%"});
	} else if(tType == "time"){

	}
	window.onbeforeunload=goodbye;


}
function goodbye(e) {
    if(!e) e = window.event;
    //e.cancelBubble is supported by IE - this will kill the bubbling process.
    e.cancelBubble = true;
    e.returnValue = 'You sure you want to leave?'; //This is displayed on the dialog
    //e.stopPropagation works in Firefox.
    if (e.stopPropagation) {
        e.stopPropagation();
        e.preventDefault();
    }
    window.sessionStorage.clear();
}