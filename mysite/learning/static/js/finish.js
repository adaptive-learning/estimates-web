function get_result() {
	var Formurl = $("#assigForm").attr("action");
	window.location.href = "time/finish";
};
//TODO: send escaping from server
var escape = [
	"water",
	"angle",
	"line" ,
	"obj"  ,
	'sqrt',
	'objsVol',
];

function createName(param,  question, answer, rightAnswer, type){
	switch(type){
		default:
			return answer + "("+ rightAnswer +")";
	}
}

function scatterPlot(data,best,fastest,test){
	dat = JSON.parse(data);
	var series=[];
	for (var e=0; e < dat.length;e++){
		var d = dat[e];
		if (escape.indexOf(d.type) != -1){
			var name = createName(d.params, d.q, d.a, d.right, d.type);
		} else {
			if (d.p1 == null){
				d.p1 = "";
			}
			if (d.p2 == null){
				d.p2 = "";
			}
			var name = deciderType(d.type,"False",d.q,d.p1,d.p2,d.a,d.right);
		}
		
		if (best.indexOf(e) != -1){
			series.push({name:name,marker:{symbol:"circle"}, color: 'rgba(255, 10, 10, .9)',
						data:[[dat[e].time,(1-dat[e].label)*100]]});
		}else if (fastest.indexOf(e) != -1 ){
			series.push({name:name,marker:{symbol:"circle"}, color: 'rgba(0, 13, 119, .9)',
						data:[[dat[e].time,(1-dat[e].label)*100]]});
		} else {
			series.push({name:name,marker:{symbol:"circle"}, color: 'rgba(51, 51, 51, .9)',
						data:[[dat[e].time,(1-dat[e].label)*100]]});
		}
		

	}

    $('#scatterPlot').highcharts({
        chart: {
            type: 'scatter',
            zoomType: 'xy'
        },
        title: {
            text: 'Vaše odpovede'
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
            ceiling:100,
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
        series:series,
        legend:{
        	
        },
    });
}