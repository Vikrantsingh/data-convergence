<%@ page language="java" contentType="application/json; charset=UTF-8"  pageEncoding="UTF-8"%><%@ page import="api2.*"%><%@ page import="java.util.*"%><%@ page import="org.json.simple.*"%><%@ page import="com.mongodb.*,com.google.gson.*"%>
<%
 
	QueryAction get = new QueryAction();

	QueryModel qm = new QueryModel();

	if (request.getParameter("loc_index_id") != null) {
		String loc_index_id_string[] = request.getParameter(
				"loc_index_id").split(",");
		ArrayList<Integer> loc_index_id_int = new ArrayList<Integer>();
		for (String s : loc_index_id_string) {
			loc_index_id_int.add(new Integer(Integer.parseInt(s)));
		}
		qm.setLocation_index_id(loc_index_id_int);

		if (request.getParameter("dataset_key_id") != null) {
			String dataset_key_id_string[] = request.getParameter(
					"dataset_key_id").split(",");
			ArrayList<Integer> dataset_key_id_int = new ArrayList<Integer>();
			for (String s : dataset_key_id_string) {
				dataset_key_id_int
						.add(new Integer(Integer.parseInt(s)));
			}

		}

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

		ArrayList<DBCursor> dbcursor = get.getdata(qm);
		//out.print("<pre>");

		JSONArray json = new JSONArray();
		int index = 0;

		for (DBCursor cursor : dbcursor) {

			//	out.println("{\n ");

			JSONObject dataset_json = new JSONObject();
			//System.out.print(qm.getLocationIndex().toString());
			dataset_json.put(
					"department",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getDepartment());
			dataset_json.put(
					"dataset_name",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getDataset_name());
			dataset_json.put(
					"last_modified",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getTime_stamp());
			//jsonObj.put("department","agri");
			index++;
			
			JSONArray data_json = new JSONArray();

			while (cursor.hasNext()) {

				/*			
				//DataObject obj = new DataObject();
				 // Gson gson = new Gson();
				 Gson gson = new GsonBuilder().setPrettyPrinting()
				 .create();
				 String js = gson.toJson(cursor.next());
				 //out.println(js);
				 */
				 data_json.add(cursor.next().get("data"));

			}
			dataset_json.put("dataset", data_json);
			json.add(dataset_json);
		}

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String js = gson.toJson(json);

		out.print(js);
	}

//	out.print("</pre>");
%>