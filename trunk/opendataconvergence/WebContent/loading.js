var xmlhttp;
var selectedDatasets = new Array();
var selectedFields = new Array();
function loadDataset(dept)
{	
	if(dept==""){
		alert("Please select department you want to query on!!..");
		return 0;
}
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  }
else{
var url="db_getDataSetName.jsp";
url=url+"?department="+dept;
//alert(url);
xmlhttp.onreadystatechange=stateChangedDataSet;
xmlhttp.open("GET",url,true);
xmlhttp.send(null);
}
}



function loadField()
{
	/*var txtSelectedValuesObj = "";
	  var selectedArray = new Array();
	  var selObj = document.getElementById('dataset_fields');
	  var i;
	  var count = 0;
	  for (i=0; i<selObj.options.length; i++) {
	    if (selObj.options[i].selected) {
	      selectedArray[count] = selObj.options[i].value;
	      count++;
	    }
	  }
	  txtSelectedValuesObj = selectedArray;*/
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  }
else{
var data=selectedDatasets;

var url="db_getField.jsp";
url=url+"?dataset_id="+data;
//alert(url);
xmlhttp.onreadystatechange=stateChangedFields;
xmlhttp.open("GET",url,true);
xmlhttp.send(null);
}
}


function storeValues(){
	
	  var selObj = document.getElementById('dataset_fields');
	  var i;
	  var count = 0;
	  for (i=0; i<selObj.options.length; i++) {
	    if (selObj.options[i].selected) {
	      selectedFields[count] = selObj.options[i].value;
	      count++;
	    }
	  }
	  txtSelectedValuesObj = selectedFields;
	
}

function storeValuesDatasets(){
	
	  
	  var selObj = document.getElementById('dataset');
	  var i;
	  var count = 0;
	  for (i=0; i<selObj.options.length; i++) {
	    if (selObj.options[i].selected) {
	      selectedDatasets[count] = selObj.options[i].value;
	      count++;
	    }
	  }
	
		
}

	  function loadFilter(){
	  xmlhttp=GetXmlHttpObject();
	  if (xmlhttp==null)
	    {
	    alert ("Your browser does not support XMLHTTP!");
	    return;
	    }
	  else{
		  var data=selectedFields;
		  alert(data);
	  var url="db_getFilter.jsp";
	  url=url+"?dataset_fields="+data;
	  //alert(url);
	  xmlhttp.onreadystatechange=stateChangedFilters;
	  xmlhttp.open("GET",url,true);
	  xmlhttp.send(null);
	  }
	  
}



function GetXmlHttpObject()
{
if (window.XMLHttpRequest)
  {
  // code for IE7+, Firefox, Chrome, Opera, Safari
  return new XMLHttpRequest();
  }
if (window.ActiveXObject)
  {
  // code for IE6, IE5
  return new ActiveXObject("Microsoft.XMLHTTP");
  }
return null;
}
function stateChangedDataSet()
{
if (xmlhttp.readyState==4)
  {
  document.getElementById("dataset_name").innerHTML=xmlhttp.responseText;
}
else
{
  document.getElementById("dataset_name").innerHTML="processing<img src='Images/ajax-loade.gif' />";
}
}
function stateChangedFields()
{
if (xmlhttp.readyState==4)
  {
  document.getElementById("dataset_field").innerHTML=xmlhttp.responseText;
}
else
{
  document.getElementById("dataset_field").innerHTML="processing<img src='Images/ajax-loade.gif' />";
}
}


function stateChangedFilters()
{
if (xmlhttp.readyState==4)
  {
  document.getElementById("filter1").innerHTML=xmlhttp.responseText;
}
else
{
  document.getElementById("filter1").innerHTML="processing<img src='Images/ajax-loade.gif' />";
}
}

function show(){
	//alert("hi");
	xmlhttp=GetXmlHttpObject();
	if (xmlhttp==null)
	  {
	  alert ("Your browser does not support XMLHTTP!");
	  return;
	  }
	else{
		var i=document.getElementById("department").selectedIndex;
		var dept=document.getElementById("department").options[i].value;
		if(dept==""){
			alert("Please select a department to query on!!");
			return 0;
		}
		i=document.getElementById("dataset").selectedIndex;
		var dataset=document.getElementById("dataset").options[i].value;
		if(dataset==""){
			alert("Please select a dataset to query on!!");
			return 0;
		}
		i=document.getElementById("dataset_fields").selectedIndex;
		var field=document.getElementById("dataset_fields").options[i].value;
		if(field==""){
			alert("Please select a department to query on!!");
			return 0;
		}
		var start=document.getElementById("start").value;
		var limit=document.getElementById("limit").value;
		var text=document.getElementById("query");
		var url="http://localhost:8095/opendataconvergence/api.jsp";
		document.getElementById("department").value=dept;
		url=url+"?dataset="+selectedDatasets+"&fields="+selectedFields+"&start="+start+"&limit="+limit;
		text.value=url;
		var url1="getApi.jsp";
		url1=url1+"?dataset="+dataset+"&department="+dept;
	//alert(url);
	xmlhttp.onreadystatechange=stateChangedQuery;
	xmlhttp.open("GET",url1,true);
	xmlhttp.send(null);
	}
}

function stateChangedQuery()
{
if (xmlhttp.readyState==4)
  {
  document.getElementById("query_generate").innerHTML=xmlhttp.responseText;
}
else
{
  document.getElementById("query_generate").innerHTML="processing<img src='Images/ajax-loade.gif' />";
}
}