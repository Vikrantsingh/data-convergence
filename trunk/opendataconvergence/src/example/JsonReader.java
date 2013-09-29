package example;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

import com.google.gson.Gson;

class Dataset {
	String officename;
	String pincode;
	String officeType;
	String Deliverystatus;
	String divisionname;
	String regionname;
	String circlename;
	String Taluk;
	String Districtname;
	String statename;
}

class Pincode {
	String department;
	String last_modified;
	int total_records_found;
	String showing;
	List<Dataset> dataset;
}
 
class Page{
	Pincode pincode;
}

public class JsonReader {

	/**
	 * @param args
	 */

	private static String readUrl(String urlString) throws Exception {
		BufferedReader reader = null;
		try {
			URL url = new URL(urlString);
			reader = new BufferedReader(new InputStreamReader(url.openStream()));
			StringBuffer buffer = new StringBuffer();
			int read;
			char[] chars = new char[1024];
			while ((read = reader.read(chars)) != -1)
				buffer.append(chars, 0, read);

			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}
	
	public static Page loadData(String url) throws Exception{
		
		String json = readUrl(url);
		System.out.println(json);

		Gson gson = new Gson();
		Page page = gson.fromJson(json, Page.class);
		
		//Gson gson = new Gson();
		//Type stringStringMap = new TypeToken<Map<String, String>>(){}.getType();
		//Map<String,String> map = gson.fromJson(json, stringStringMap);

		System.out.println(page.pincode.last_modified);
	//	for (Item item : page.items)
		//	System.out.println("    " + item.title);
		
		return page;

		
	}
	
	public static String getloc(String pin)throws Exception 
	{
		
		//int start =0,limit=10;
		
		String url ="http://localhost:8080/dataconvergence/api.jsp?datasets=14&start=0&limit=10000&format=json";
		Page page = loadData(url);		
		for(Dataset d : page.pincode.dataset){
			//System.out.println(d.pincode);
			if(d.pincode.equals(pin)){
				System.out.println(d.statename+" "+d.Districtname);
				return " State : "+d.statename+" | District : "+d.Districtname+" | Taluka : "+d.Taluk;
			}
		}
		return null;
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub

		String pin ="504293";
		//Dataset d = getloc(pin);
		//System.out.println(d.statename);
		
		
	}

}
