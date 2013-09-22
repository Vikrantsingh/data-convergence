<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- {
    "_id" : ObjectId("523d400cd5f7528b39c763cc"),
    "deparment" : "Postal",
    "dataset_name" : "pincodes",
    "loc_index_id" : 7,
    "dataset" : {
        "officename" : "Achalapur B.O",
        "pincode" : "504273",
        "officeType" : "B.O",
        "Deliverystatus" : "Delivery",
        "divisionname" : "Adilabad",
        "regionname" : "Hyderabad",
        "circlename" : "Andhra Pradesh",
        "Taluk" : "Asifabad",
        "Districtname" : "Adilabad",
        "statename" : "ANDHRA PRADESH"
    }
} -->
<%@page import="rdbms.*,java.util.*" %>
<%
	String dataset=request.getParameter("dataset");
	String department=request.getParameter("department");
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
String output="{ \"department\":"+department+",\n dataset_name:"+dataset+",\n \"dataset\":";
	%>
	<h4>Sample Output Will be :</h4><textarea id="output" name="output" rows="2" cols="100" readonly> <%=output %></textarea>
  
</body>

</html>