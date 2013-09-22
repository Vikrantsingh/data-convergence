package api;

import java.util.ArrayList;

import rdbms.LocationIndexAction;
import rdbms.LocationIndexModel;

import nosql.MongoDBConfig;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

public class QueryAction {

	/**
	 * @param args
	 */
	public DBCursor getdata(QueryModel qm) {
		
		DB db = MongoDBConfig.getDB();

		DBCollection collection = db.getCollection(qm.getDepartment().get(0));
		
		BasicDBObject searchEmployee = new BasicDBObject();

		//code to get dataset id from location_index
		
		LocationIndexModel loc = new LocationIndexModel();
		if(qm.getCountry()!=null)
		loc.setCountry(qm.getCountry().get(0));
		if(qm.getDatasetName()!=null)
		loc.setDataset_name(qm.getDatasetName().get(0));
		if(qm.getDepartment()!=null)
		loc.setDepartment(qm.getDepartment().get(0));
		if(qm.getDistrict()!=null)
		loc.setDistrict(qm.getDistrict().get(0));
		if(qm.getState()!=null)
		loc.setState(qm.getState().get(0));
		
		LocationIndexAction locA = new LocationIndexAction();
		ArrayList <Integer> datasetID = locA.getDataSetIdFromLocationIndex(loc);
		
		// fetch data from mongodb
		
		//BasicDBObject query = new BasicDBObject("loc_index_id", datasetID.get(0));
		BasicDBObject query = new BasicDBObject("loc_index_id",10);
		BasicDBObject fields = new BasicDBObject("_id", false);
		fields.append("loc_index_id", false);
	
		DBCursor cursor = collection.find(query,fields).skip(qm.getStart()).limit(qm.getLimit());

//		while (cursor.hasNext()) {
//
//			System.out.println(cursor.next() );
//
//		}
	//	System.out.println(cursor.toString());
		
				
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

		qm.setCountry(country);
		qm.setDepartment(department);
		

		get.getdata(qm);

	}

}
