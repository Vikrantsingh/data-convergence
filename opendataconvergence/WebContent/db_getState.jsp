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
	String country=request.getParameter("country");
	String[] country_name=country.split(",");
	ArrayList<String> state_name=new ArrayList<String>();
	System.out.println(country_name.length);
	for(int i=0;i<country_name.length;i++){
		String stateName=LocationIndexAction.getState(country_name[i]);
		state_name.add(stateName);
	
	}
	System.out.println("statename:"+state_name);
	
	%>
<select onchange="loadDistrict(this.value)" name="states" id="states" multiple>
<option value="">Select Country</option>
<% for(String x : state_name){
		System.out.println(x);
	 %>
	<option value=<%=x %>><%=x %></option>
	<%} %>
</select>
</body>
</html>