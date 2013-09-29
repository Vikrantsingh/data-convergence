<%@page import="java.net.*,java.io.*,example.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address Locator</title>
</head>
<body>
<h1>Address Locator</h1>
	<form action="index.jsp">
		Enter Pincode <input type="text" name="pincode" />
	</form>
	<br/>
	<%
	if(request.getParameter("pincode")!=null)
	out.println( "<b>Result:"+JsonReader.getloc(request.getParameter("pincode"))+"</b>");
	

	%>
</body>
</html>