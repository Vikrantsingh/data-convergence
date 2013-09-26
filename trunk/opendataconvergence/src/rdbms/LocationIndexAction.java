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

		String sql = "insert into dataset_keys(location_index_id,keyname)values(?,?)";

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

	public static ArrayList<String> getSchema(int id) {
		ArrayList<String> schema = null;

		try {
			schema = new ArrayList<String>();

			Connection con = DB_Config.registerDB();

			String sql = "select * from dataset_keys where dataset_id = " + id;

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

	public static ArrayList<String> getSchemaId(int id) {
		ArrayList<String> schema = null;

		try {
			schema = new ArrayList<String>();

			Connection con = DB_Config.registerDB();

			String sql = "select * from dataset_keys where location_index_id = "
					+ id;

			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet res = pst.executeQuery();

			while (res.next()) {
				String name = res.getString("keyname");
				int schemaId = res.getInt("dataset_key_id");
				schema.add(schemaId + "," + name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return schema;
	}

	public static ArrayList<String> getDatasetName(String Department) {

		ArrayList<String> datasetNames = new ArrayList<String>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select location_index_id,dataset_name,date_time from location_index where department = '"
					+ Department + "'";

			pst = con.prepareStatement(sql);

			res = pst.executeQuery();

			while (res.next()) {
				String name = res.getString("dataset_name");
				int id = res.getInt("location_index_id");
				String date = res.getString("date_time");
				String dataset_nameid = id + "," + name + "," + date;
				datasetNames.add(dataset_nameid);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);

		}

		return datasetNames;

	}

	// public static ArrayList<Integer> getDataSetKey(int dataset_id){
	// ArrayList<Integer> datasetId =new ArrayList<Integer>();
	// Connection con=null;
	// String sql=null;
	// PreparedStatement pst=null;
	// ResultSet res=null;
	// try{
	// System.out.println("Inside Getting KEy");
	// con = DB_Config.registerDB();
	// System.out.println(dataset_id);
	// sql = "select id from location_index where dataset_name = '"+
	// dataset_id+"'" ;
	//
	// pst = con.prepareStatement(sql);
	//
	// res = pst.executeQuery();
	//
	// while (res.next()) {
	// datasetId.add(res.getInt("id"));
	// }
	// System.out.println("dataset id's of agri:"+datasetId.size());
	// for(int x : datasetId){
	// System.out.println(x);
	// }
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// finally{
	// DB_Config.close(con);
	// DB_Config.close(pst);
	// DB_Config.close(res);
	//
	// }
	//
	// return datasetId;
	// }

	public ArrayList<Integer> getDataSetIdFromLocationIndex(
			LocationIndexModel loc) {
		ArrayList<Integer> id = new ArrayList<Integer>();

		try {

			Connection con = DB_Config.registerDB();

			String filter = " true ";

			if (loc.getCountry() != null) {
				filter = filter + " and country = '" + loc.getCountry() + "'";
			}

			if (loc.getDataset_name() != null) {
				filter = filter + " and dataset_name = '"
						+ loc.getDataset_name() + "'";
			}
			if (loc.getDepartment() != null) {
				filter = filter + " and department = '" + loc.getDepartment()
						+ "'";
			}
			if (loc.getState() != null) {
				filter = filter + " and state = '" + loc.getState() + "'";
			}
			if (loc.getDistrict() != null) {
				filter = filter + " and district = '" + loc.getDistrict() + "'";
			}

			String sql = "select * from location_index where " + filter;

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

	// for getting the country name for the respective departments
	/****************** Starting of getCountry() *********************/
	public static String getCountry(String deptName) {

		String countryName = null;
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select country from location_index where department = '"
					+ deptName + "'";

			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
				System.out.println(res.getString("country"));
				countryName = res.getString("country") + ":" + deptName;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);

		}

		return countryName;

	}

	/****************** End of getCountry() **********************/

	// for getting the state name for the respective country
	/****************** Starting of getState() *********************/
	@SuppressWarnings("null")
	public static ArrayList<String> getState(String countryName) {
		String[] countrySplit = countryName.split(":");

		ArrayList<String> stateName = new ArrayList<String>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select state from location_index where country = '"
					+ countrySplit[0] + "' and department='" + countrySplit[1]
					+ "'";
			System.out.println("DB coimmand :" + sql);
			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
				System.out.println("State:" + res.getString("state"));
				stateName.add(res.getString("state") + ":" + countrySplit[1]);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			System.out.println("inside getState in indexaction:" + stateName);
		}

		return stateName;

	}

	/****************** End of getState() **********************/

	// for getting the district name for the respective country
	/****************** Starting of getDistrict() *********************/
	public static String getDistrict(String countryName, String statename) {
		String[] countrySplit = countryName.split(":");
		String[] stateSplit=statename.split(":");
		String districtName = null;
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select district from location_index where state = '"
					+ stateSplit[0] + "' and department='" + stateSplit[1]
					+ "' and country='"+countrySplit[0]+"'";
			System.out.println("getdistrict sql:"+sql);
			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
					String s = res.getString("district");
					System.out.println("output:"+s);
					districtName = s + ":" + stateSplit[1];
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			System.out.println("district names obtained are:"+districtName);
		}

		return districtName;

	}

	/****************** End of getDistrict() **********************/

	/**************** datasetName filter based on country, state and district ****************/
	public static ArrayList<String> getDatasetNameFilter(String country) {
		String[] country_name = country.split(":");
		System.out.println("Inside function " + country_name[0] + "  "
				+ country_name[1]);
		ArrayList<String> datasetNames = new ArrayList<String>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select location_index_id,dataset_name,date_time from location_index where department = '"
					+ country_name[1]
					+ "' and country='"
					+ country_name[0]
					+ "'";
			System.out.println("In location" + sql);
			pst = con.prepareStatement(sql);

			res = pst.executeQuery();

			while (res.next()) {
				String name = res.getString("dataset_name");
				int id = res.getInt("location_index_id");
				String date = res.getString("date_time");
				String dataset_nameid = id + "," + name + "," + date;
				datasetNames.add(dataset_nameid);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			System.out.println(datasetNames);

		}

		return datasetNames;

	}

	/******************* dataset name filtering done *******************/

	public static String getDatasetNameId(int dataset_id) {

		String datasetNames = null;
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select dataset_name from location_index where location_index_id = "
					+ dataset_id;

			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
				System.out.println(res.getString("dataset_name"));
				datasetNames = res.getString("dataset_name");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);

		}

		return datasetNames;

	}

	// for getting the state name for the respective country
	/****************** Starting of getState() *********************/
	@SuppressWarnings("null")
	public static ArrayList<String> getDatasetNameState(String countryName,
			String state_Name) {
		String[] countrySplit = countryName.split(":");
		String[] stateSplit = state_Name.split(":");

		ArrayList<String> datasetNames = new ArrayList<String>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select location_index_id,dataset_name,date_time from location_index where country = '"
					+ countrySplit[0]
					+ "' and department='"
					+ countrySplit[1]
					+ "'"
					+ " and state='"
					+ stateSplit[0]
					+ "' order by date_time desc";
			System.out.println("DB coimmand :" + sql);
			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
				String name = res.getString("dataset_name");
				int id = res.getInt("location_index_id");
				String date = res.getString("date_time");
				String[] dateTime = date.split(" ");
				String dataset_nameid = id + "," + name + "," + dateTime[0];
				datasetNames.add(dataset_nameid);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			System.out
					.println("inside getState in indexaction:" + datasetNames);
		}

		return datasetNames;

	}

	/****************** Starting of getState() *********************/
	@SuppressWarnings("null")
	public static ArrayList<String> getDatasetNameDistrict(String countryName,
			String state_Name, String districtName) {
		String[] countrySplit = countryName.split(":");
		String[] stateSplit = state_Name.split(":");
		String[] districtSplit = districtName.split(":");
		ArrayList<String> datasetNames = new ArrayList<String>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		try {
			con = DB_Config.registerDB();

			sql = "select location_index_id,dataset_name,date_time from location_index where country = '"
					+ countrySplit[0]
					+ "' and department='"
					+ countrySplit[1]
					+ "'"
					+ " and state='"
					+ stateSplit[0]
					+ "' and district='"
					+ districtSplit[0] + "' order by date_time desc";
			System.out.println("DB coimmand :" + sql);
			pst = con.prepareStatement(sql);

			res = pst.executeQuery();
			while (res.next()) {
				String name = res.getString("dataset_name");
				int id = res.getInt("location_index_id");
				String date = res.getString("date_time");
				String[] dateTime = date.split(" ");
				String dataset_nameid = id + "," + name + "," + dateTime[0];
				datasetNames.add(dataset_nameid);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);
			System.out
					.println("inside getState in indexaction:" + datasetNames);
		}

		return datasetNames;

	}
	
	public LocationIndexModel getLocationIndexData(int loc_index_id) {
		ArrayList<Integer> datasetId = new ArrayList<Integer>();
		Connection con = null;
		String sql = null;
		PreparedStatement pst = null;
		ResultSet res = null;
		LocationIndexModel loc =null;
		try {
			
			con = DB_Config.registerDB();
			
			sql = "select * from location_index where location_index_id = '"+ loc_index_id + "'";

			pst = con.prepareStatement(sql);

			res = pst.executeQuery();

			
			while (res.next()) {
				loc = new LocationIndexModel();
				loc.setCountry(res.getString("country"));
				loc.setDataset_name(res.getString("dataset_name"));
				loc.setDepartment(res.getString("department"));				
				loc.setDistrict(res.getString("district"));				
				loc.setTime_stamp(res.getString("date_time"));
				loc.setLocation_index_id(res.getInt("location_index_id"));
								
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DB_Config.close(con);
			DB_Config.close(pst);
			DB_Config.close(res);

		}

		return loc;

	}

	
	public static void main(String args[]) throws Exception {

		LocationIndexModel locData = new LocationIndexModel();
		locData.setCountry("india");
		locData.setDataset_name("population");
		locData.setDistrict("nanded");
		locData.setState("maha");
		locData.setDepartment("agri");
		// LocationIndexAction loadlocAction = new LocationIndexAction();
		// loadlocAction.insert(locData);
		LocationIndexAction.getDatasetName(locData.getDepartment());

	}
}