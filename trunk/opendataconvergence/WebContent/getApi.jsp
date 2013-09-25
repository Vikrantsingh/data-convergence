<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

			textarea {
				border:2px solid #ccc;
				padding: 10px;
				vertical-align: top;
				width: 75%;
			}

			.animated {
				-webkit-transition: height 0.2s;
				-moz-transition: height 0.2s;
				transition: height 0.2s;
			}

		</style>
		<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js'></script>
		<script src='js/jquery.autosize.js'></script>
		<script>
			$(function(){
				$('.normal').autosize();
				$('.animated').autosize({append: "\n"});
			});
		</script>
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
	String[] dataset_id=dataset.split(",");
	String department=request.getParameter("department");
	String fields=request.getParameter("fields");
	ArrayList<String> str=null;
	ArrayList<String> fields_name=new ArrayList<String>();
	for(int i=0;i<dataset_id.length;i++){
	//System.out.println(id.get(i));
	str=LocationIndexAction.getSchemaId(Integer.parseInt(dataset_id[i]));
	for(String j : str){
		//System.out.println(j);
		fields_name.add(j);
	}
}
System.out.println(fields);
String output="{ \n\t\"department\":"+department+",\n\t \"dataset_name\":"+dataset+",\n\t \"dataset\":"+"{\n";
for(String x : fields_name){
	output=output+"\t\t\t\""+x+"\":\" Sample Output\",\n";
}
	output=output+"\n\t\t}\n\t}";
	%>
	<h4>Sample Output Will be :</h4><textarea id="output" class="animated" name="output" rows="20" cols="100" readonly > <%=output %></textarea>
  
</body>

</html>