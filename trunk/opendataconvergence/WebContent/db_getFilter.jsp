<%@page import="java.lang.reflect.Array"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ page import="java.util.*,rdbms.*" %>
<body>
 <%
String dataset=request.getParameter("dataset_fields");
String[] dataset_ids=dataset.split(",");
ArrayList<String> str=null;
ArrayList<String> datasetNameId=new ArrayList<String>();
System.out.println(dataset_ids.length);
for(int id=0;id< dataset_ids.length;id++){
	str=LocationIndexAction.getSchemaId(Integer.parseInt(dataset_ids[id]));
	String dataset_name=LocationIndexAction.getDatasetNameId(Integer.parseInt(dataset_ids[id]));
	System.out.println(str);
for(int j=0; j<str.size();j++){
	String[] splitting=str.get(j).split(",");
	String data=splitting[0]+","+dataset_name+"."+splitting[1];
	datasetNameId.add(data);
	}
}
System.out.println("in filters"+datasetNameId);
%>
<select id="filter1" name="filter1"  >
<option value="">Select Column name for filtering</option>
<% for(String x : datasetNameId){ 
	String[] array_str=x.split(",");
	int i=Integer.parseInt(array_str[0]);
	String name=array_str[1];
	%>
<option value=<%=i %>><%=name %></option>
<%} %>
</select>
</body>
</html>