<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="rdbms.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/loading.js"></script>
</head>
<body >
<center>
<form name="form1" method="post" action="">
  <table width="800" border="0">
    <tr>
      <td width="200">&nbsp;</td>
      <td width="300">&nbsp;</td>
      <td width="300">&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">Department</td>
      <td colspan="2" bgcolor="#FFFF99"><label>
        <select name="department" id="department" onchange="loadDataset(this.value)">
        <option value="">Select Department</option>
        <%
        Connection con = DB_Config.registerDB("datarepo", 3306, "localhost",
				"root", "root");

		String sql = "select department from location_index";

		PreparedStatement pst = con.prepareStatement(sql);

		ResultSet res = pst.executeQuery();

		while (res.next()) {%>
		<option value=<%=res.getString("department")%> > <%=res.getString("department") %></option>
		<%
		}

		DB_Config.close(con);
		DB_Config.close(pst);
		DB_Config.close(res);

        %>
        </select>
      </label></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">Dataset</td>
      <td colspan="2" bgcolor="#FFFF99">
      <div id=dataset_name>
      <select id="dataset" name="dataset" >
             <option value="">Select DataSets</option>
       
      </select>
      </div></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">Field</td>
      <td colspan="2" bgcolor="#FFFF99">
      <div id="dataset_field">
      <select id="dataset_fields"  name="dataset_fields" >
       <option value="">Select Fields Required</option>
       
      </select>
      </div></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td bgcolor="#FFCC66">Filter1</td>
      <td bgcolor="#FFCC66"><label>
        <select name="select">
         <option value="">Define Filter</option>
        </select>
      </label></td>
      <td bgcolor="#FFCC66"><select name="select4">
        <option value="=">=</option>
        <option value="&gt;">&gt;</option>
        <option value="&lt;">&lt;</option>
            </select>
        <label>
        <input type="text" name="textfield">
      </label></td>
    </tr>
    <tr>
      <td bgcolor="#FFCC66">Filter2</td>
      <td bgcolor="#FFCC66"><select name="select2">
      </select></td>
      <td bgcolor="#FFCC66"><select name="select5">
        <option value="=">=</option>
        <option value="&gt;">&gt;</option>
        <option value="&lt;">&lt;</option>
      </select>
        <label>
        <input type="text" name="textfield2">
        </label></td>
    </tr>
    <tr>
      <td bgcolor="#FFCC66">Add more filter </td>
      <td bgcolor="#FFCC66">&nbsp;</td>
      <td bgcolor="#FFCC66">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input type="button" name="Submit" value="Generate API" onclick="show()">
      </label></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td>&nbsp;</td>
    </tr>
  </table>
  <h4>Query Statement is:</h4><textarea id="query" name="query"  rows="2" cols="100"  readonly ></textarea>
  <br/>
  <br/>
  <br/>
  <div id="query_generate">
  <h4>Sample Output Will be :</h4><textarea id="output" name="output" rows="2" cols="100" readonly></textarea>
  </div>
</form>
</center>
</body>
</html>