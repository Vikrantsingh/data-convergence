package rdbms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.mysql.jdbc.Statement;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

public class LocationIndexAction {

	public int insert(LocationIndexModel locData) {
		try {
			Connection con = DB_Config.registerDB();

			String sql = "insert into location_index(country,state,district,department,dataset_name)values(?,?,?,?,?)";

			PreparedStatement pst;

			pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

			pst.setString(1, locData.getCountry());
			pst.setString(2, locData.getState());
			pst.setString(3, locData.getDistrict());
			pst.setString(4, locData.getDepartment());
			pst.setString(5, locData.getDataset_name());

			pst.executeUpdate();

			int id = 0;
			ResultSet rs = pst.getGeneratedKeys();
			while (rs.next()) {
				id = rs.getInt(1);
			}

			DB_Config.close(con);
			DB_Config.close(pst);

			return id;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}

	public void saveSchema(int id, ArrayList<String> keys) {
		Connection con = DB_Config.registerDB();

		String sql = "insert into dataset_keys(dataset_id,keyname)values(?,?)";

		PreparedStatement pst;

		try {
			pst = con.prepareStatement(sql);

			pst.setInt(1, id);

			for (String s : keys) {
				pst.setString(2, s);
				pst.executeUpdate();

			}
			DB_Config.close(con);
			DB_Config.close(pst);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void display() throws Exception {

		Connection con = DB_Config.registerDB();

		String sql = "select * from location_index";

		PreparedStatement pst = con.prepareStatement(sql);

		ResultSet res = pst.executeQuery();

		while (res.next()) {
			System.out.println(res.getString("dataset_name"));
		}

		DB_Config.close(con);
		DB_Config.close(pst);
		DB_Config.close(res);
	}

	public static ArrayList<String> getSchema(int id)
	{
		ArrayList<String> schema=null;
		
		try {
			schema = new ArrayList<String>();
			
			Connection con = DB_Config.registerDB();

			String sql = "select * from dataset_keys where dataset_id = "+ id ;

			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet res = pst.executeQuery();

			while (res.next()) {
				schema.add(res.getString("keyname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			
		return schema; 
	}
	
	public static ArrayList<String> getDatasetName(String Department){
		
		ArrayList<String> datasetNames = new ArrayList<String>();
		Connection con=null;
		String sql=null;
		PreparedStatement pst=null;
		ResultSet res=null;
		try{
			 con = DB_Config.registerDB();

			sql = "select dataset_name from location_index where department = '"+ Department+"'" ;

			pst = con.prepareStatement(sql);

			res = pst.executeQuery();

			while (res.next()) {
				datasetNames.add(res.getString("dataset_name"));
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			
		}
		
		return  datasetNames;
		
	}
	
	public static ArrayList<Integer> getDataSetKey(String datasetName){
			ArrayList<Integer> datasetId =new ArrayList<Integer>();
			Connection con=null;
			String sql=null;
			PreparedStatement pst=null;
			ResultSet res=null;
			try{
				System.out.println("Inside Getting KEy");
				 con = DB_Config.registerDB();
				 System.out.println(datasetName);
				sql = "select id from location_index where dataset_name = '"+ datasetName+"'" ;

				pst = con.prepareStatement(sql);

				res = pst.executeQuery();

				while (res.next()) {
					datasetId.add(res.getInt("id"));
				}
				System.out.println("dataset id's of agri:"+datasetId.size());
				for(int x : datasetId){
					System.out.println(x);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				DB_Config.close(con);
				DB_Config.close(pst);
				DB_Config.close(res);
				
			}
			
			return  datasetId;
	}
	
	
	public ArrayList<Integer> getDataSetIdFromLocationIndex (LocationIndexModel loc)
	{
		ArrayList<Integer> id = new ArrayList<Integer>();

		try {
			
			
			Connection con = DB_Config.registerDB();
			
			String filter = " true ";
			
			if(loc.getCountry()!=null)
			{
				filter = filter + " and country = '"+loc.getCountry()+"'";
			}

			if(loc.getDataset_name()!=null)
			{
				filter = filter + " and dataset_name = '"+loc.getDataset_name()+"'";
			}
			if(loc.getDepartment()!=null)
			{
				filter = filter + " and department = '"+loc.getDepartment()+"'";
			}
			if(loc.getState()!=null)
			{
				filter = filter + " and state = '"+loc.getState()+"'";
			}
			if(loc.getDistrict()!=null)
			{
				filter = filter + " and district = '"+loc.getDistrict()+"'";
			}
			
			
			String sql = "select * from location_index where "+filter;

			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet res = pst.executeQuery();

			while (res.next()) {				
				id.add(res.getInt("id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return id;
	}
	
	public static void main(String args[]) throws Exception {

		LocationIndexModel locData = new LocationIndexModel();
		locData.setCountry("india");
		locData.setDataset_name("population");
		locData.setDistrict("nanded");
		locData.setState("maha");
		locData.setDepartment("agri");
		//LocationIndexAction loadlocAction = new LocationIndexAction();
		//loadlocAction.insert(locData);
		LocationIndexAction.getDatasetName(locData.getDepartment());
		ArrayList<Integer>id=LocationIndexAction.getDataSetKey("vik2");
		ArrayList<String> str=null;
		Set<String> feilds=new HashSet<String>();
		for(int i =0;i<id.size();i++){
			System.out.println(id.get(i));
			str=LocationIndexAction.getSchema(id.get(i));
			for(String j : str){
				System.out.println(j);
				feilds.add(j);
			}
		}
		System.out.println(feilds);
		/*for(String x:schema){
			System.out.println(x);
		}*/
		//loadlocAction.display();

	}
}