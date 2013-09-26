<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<select onchange="loadField()" name="dataset" id="dataset" multiple required>
<option value="">Select the datasets</option>
<% for(String x : dataset_name){ 
	String[] str_array = x.split(",");
	int id = Integer.parseInt(str_array[0]); 
	String stringb = str_array[2]+"."+str_array[1];
	%>
	<option value=<%=id %>><%=stringb %></option>
	<%} %>
</select>
</body>
</html>