<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="rdbms.*,java.util.*" %>

<%
	String dataset=request.getParameter("dataset_id");
	String[] dataset_ids=dataset.split(",");
	ArrayList<String> str=null;
	ArrayList<String> datasetNameId=new ArrayList<String>();
	System.out.println(dataset_ids.length);
	for(int id=0;id< dataset_ids.length;id++){
		str=LocationIndexAction.getSchemaId(Integer.parseInt(dataset_ids[id]));
		String dataset_name=LocationIndexAction.getDatasetNameId(Integer.parseInt(dataset_ids[id]));
		System.out.println("inside"+dataset_ids[id]);
	for(int j=0; j<str.size();j++){
		String[] splitting=str.get(j).split(",");
		String data=splitting[0]+","+dataset_name+"."+splitting[1];
		datasetNameId.add(data);
		}
	}
System.out.println(datasetNameId);
	%>
	
<select onchange="storeFields()" name="dataset_fields" id="dataset_fields" multiple="multiple" required>
<option value="">Select Fields Required</option>
<% for(String x : datasetNameId){ 
		String[] array_str=x.split(",");
		int i=Integer.parseInt(array_str[0]);
		String name=array_str[1];
		%>
	<option value=<%=i %>><%=name %></option>
	<%} %>
</select>
