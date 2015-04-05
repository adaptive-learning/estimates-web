function get_result() {
	var Formurl = $("#assigForm").attr("action");
	window.location.href = "time/finish";
};


function scatterPlot(data,best){
	dat = JSON.parse(data);
	
	var series=[];
	m = [];
	mF = 0;
	for (var e=1;e<dat.length;e++){
		var cur = (1-dat[e].label)*100;
		var maxL = (1-dat[mF].label)*100;

		if(cur > maxL){
			mF = e;
		} else if(cur == maxL ){
			if (dat[mF].time == dat[e].time){
				m.push(e);
			} else if (dat[mF].time > dat[e].time){
				mF = e;
			}
		}
	}
	for (var e=0; e < dat.length;e++){

		var d = dat[e];
		if (d.type in type_pictures_question){
			var name = d.a;
		} else {
			var name = deciderType(d.type,d.q,d.p1,d.p2,d.a);
		}
		if (best.indexOf(e) != -1){
			series.push({name:name, color: 'rgba(20, 255, 20, .9)',data:[[dat[e].time,(1-dat[e].label)*100]]});
		}else if (m.indexOf(e) != -1 || e==mF){
							
			series.push({name:name, color: 'rgba(255, 10, 10, .9)',data:[[dat[e].time,(1-dat[e].label)*100]]});
		} else {
			series.push({name:name, color: 'rgba(51, 51, 51, .9)',data:[[dat[e].time,(1-dat[e].label)*100]]});
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
}