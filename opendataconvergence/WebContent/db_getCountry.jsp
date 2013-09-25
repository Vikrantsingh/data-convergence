<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="rdbms.*,java.util.ArrayList" %>
<%
	String dept=request.getParameter("department");
	String[]department_name=dept.split(",");
	ArrayList<String> country_name=new ArrayList<String>();
	for(int i=0;i<department_name.length;i++){
	String countryName=LocationIndexAction.getCountry(department_name[i]);
	System.out.println(countryName);
	country_name.add(countryName);
	
	}
	System.out.println("countryname:"+country_name);
	
	%>
<select onchange="loadState(this.value)" name="countries" id="countries" multiple>
<option value="">Select Country</option>
<% for(String x : country_name){ 
	 %>
	<option value=<%=x %>><%=x %></option>
	<%} %>
</select>
</body>
</html>