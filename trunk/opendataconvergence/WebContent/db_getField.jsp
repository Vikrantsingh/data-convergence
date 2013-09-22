<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="rdbms.*,java.util.*" %>
<%
	String dataset=request.getParameter("dataset");
	ArrayList<Integer> id=LocationIndexAction.getDataSetKey(dataset);
	ArrayList<String> str=null;
	Set<String> fields=new HashSet<String>();
	for(int i : id){
	//System.out.println(id.get(i));
	str=LocationIndexAction.getSchema(i);
	for(String j : str){
		System.out.println(j);
		fields.add(j);
	}
}
System.out.println(fields);
	%>
<select id="dataset_fields" name="dataset_fields" >
<option value="">Select Fields Required</option>
<% for(String x : fields){ %>
	<option value=<%=x %>><%=x %></option>
	<%} %>
</select>
</body>
</html>