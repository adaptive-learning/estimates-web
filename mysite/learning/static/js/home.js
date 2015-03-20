include('variables.js');

function createButton(tag,name,onclick,parent,last){
	var btn = document.createElement(tag);
	var t = document.createTextNode(name);
	var div = $("<div/>", { class: "large-2 columns"});

	btn.appendChild(t);
	// btn.addClass("button");
	btn.setAttribute('class', 'secondary radius large button');
	if(onclick){	
		if (btn.addEventListener) 
			btn.addEventListener('click',onclick,false); //everything else    
		else if (choice.attachEvent)
	    	btn.attachEvent('onclick',onclick); //IE only
	}
	parent.appendChild(btn);
	if(!last)
		parent.appendChild(document.createTextNode(' '));
}

function createHrefButton(tag,name,href,parent,last){
	var btn = document.createElement(tag);
	var t = document.createTextNode(name);
	btn.appendChild(t);
	btn.setAttribute('class', 'secondary radius large button');
	
	btn.href = href;
	parent.appendChild(btn);
	if(!last)
		parent.appendChild(document.createTextNode(' '));
}

function home(a){
	var choice = document.getElementById('choice');
	while(choice.firstChild){
		choice.removeChild(choice.firstChild);
	}
	if (a == 'home'){

		for (v in nameTypes[a]){
			var e = nameTypes[a][v];
			createButton('a',nameReal[nameTypes[a][v]][0],function(j) {return function() {home(j);};}(e),choice,false);
		}
		createHrefButton('a','Všetko','/learning/all-all/test',choice,true);
		$('#back').hide();
		$("#labelAbout").show();
		headerTitle = "Odhadni to";
	} else {
		for (var v in nameTypes[a]){
			var h = "/learning/"+nameUrls[a]+'/'+nameTypes[a][v];
			createButton('a',typeReal[nameTypes[a][v]],function(j) {return function() {chooseType(j);};}(h),choice,false);
		}
		createHrefButton('a','Všetko','/learning/'+a+'/'+a+'-all/test',choice,true);
		$('#back').show();
		$("#labelAbout").hide();
		headerTitle = nameReal[a][1];
	}
	document.getElementById("header").innerHTML = headerTitle;
}
function chooseType(href){
	var choice = document.getElementById('choice');
	while(choice.firstChild){
		choice.removeChild(choice.firstChild);
	}
	createHrefButton('a',"test",href+"/set",choice,false);
	createHrefButton('a',"time",href+"/time",choice,false);
}

function createMenu(){
        var cList = $('#myMenu');

        eh = nameTypes['home'];
        for (var i in eh){
            value = nameTypes['home'][i];
            var li = $('<li/>')
         		.addClass('has-dropdown')
                .appendTo(cList);
            var aaa = $('<a/>')
                .attr("href", "/learning/"+nameUrls[value]+"/"+value+'-all/test')
                .text(nameReal[value][0])
                .appendTo(li);
            var ul = $('<ul/>')
                .addClass("dropdown")
                .appendTo(li);
            for (var e in nameTypes[value]){
                type = nameTypes[value][e];
                var inLi = $('<li/>')
                    .addClass('has-dropdown')
                    .appendTo(ul);
                var a = $('<a/>')
                    .text(typeReal[type])
                    .appendTo(inLi);
            	var InUl = $('<ul/>')
                	.addClass("dropdown")
                	.appendTo(inLi);
            	var li2 = $("<li/>")
            		.appendTo(InUl);
        		var li21 = $("<li/>")
        			.appendTo(InUl);
                var a2 = $('<a/>')
                    .attr("href","/learning/"+nameUrls[value]+"/"+type+"/set")
                    .text("test")
                    .appendTo(li2);
                var a21 = $('<a/>')
                	.attr("href","/learning/"+nameUrls[value]+"/"+type+"/time")
                    .text("na čas")
                    .appendTo(li21);
            }
        }
        alert("ok");
}
