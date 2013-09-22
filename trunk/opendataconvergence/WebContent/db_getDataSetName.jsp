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
	ArrayList<String> datasetName=LocationIndexAction.getDatasetName(dept);
	
	%>
<select onchange="loadField(this.value)" name="dataset" id="dataset">
<option value="">Select DataSets</option>
<% for(String x : datasetName){ 
	%>
	<option value=<%=x %>><%=x %></option>
	<%} %>
</select>
</body>
</html>