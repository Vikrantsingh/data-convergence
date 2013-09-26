/**
 * Program to read the upload a csv file and read the csv file and store it in MongoDB
 */
package parser;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosql.InsertToMongo;

/**
 * @author pridhvi
 * 
 */
public class ReadCSV {

	/**
	 * @param args
	 */

	private File fileName;
	private String colSpilter;

	public File getFileName() {
		return fileName;
	}

	public void setFileName(File file) {

		this.fileName = file;
	}

	public String getColSpilter() {
		return colSpilter;
	}

	public void setColSpilter(String colSpilter) {
		this.colSpilter = colSpilter;
	}

	public int deleteFile(File filename)
	    {	
	    	try{
	 
	    		if(filename.delete()){
	    			System.out.println(filename.getName() + " is deleted!");
	    			return 1;
	    		}else{
	    			System.out.println("Delete operation is failed.");
	    			return 0;
	    		}
	 
	    	}catch(Exception e){
	 
	    		e.printStackTrace();
	 
	    	}
			return 1;
			
	 
	    }
	// function to read the csv file into a string array
	public boolean readCSV(File file,ArrayList<String> keys,ArrayList<ArrayList<String>> values) {
		BufferedReader br = null;

//		ArrayList<String> keys = new ArrayList<String>();
//		ArrayList<ArrayList<String>> values = new ArrayList<ArrayList<String>>();
	//	List<String[]> data = new ArrayList<String[]>();
		String[] row = null;
		String line = null;
		int count = 0, j = 0;
		try {
			br = new BufferedReader(new FileReader(file));
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			// line = br.readLine();

			// System.out.println(line);
			int i = 0;
			while ((line = br.readLine()) != null) {
				if (i == 0) {
					row = line.split(getColSpilter());
					for (String s : row) {
						s=s.trim();
						s=s.replace(" ", "_");
						s=s.replace("\"", "");
						keys.add(s);
					}
					i++;
				} else {
					row = line.split(getColSpilter());
					ArrayList<String> record = new ArrayList<String>();

					for (String s : row) {
						record.add(s);
					}

					values.add(record);
					
					//System.out.println(values.toString());
					 
					// data.add(row);
					// for(int i=0;i<row.length;i++){
					// System.out.print(row[i]+"\t");
					// }

				}
				//count++;
				// System.out.println();
			}

			//System.out.println(values.toString());
//			InsertToMongo ins = new InsertToMongo();
//			 ins.save(1,"pincode","address","pincode and area",keys,values);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		//	System.out.println("total columns read are :" + count + "\t"+ row.length);
			if (br != null) {

				try {
					br.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
		return true;
	}
}
