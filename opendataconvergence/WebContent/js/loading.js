var xmlhttp;
function loadDataset(dept)
{	
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



function loadField(dataset_name)
{
xmlhttp=GetXmlHttpObject();
if (xmlhttp==null)
  {
  alert ("Your browser does not support XMLHTTP!");
  return;
  }
else{
var url="db_getField.jsp";
url=url+"?dataset="+dataset_name;
//alert(url);
xmlhttp.onreadystatechange=stateChangedFields;
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
		i=document.getElementById("dataset").selectedIndex;
		var dataset=document.getElementById("dataset").options[i].value;
		i=document.getElementById("dataset_fields").selectedIndex;
		var field=document.getElementById("dataset_fields").options[i].value;
		var text=document.getElementById("query");
		var url="http://localhost:8095/opendataconvergence/api.jsp";
		document.getElementById("department").value=dept;
		url=url+"?country=India&department="+dept+"&dataset="+dataset+"&fields="+field;
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