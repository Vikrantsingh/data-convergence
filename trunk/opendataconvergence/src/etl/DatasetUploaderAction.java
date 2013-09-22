package etl;

import java.io.File;
import java.math.BigInteger;
import java.util.ArrayList;

import nosql.InsertToMongo;
import parser.ReadCSV;
import rdbms.LocationIndexAction;
import rdbms.LocationIndexModel;

public class DatasetUploaderAction {

	public void upload(DatasetUploaderModel data) {
		System.out.println("Got File");
		ArrayList<String> keys = new ArrayList<String>();
		ArrayList<ArrayList<String>> values = new ArrayList<ArrayList<String>>();

		// /parse file and load data into arraylist
		System.out.print("Parsing File.... ");

		ReadCSV obj = new ReadCSV();
		obj.setFileName(new File(data.getFileName()));
		obj.setColSpilter(",");
		if (!obj.readCSV(obj.getFileName(), keys, values)) {
			System.out.println("Error encounter in readCSV");
			return;
		}
		System.out.println("done.");

		// /store index into rdbms

		System.out.println("Storing to rdms....");
		LocationIndexModel loc = new LocationIndexModel();
		loc.setCountry(data.getCountryColName());
		loc.setDataset_name(data.getDatasetName());
		loc.setDepartment(data.getDepartment());
		loc.setDistrict(data.getDistrictColName());
		loc.setState(data.getStateColName());

		LocationIndexAction locAction = new LocationIndexAction();
		// insert into location index
		int id = locAction.insert(loc);
		// save keys in separate tables
		locAction.saveSchema(id, keys);

		System.out.println("done.");

		// /map arraylist to mongodb
		System.out.print("Saving data to mongodb....");
		InsertToMongo ins = new InsertToMongo();
		// System.out.println(data.getDepartment());
		ins.save(id, data.getDepartment(), data.getDepartment(),
				data.getDatasetName(), keys, values);
		System.out.println("done.");
		
		int flag=obj.deleteFile(obj.getFileName());
		if(flag==1)
				System.out.println("File successfully deleted");
		else
				System.out.println("SOme error occured in file deletion");

	}

}
