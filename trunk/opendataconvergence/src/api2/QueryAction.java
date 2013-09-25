package api2;

import java.util.ArrayList;
import java.util.HashMap;

import nosql.MongoDBConfig;
import rdbms.LocationIndexAction;
import rdbms.LocationIndexModel;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

public class QueryAction {

	/**
	 * @param args
	 */
	public ArrayList<DBCursor> getdata(QueryModel qm) {

		ArrayList<DBCursor> cursor = new ArrayList<DBCursor>();
		// code to getdata corressponding to location_index_id
		LocationIndexAction loc = new LocationIndexAction();
		HashMap<Integer, LocationIndexModel> locIndex = new HashMap<Integer, LocationIndexModel>();

		for (int loc_id : qm.getLocation_index_id()) {

			locIndex.put(loc_id, loc.getLocationIndexData(loc_id));

			DB db = MongoDBConfig.getDB();

			DBCollection collection = db.getCollection(locIndex.get(loc_id)
					.getDepartment());

			BasicDBObject searchEmployee = new BasicDBObject();

			LocationIndexAction locA = new LocationIndexAction();

			// fetch data from mongodb

			// BasicDBObject query = new BasicDBObject("loc_index_id",
			// datasetID.get(0));
			BasicDBObject query = new BasicDBObject("loc_index_id", loc_id);
			
			BasicDBObject fields = new BasicDBObject("_id", false);
			 fields.append("loc_index_id", false);
			 fields.append("department", false);
			 fields.append("dataset_name", false);

			cursor.add(collection.find(query, fields).skip(qm.getStart())
					.limit(qm.getLimit()));

		}
		qm.setLocationIndex(locIndex);
		return cursor;

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QueryAction get = new QueryAction();

		QueryModel qm = new QueryModel();

		ArrayList<String> country = new ArrayList<String>();
		country.add("india");

		ArrayList<String> department = new ArrayList<String>();
		department.add("address");

		get.getdata(qm);

	}

}
