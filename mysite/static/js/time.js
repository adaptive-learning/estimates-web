var c=0;
var minutes= 0;
var t;
var timer_is_on=1;

function timedCount(){
	if(timer_is_on){
		document.getElementById('txt').value = 'minutes:' + minutes + ' seconds: ' + c;
			c = c+1;
		if (c%60 == 0){
			minutes += 1;
			c = 0;
		}
		t=setTimeout("timedCount()",1000);
	}
}
timedCount();