<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/loading.js"></script>
</head>
<body>
<%@page import="rdbms.*,java.util.ArrayList" %>
<%
	String dept=request.getParameter("department");
	System.out.println("Selected department is:"+dept);
	String[]department_name=dept.split(",");
	ArrayList<String> dataset_name=new ArrayList<String>();
	for(int i=0;i<department_name.length;i++){
	ArrayList<String> datasetName=LocationIndexAction.getDatasetName(department_name[i]);
	for(String x : datasetName){
		dataset_name.add(x);
	}
	}
	System.out.println("datasetname:"+dataset_name);
	
	%>
<select onchange="storeValuesDatasets()" name="dataset" id="dataset" multiple>
<option value="">Select the datasets</option>
<% for(String x : dataset_name){ 
	String[] str_array = x.split(",");
	int id = Integer.parseInt(str_array[0]); 
	String stringb = str_array[2]+"."+str_array[1];
	%>
	<option value=<%=id %>><%=stringb %></option>
	<%} %>
</select>
<input type="button" id="dataset_selected" name="dataset_selected" value="go" onclick="loadField()"/>
</body>
</html>