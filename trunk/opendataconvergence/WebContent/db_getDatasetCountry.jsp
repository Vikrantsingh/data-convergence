<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="rdbms.*,java.util.ArrayList"%>
<%
	String country = request.getParameter("country");
	String[] country_name = country.split(",");
	ArrayList<String> dataset_name = new ArrayList<String>();
	for (int i = 0; i < country_name.length; i++) {
		ArrayList<String> datasetName = LocationIndexAction
				.getDatasetNameFilter(country_name[i]);
		for (String x : datasetName) {
			dataset_name.add(x);
		}
	}
	System.out.println("datasetname:" + dataset_name);
%>
<select onchange="loadField()" name="dataset" id="dataset"
	multiple="multiple" required>
	<option value="">Select the dataset</option>
	<%
		for (String x : dataset_name) {
			String[] str_array = x.split(",");
			int id = Integer.parseInt(str_array[0]);
			String stringb = str_array[2] + "." + str_array[1];
	%>
	<option value=<%=id%>><%=stringb%></option>
	<%
		}
	%>
</select>