function createOptions(ele,parent,def){
	$('<option/>')
	.attr({ 'value': ele }).
	text(decider(ele))
	.attr("selected",def)
	.appendTo((parent));
}

function changeOption(list,actual,span){
	j = JSON.parse(list);
    var x = actual.value;
    var Gparent = actual.parentNode.parentNode;
    if (x!="all" && x!="---"){
		$(span).empty();

    	for (i in j){
    		if (j[i].p1 == x){
				$("<input/>")
    			.attr("type","checkbox")
    			.attr("id","check"+j[i].p1+i)
    			.appendTo(span)
    			.change(function(){
    				if (this.checked == false){
    					$("#all"+j[i].p1+i).checked = false;
    				}
				});

				var newlabel = document.createElement("Label");
				newlabel.setAttribute("for","check"+j[i].p1+i);
				newlabel.innerHTML = decider(j[i].p2);
				$(span).append(newlabel);
    		}
    	}
    		$('<a/>', {
        	text: "Všetko", //set text 1 to 10
       	 	id: 'all'+x,
			class : "small button",
        	click: function () {
        	var collection = $(span).children();
    			for (var x=0; x<collection.length; x++) {
    				if (collection[x].tagName = "CHECKBOX"){
    					collection[x].checked = true;
    				}
    			}
   			}}).appendTo(span);
    	
    	
		if(Gparent.lastElementChild.isEqualNode(actual.parentNode)){
	    	if (Gparent.children.length > 1 
    			&& Gparent.children[Gparent.children.length-1].tagName == "A"){
    			Gparent.children[Gparent.children.length-1].remove();
    		}
	    	$('<a/>', {
	        text: "Nový", //set text 1 to 10
	        id:"new",
	        class : "small button",
	        click: function(){
	        	newSelect(j,this);
	    	}}).appendTo(Gparent);
    	}
    } else {
    	$(span).empty();
    	$('#all'+x).remove();
    	if (x == "all"){
    		for (var i=1; i< Gparent.children.length; i++){
    			Gparent.children[i].remove();
    		}
    	}
    	if (x == "---" && Gparent.children[Gparent.children.length-2].isEqualNode(actual.parentNode)){
    		Gparent.children[Gparent.children.length-1].remove();
    	}
    }
}
function newSelect(j,actual){
		parent = actual.parentNode;
		actual.remove();
		var div = $("<div/>")
		.appendTo(parent);

		
		var chs = parent.children;

		var values = [];
		for (var i in chs){
			var d = chs[i].children;
			for (var k in d){
				if (d[k].tagName == "SELECT"){
					values.push(d[k].value);
				}
			}
		}
		var span = $("<span/>");

		var select = $("<select/>")
		.addClass("small-2")
		.on("change",function(){
			changeOption(JSON.stringify(j),this,span);
		})
		.attr("autocomplete","off")
		.appendTo(div);
		
		span.appendTo(div);
		
		jsonList = [];
		for (var i=0;i<j.length;i++){
			jsonList.push(j[i].p1);	
		}
		jsonList = eliminateDuplicates(jsonList) ;

		for (var i=0;i<jsonList.length;i++){
			if (values.indexOf(jsonList[i])<0){
				createOptions(jsonList[i],select);
			}
		}
		createOptions("---",select,true);
		return select;
}


function eliminateDuplicates(arr) {
  var i,
      len=arr.length,
      out=[],
      obj={};

  for (i=0;i<len;i++) {
    obj[arr[i]]=0;
  }
  for (i in obj) {
    out.push(i);
  }
  return out;
}
