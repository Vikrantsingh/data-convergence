<%@ page import="api.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mongodb.*,com.google.gson.*"%>
<%
	QueryAction get = new QueryAction();

	QueryModel qm = new QueryModel();

	ArrayList<String> country = new ArrayList<String>();
	if (request.getParameter("country") != null)
	{
		country.add(request.getParameter("country"));
		qm.setCountry(country);
		
	}	
	//System.out.print(request.getParameter("country"));
	//country.add("india");

	ArrayList<String> department = new ArrayList<String>();
	if (request.getParameter("department") != null)
	{
		department.add(request.getParameter("department"));
		qm.setDepartment(department);
	
	}	

	ArrayList<String> datasetName = new ArrayList<String>();
	if (request.getParameter("dataset_name") != null)
	{
		datasetName.add(request.getParameter("dataset_name"));
		qm.setDatasetName(datasetName);
		
	}	

	//department.add("agri");

	
	
	

	if (request.getParameter("limit") == null)
		qm.setLimit(10);
	else
		qm.setLimit((new Integer(request.getParameter("limit"))
				.intValue()));
	if (request.getParameter("start") == null)
		qm.setStart(0);
	else
		qm.setStart((new Integer(request.getParameter("start"))
				.intValue()));

	
	
	DBCursor cursor = get.getdata(qm);
	out.print("<pre>");
	while (cursor.hasNext()) {

		//DataObject obj = new DataObject();
		// Gson gson = new Gson();

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String json = gson.toJson(cursor.next());

		out.println(json);

	}
	out.print("</pre>");
	
%>