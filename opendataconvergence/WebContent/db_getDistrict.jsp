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
	String state=request.getParameter("state");
	String[] state_name=state.split(",");
	ArrayList<String> district_name=new ArrayList<String>();
	for(int i=0;i<state_name.length;i++){
		String districtName=LocationIndexAction.getDistrict(state_name[i]);
		district_name.add(districtName);
	
	}
	System.out.println("districtname:"+district_name);
	
	%>
<select onchange="loadDatasetFilter()" name="districts" id="districts" multiple>
<option value="">Select District</option>
<%if(district_name.isEmpty()){%> 
	<option value="null">No Details Available</option>
	<%}
else{
for(String x : district_name){
		System.out.println(x);
	 %>
	<option value=<%=x %>><%=x %></option>
	<%}
}%>
</select>
</body>
</html>