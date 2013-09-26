var xmlhttp, xmlhttp1;
var selectedDataset;
var selectedField;
var selectedDepartment;
var selectedCountries;
var selectedStates;
var selectedDistrict;
var combinationOfAll;
//var selectedFormat;
/**
 * ***************** dataset retrival begins
 * 
 * @param dept
 * @returns {Number}
 */
function loadDataset(dept) {

	if (dept == "") {
		alert("Please select department you want to query on!!..");
		return 0;
	}
	var selectedDept = new Array();
	var selObj = document.getElementById('department');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedDept[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedDepartment = selectedDept;
	xmlhttp = GetXmlHttpObject();
	xmlhttp1 = GetXmlHttpObject();
	if (xmlhttp == null || xmlhttp1 == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var url = "db_getDataSetName.jsp";
		var url1 = "db_getCountry.jsp";
		url = url + "?department=" + selectedDept;
		url1 = url1 + "?department=" + selectedDept;
		// alert(url);
		// for dataset change request
		xmlhttp.onreadystatechange = stateChangedDataSet;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
		// for country change request
		xmlhttp1.onreadystatechange = stateChangedCountry;
		xmlhttp1.open("GET", url1, true);
		xmlhttp1.send(null);
	}
}
// for dataset change select when department changes
function stateChangedDataSet() {
	if (xmlhttp.readyState == 4) {
		document.getElementById("dataset_name").innerHTML = xmlhttp.responseText;
	} else {
		document.getElementById("dataset_name").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

// for changing the country select when ever department changes
function stateChangedCountry() {
	if (xmlhttp1.readyState == 4) {
		document.getElementById("country").innerHTML = xmlhttp1.responseText;
	} else {
		document.getElementById("country").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

/** **************** Dataset Retrival ends ************************* */

/** ******************* State retrival starts here ************************** */

function loadState(country) {
	if (country == "") {
		alert("Please select country you want to query on!!..");
		return 0;
	}
	var selectedCountry = new Array();
	var selObj = document.getElementById('countries');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedCountry[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedCountries = selectedCountry;
	// alert(selectedCountry);
	xmlhttp = GetXmlHttpObject();
	xmlhttp1 = GetXmlHttpObject();
	if (xmlhttp == null || xmlhttp1 == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var url = "db_getState.jsp";
		url = url + "?country=" + selectedCountry;
		// url1=url1+"?department="+selectedDept;
		// alert(url);
		var url1 = "db_getDatasetCountry.jsp";
		url1 = url1 + "?country=" + selectedCountry;
		// alert(url1);
		// for state change request
		xmlhttp1.onreadystatechange = stateChangedState;
		xmlhttp1.open("GET", url, true);
		xmlhttp1.send(null);
		// for country change request
		xmlhttp.onreadystatechange = stateChangedDataSet;
		xmlhttp.open("GET", url1, true);
		xmlhttp.send(null);
	}
}

function stateChangedState() {
	if (xmlhttp1.readyState == 4) {
		document.getElementById("state").innerHTML = xmlhttp1.responseText;
	} else {
		document.getElementById("state").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

/** *********** loading states based on country is done *************** */

/** ******************* District retrival starts here ************************** */

function loadDistrict(state) {
	if (state == "") {
		alert("Please select country you want to query on!!..");
		return 0;
	}
	var selectedState = new Array();
	var selObj = document.getElementById('states');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedState[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedStates = selectedState;
	//alert(selectedState);
	xmlhttp = GetXmlHttpObject();
	xmlhttp1 = GetXmlHttpObject();
	if (xmlhttp == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var url = "db_getDistrict.jsp";
		url = url + "?country=" + selectedCountries + "&state=" + selectedState;
		//alert(url);
		// url1=url1+"?department="+selectedDept;
		var url1 = "db_getDatasetState.jsp";
		url1 = url1 + "?country=" + selectedCountries + "&state="
				+ selectedState;
		//alert(url1);
		// for state change request
		xmlhttp1.onreadystatechange = stateChangedDistrict;
		xmlhttp1.open("GET", url, true);
		xmlhttp1.send(null);
		// for country change request
		xmlhttp.onreadystatechange = stateChangedDataSet;
		xmlhttp.open("GET", url1, true);
		xmlhttp.send(null);
	}
}
function stateChangedDistrict() {
	if (xmlhttp1.readyState == 4) {
		document.getElementById("district").innerHTML = xmlhttp1.responseText;
	} else {
		document.getElementById("district").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

/** *********** loading districts based on states is done *************** */

function combination() {

	combinationOfAll = "?country=" + selectedCountries + "&state="
			+ selectedStates + "&district=" + selectedDistrict;
	// alert(combinationOfAll);
}

function loadField() {
	var selectedDatasets = new Array();
	var selObj = document.getElementById('dataset');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedDatasets[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedDataset = selectedDatasets;
	xmlhttp = GetXmlHttpObject();
	if (xmlhttp == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var data = selectedDatasets;

		var url = "db_getField.jsp";
		url = url + "?dataset_id=" + data;
		// alert(url);
		xmlhttp.onreadystatechange = stateChangedFields;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
	}
}

function loadFilter() {

	xmlhttp = GetXmlHttpObject();
	if (xmlhttp == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var data = selectedFields;
		var url = "db_getFilter.jsp";
		url = url + "?dataset_fields=" + data;
		// alert(url);
		xmlhttp.onreadystatechange = stateChangedFilters;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
	}

}

function GetXmlHttpObject() {
	if (window.XMLHttpRequest) {
		// code for IE7+, Firefox, Chrome, Opera, Safari
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject) {
		// code for IE6, IE5
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

function stateChangedFields() {
	if (xmlhttp.readyState == 4) {
		document.getElementById("dataset_field").innerHTML = xmlhttp.responseText;
	} else {
		document.getElementById("dataset_field").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

function stateChangedFilters() {
	if (xmlhttp.readyState == 4) {
		document.getElementById("filter1").innerHTML = xmlhttp.responseText;
	} else {
		document.getElementById("filter1").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}

function show() {
	// alert("hi");
	xmlhttp = GetXmlHttpObject();
	if (xmlhttp == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var i = document.getElementById("department").selectedIndex;
		var dept = document.getElementById("department").options[i].value;
		if (dept == "") {
			alert("Please select a department to query on!!");
			return 0;
		}
		i = document.getElementById("dataset").selectedIndex;
		var dataset = document.getElementById("dataset").options[i].value;
		if (dataset == "") {
			alert("Please select a dataset to query on!!");
			return 0;
		}
		i = document.getElementById("dataset_fields").selectedIndex;
		var field = document.getElementById("dataset_fields").options[i].value;
		if (field == "") {
			alert("Please select a department to query on!!");
			return 0;
		}
		var start = document.getElementById("start").value;
		var limit = document.getElementById("limit").value;
		var text = document.getElementById("query");
		var url = "http://localhost:8080/dataconvergence/api.jsp";
		document.getElementById("department").value = dept;
		url = url + "?datasets=" + selectedDataset + "&fields=" + selectedField
				+ "&start=" + start + "&limit=" + limit+"&format="+document.getElementById("format").value;
		// alert(url);
		text.value = url;
		var url1 = "getApi.jsp";
		url1 = url1 + "?department=" + selectedDepartment + "&country="
				+ selectedCountries + "&state=" + selectedStates + "&district="
				+ selectedDistrict + "&dataset=" + selectedDataset + "&field="
				+ selectedField;
		alert(url1);
		xmlhttp.onreadystatechange = stateChangedQuery;
		xmlhttp.open("GET", url1, true);
		xmlhttp.send(null);
	}
}

function stateChangedQuery() {
	if (xmlhttp.readyState == 4) {
		document.getElementById("query_generate").innerHTML = xmlhttp.responseText;
	} else {
		document.getElementById("query_generate").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}
/**
 * ************** storing the fields selected in global variable
 * ******************
 */
function storeFields() {
	var selectedFields = new Array();
	var selObj = document.getElementById('dataset_fields');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedFields[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedField = selectedFields;
	// alert(selectedField);
}

/**
 * ************** end of storing the fields selected in global variable
 * ******************
 */

/**
 * ****************** Dataset retrival based on country,state and filter
 * loadDatasetFilter() **************************
 */
function loadDatasetFilter() {
	var selectedDistricts = new Array();
	var selObj = document.getElementById('districts');
	var i;
	var count = 0;
	for (i = 0; i < selObj.options.length; i++) {
		if (selObj.options[i].selected) {
			selectedDistricts[count] = selObj.options[i].value;
			count++;
		}
	}
	selectedDistrict = selectedDistricts;
	// alert(selectedDistricts);
	xmlhttp = GetXmlHttpObject();
	// xmlhttp1 = GetXmlHttpObject();
	if (xmlhttp == null) {
		alert("Your browser does not support XMLHTTP!");
		return;
	} else {
		var url = "db_getDataSetFilter.jsp";
		// var url1 = "db_getCountry.jsp";
		url = url + "?country=" + selectedCountries + "&state="
				+ selectedStates + "&district=" + selectedDistrict;
		// url1 = url1 + "?department=" + selectedDept;
		// alert(url);
		// for dataset change request
		xmlhttp.onreadystatechange = stateChangedDataSet;
		xmlhttp.open("GET", url, true);
		xmlhttp.send(null);
	}
}
// for dataset change select when department changes
function stateChangedDataSet() {
	if (xmlhttp.readyState == 4) {
		document.getElementById("dataset_name").innerHTML = xmlhttp.responseText;
	} else {
		document.getElementById("dataset_name").innerHTML = "processing<img src='Images/ajax-loade.gif' />";
	}
}
/** **************** Dataset Retrival ends ************************* */

