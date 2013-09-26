<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="rdbms.*,java.util.ArrayList"%>
	<%
		String state = request.getParameter("state");
		String[] state_name = state.split(",");
		String country = request.getParameter("country");
		String[] country_name = country.split(":");
		ArrayList<String> district_name = new ArrayList<String>();
		for (int i = 0; i < country_name.length; i++) {
			for (int j = 0; j < state_name.length; j++) {
				String districtName = LocationIndexAction.getDistrict(
						country_name[i], state_name[j]);
				String[] stateName = state_name[j].split(":");
				if (districtName != null)
					district_name.add(districtName + ":" + stateName[0]);
			}
		}
		System.out.println("districtname:" + district_name);
	%>
	<select onchange="loadDatasetFilter()" name="districts" id="districts"
		multiple>
		<option value="">Select District</option>
		<%
			for (String x : district_name) {
				String[] name = x.split(":");
				System.out.println("Name is:" + name[0]);
				if (!name[0].equals("")) {
		%>
		<option value="<%=x%>"><%=x%></option>
		<%
			}
			}
		%>
	</select>
</body>
</html>