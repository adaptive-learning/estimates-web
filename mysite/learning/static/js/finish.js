function get_result(data) {
	$("#pie-countdown").hide();
	$("#myCanvas").hide();
    $.ajaxSetup({
	    beforeSend: function(xhr, settings) {
	        if (!csrfSafeMethod(settings.type) && !this.crossDomain) {
	            xhr.setRequestHeader("X-CSRFToken", csrftoken);
	        }
		}
	});
    $.ajax({
    	url : "/learning/finish", // the endpoint
        type : "POST", // http method
        data : { data:data}, // data sent with the post request
		
        // handle a successful response
        success : function(response) {
        	var r = response.split("//");
           	$("#label").text("");
        	$("#label").append("vas priemerny odhad je: "+((1-parseFloat(r[0]).toFixed(2))*100).toString()+" %\n");
            if (r.length == 3){
 				$("#label").append("vase skóre v danej oblasti je: "+(r[1]*100).toString()+" %");
	         	$("#scatterPlot").show();
         		scatterPlot(r[2]);
       		} 
         	$("#userPart").remove();
         	$("#userControl").remove();

        },
        // handle a non-successful response
        error : function(xhr,errmsg,err) {
            $('#results').html("<div class='alert-box alert radius' data-alert>Oops! We have encountered an error: "+errmsg+
                " <a href='#' class='close'>&times;</a></div>"); // add the error to the dom
            alert(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
        }
    });
};



function scatterPlot(data){
	dat = JSON.parse(data);
	var series=[];
	m = [];
	mF = 0;
	for (var e=1;e<dat.length;e++){
		var cur = (1-dat[e].fields.label)*100;
		var maxL = (1-dat[mF].fields.label)*100;

		if(cur > maxL){
			mF = e;
		} else if(cur == maxL ){
			if (dat[mF].fields.time == dat[e].fields.time){
				m.push(e);
			} else if (dat[mF].fields.time > dat[e].fields.time){
				mF = e;
			}
		}
	}
	alert(m.indexOf(2));
	for (var e=0; e < dat.length;e++){
		if (m.indexOf(e) != -1 || e==mF){
			series.push({name:dat[e].fields.concept,color: 'rgba(255, 10, 10, .9)',data:[[dat[e].fields.time,(1-dat[e].fields.label)*100]]});
		} else {
			series.push({name:dat[e].fields.concept,color: 'rgba(51, 51, 51, .9)',data:[[dat[e].fields.time,(1-dat[e].fields.label)*100]]});
		}
	}
$(function () {
    $('#scatterPlot').highcharts({
        chart: {
            type: 'scatter',
            zoomType: 'xy'
        },
        title: {
            // text: 'Height Versus Weight of 507 Individuals by Gender'
        },
        subtitle: {
            // text: 'Source: Heinz  2003'
        },
        xAxis: {
            title: {
                text: 'čas (s)'
            },

        },
        yAxis: {
            title: {
                text: 'Správnosť (%)'
            },

        },
        
        plotOptions: {
            scatter: {
                marker: {
                    radius: 10,
                    states: {
                        hover: {
                            enabled: true,
                            lineColor: 'rgb(100,100,100)'
                        }
                    }
                },
                states: {
                    hover: {
                        marker: {
                            enabled: false
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x} s, {point.y} %'
                }
            }
        },
        series:series
    });
});
}