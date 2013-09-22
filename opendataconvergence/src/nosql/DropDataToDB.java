package nosql;

import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;

import com.mongodb.DB;

import com.mongodb.DBCollection;

import com.mongodb.DBCursor;

import com.mongodb.Mongo;

import com.mongodb.MongoException;

public class DropDataToDB {
	public static void main(String a[]) {
		System.out.println("helo");
		try {

			DB db = MongoDBConfig.getDB();

			DBCollection collection = db.getCollection("employees");

			BasicDBObject add = new BasicDBObject();

			add.put("city", "nanded");

			add.put("no", 431606);

			BasicDBObject employee = new BasicDBObject();

			employee.put("name", "Hannah");

			employee.put("no", 4);

			employee.put("address", add);

			collection.insert(employee);

			BasicDBObject searchEmployee = new BasicDBObject();

			searchEmployee.put("no", 2);

			DBCursor cursor = collection.find(searchEmployee);

			while (cursor.hasNext()) {

				System.out.println(cursor.next());

			}

			System.out.println("The Search Query has Executed!");

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

}
