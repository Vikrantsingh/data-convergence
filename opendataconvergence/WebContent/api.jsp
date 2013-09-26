<%
	if (request.getParameter("format").equals("xml"))
		response.setContentType("application/xml");
	else
		response.setContentType("application/json");
%><%@page import="net.sf.json.*,net.sf.json.xml.*"%><%@ page
	import="api2.*"%><%@ page import="java.util.*"%><%@ page
	import="com.mongodb.*,com.google.gson.*"%><%
	QueryAction get = new QueryAction();

	QueryModel qm = new QueryModel();

	if (request.getParameter("datasets") != null) {
		String loc_index_id_string[] = request.getParameter(
				"datasets").split(",");
		ArrayList<Integer> loc_index_id_int = new ArrayList<Integer>();
		for (String s : loc_index_id_string) {
			loc_index_id_int.add(new Integer(Integer.parseInt(s)));
		}
		qm.setLocation_index_id(loc_index_id_int);

		if (request.getParameter("fields") != null) {
			String dataset_key_id_string[] = request.getParameter(
					"fields").split(",");
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

		JsonObject master = new JsonObject();
		JsonObject json = new JsonObject();
		int index = 0;

		for (DBCursor cursor : dbcursor) {

			//	out.println("{\n ");

			JsonObject dataset_json = new JsonObject();
			//System.out.print(qm.getLocationIndex().toString());
			dataset_json.addProperty(
					"department",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getDepartment());
		/*	dataset_json.addProperty(
					"dataset_name",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getDataset_name());
		*/
			dataset_json.addProperty(
					"last_modified",
					qm.getLocationIndex()
							.get(qm.getLocation_index_id().get(index))
							.getTime_stamp());

			dataset_json.addProperty("total_records_found",
					cursor.count());

			dataset_json.addProperty("showing", qm.getStart() + ","
					+ qm.getLimit());
			

			JsonArray data_json = new JsonArray();

			while (cursor.hasNext()) {

				String jsonStr = cursor.next().get("data").toString();

				Gson gson = new Gson();
				JsonElement element = gson.fromJson(jsonStr,
						JsonElement.class);
				JsonObject jsonObj = element.getAsJsonObject();

				data_json.add(element);

			}
			//System.out.print(data_json.toString());
			dataset_json.add("dataset", data_json);
			json.add(qm.getLocationIndex()
					.get(qm.getLocation_index_id().get(index))
					.getDataset_name(),dataset_json);
			index++;
		}

		//master.add("opendata", json);
		master = json;

		Gson gson = new GsonBuilder().setPrettyPrinting().create();

		String js = gson.toJson(master);

		//String js = JSONML.toString(json);

		//out.println(JSONML.toString(json));

		if (request.getParameter("format").equals("json")) {
			out.print(js);
		} else {

			String str = "{'name':'JSON','integer':1,'double':2.0,'boolean':true,'nested':{'id':42},'array':[1,2,3]}";

			String temp1 = master.toString();

			System.out.println(str);
			System.out.println(temp1);

			JSON json1 = JSONSerializer.toJSON(temp1);

			XMLSerializer xmlSerializer = new XMLSerializer();
			xmlSerializer.setTypeHintsEnabled(false);
			xmlSerializer.setTypeHintsCompatibility(false);
			xmlSerializer.setRootName("gov.in");
			xmlSerializer.setForceTopLevelObject(false);
			xmlSerializer.setRemoveNamespacePrefixFromElements(true);
			// xml

			xmlSerializer.setSkipNamespaces(true);
			xmlSerializer.setSkipWhitespace(true);
			xmlSerializer.setTrimSpaces(true);

			String xml = xmlSerializer.write(json1);

			out.println(xml);

		}
		//out.print(js);

	}

	//	out.print("</pre>");
%>