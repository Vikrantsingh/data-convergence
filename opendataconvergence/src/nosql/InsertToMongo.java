package nosql;

import java.math.BigInteger;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Set;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

/*
 * Sample document structure
 * {
 *  id :1
 *  department :agri
 *  datasetname :farmer
 *  data : 
 *           {
 *  			key1:value1
 *  			key2:value2
 *  			key3:value3
 *           } 
 * }
 * {
 *  id :2
 *  department :agri
 *  datasetname :farmer
 *  data : 
 *           {
 *  			key1:value1
 *  			key2:value2
 *  			key3:value3
 *           }           
 * }
 * 
 * {
 *  id :3
 *  department :agri
 *  datasetname :crop
 *  data : 
 *           {
 *  			key1:value1
 *  			key2:value2
 *  			key3:value3
 *           }           
 * }
 *  
 * 
 * 
 */
public class InsertToMongo {

	public boolean save(int id, String collectionName, String departmentName,
			String DatasetName, ArrayList<String> keys,
			ArrayList<ArrayList<String>> values) {
		Mongo mongo;
		try {
			

			DB db = MongoDBConfig.getDB();
			DBCollection collection = null;

			if (!db.collectionExists(collectionName)) {
				// DBObject dbo = new DBObject();
				DBObject options = BasicDBObjectBuilder.start().get();
				collection = db.createCollection(collectionName, options);

			} else {

				collection = db.getCollection(collectionName);
			}

		 
			///now create and insert document
			//BasicDBObject dataset = new BasicDBObject();
			
			
			
		 
			for(int i=0; i< values.size() ; i++){
				//System.out.println("hel");
				
				BasicDBObject document = new BasicDBObject();
				
				document.put("department", departmentName);
				document.put("dataset_name", DatasetName);
				document.put("loc_index_id",id);
				

				BasicDBObject documentDetail = new BasicDBObject();
				//BasicDBObject dataset = new BasicDBObject();
				
				for(int j=0;j<keys.size();j++){					
					documentDetail.put(keys.get(j), values.get(i).get(j));
				}
				
				//dataset.add(documentDetail);
				
				//dataset.put((i+1)+"", documentDetail);
				//document.put("dataset",values.get(i));
				document.put("data",documentDetail);
				collection.insert(document);
				
			}
			//document.append("dataset", dataset);
			//System.out.println(document.toString());
			//collection.insert(document);
			
			System.out.println("done");


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		return true;

	}

	public static void main(String[] args) {

		ArrayList<String> key = new ArrayList<String>();
		key.add("name");
		key.add("salary");
		ArrayList<ArrayList<String>> values = new ArrayList<ArrayList<String>>();

		ArrayList<String> a = new ArrayList<String>();
		a.add("vikrant");
		a.add("20");
		values.add(a);
		a = new ArrayList<String>();
		a.add("viki");
		a.add("20");
		values.add(a);
		// save(int id, String collection, String department,
		// String DatasetName, ArrayList<String> keys,
		// ArrayList<ArrayList<String>> values)

		InsertToMongo ins = new InsertToMongo();

		ins.save(1, "col1l2", "agri", "farmer", key, values);
		

	}

}
