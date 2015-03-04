var c=0;
var minutes= 0;
var t;
var timer_is_on=1;
function time(){
	if(timer_is_on){
		var timer = $("#timer");
		timer.empty();

		timer.text('minutes:' + minutes + ' seconds: ' + c);

			c = c+1;
		if (c%60 == 0){
			minutes += 1;
			c = 0;
		}
		t=setTimeout("time()",1000);
	}
}
time();
