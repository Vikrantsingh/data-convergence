<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="rdbms.*,java.util.ArrayList"%>
<%
	String country = request.getParameter("country");
	String[] country_name = country.split(",");
	String state = request.getParameter("state");
	String[] state_name = state.split(",");
	String district = request.getParameter("district");
	String[] district_name = district.split(":");
	ArrayList<String> dataset_name = new ArrayList<String>();
	for (int i = 0; i < country_name.length; i++) {
		for (int j = 0; j < state_name.length; j++) {
			for (int k = 0; k < district_name.length; k++) {
				ArrayList<String> datasetName = LocationIndexAction
						.getDatasetNameDistrict(country_name[i],
								state_name[j], district_name[k]);
				for (String x : datasetName) {
					dataset_name.add(x);
				}
			}
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
			String stringb = str_array[1] + ":" + str_array[2];
	%>
	<option value=<%=id%>><%=stringb%></option>
	<%
		}
	%>
</select>