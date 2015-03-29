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
    if (x!="all" && x!="---" && x!="not"){
		$(span).empty();

    	for (i in j){
    		if (j[i].p1 == x){
				$("<input/>")
    			.attr("type","checkbox")
    			.attr("name",x)
    			.attr("value",j[i].p2)
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

    	newChangedSelects(Gparent,actual,j);

    } else {
    	$(span).empty();
    	$('#all'+x).remove();
    	if (x == "all" || x == "not"){
    		for (var i=Gparent.children.length-1; i>0 ; i--){
    			Gparent.children[i].remove();
    		}
    	}
    	if (x == "---") {
    		if(Gparent.children[Gparent.children.length-2].isEqualNode(actual.parentNode)){
	    		alert("her");
    			Gparent.children[Gparent.children.length-1].remove();
			} else {
				actual.parentNode.remove();
			} 
    		newChangedSelects(Gparent,actual,j);
    	}
    }
}
function createSelect(j, span){
	return $("<select/>")
	.addClass("small-2")
	.on("change",function(){
		changeOption(JSON.stringify(j),this,span);
	})
	.attr("autocomplete","off");
}


function getAllOptionValues(children){
	var values = [];
	for (var i in children){
		var d = children[i].children;
		for (var k in d){
			if (d[k].tagName == "SELECT"){
				values.push(d[k].value);
			}
		}
	}
	return values;
}

function newSelect(j,actual){
		parent = actual.parentNode;
		actual.remove();
		var div = $("<div/>")
		.appendTo(parent);

		
		var values = getAllOptionValues(parent.children);
		var span = $("<span/>");


		select = createSelect(j,span);
		select.appendTo(div);
		
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

function newChangedSelects(Gparent,noChange,j){
	for (var i in Gparent.children){
		if (!Gparent.children[i].isEqualNode(noChange.parentNode)
		&& Gparent.children[i].tagName == "DIV"){
			var parent = Gparent.children[i];

			var prevValue = parent.firstElementChild.value;
			var prevName = parent.firstElementChild.name;

			var span =  parent.lastElementChild;
			//original select deleted
			parent.firstElementChild.remove();
			var select = createSelect(j,span);
			if (prevName != ""){
				select.attr("name",prevName);
			}
			select.prependTo(parent);
			
			jsonList = [];
			for (var k=0;k<j.length;k++){
				jsonList.push(j[k].p1);	
			}
			jsonList = eliminateDuplicates(jsonList) ;
			
			var values = getAllOptionValues(Gparent.children);
			var def = true;
			for (var k=0;k<jsonList.length;k++){
				if (values.indexOf(jsonList[k])<0){
					if (jsonList[k] == prevValue){
						createOptions(jsonList[k],select,true);
						def = false;
					} else{
						createOptions(jsonList[k],select,false);
					}
				}
			}

			if (Gparent.firstElementChild.isEqualNode(parent)){
				createOptions("all",select,false);
				createOptions("not",select,false);
			} else {
				createOptions("---",select,def);	
			}
			if (def && span != undefined){
				span.empty();
			}	
		}
	}
}
