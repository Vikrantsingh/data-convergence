package nosql;

import java.net.UnknownHostException;

import com.mongodb.DB;
import com.mongodb.Mongo;

public class MongoDBConfig {

	/**
	 * @param args
	 */

	public static DB getDB() {
		Mongo mongo;
		DB db = null;
		try {
			mongo = new Mongo("localhost", 27017);
			db = mongo.getDB("company");
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return db;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
