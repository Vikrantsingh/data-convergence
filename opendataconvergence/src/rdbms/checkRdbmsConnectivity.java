package rdbms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class checkRdbmsConnectivity {

	public static void main(String args[]) throws Exception {
		Connection con = DB_Config.registerDB("datarepo", 3306, "localhost",
				"root", "mysql");

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

}
