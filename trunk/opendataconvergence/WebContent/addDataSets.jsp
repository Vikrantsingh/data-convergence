<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>open data</title>
</head>
<body>
<a href="index.jsp">Home</a><br/>
<b>Add new Datasets</b>
<form method="post" action="db_addDataSets.jsp" 
                        enctype="multipart/form-data">
  <table style="height: 90px; width: 100%;">
    <tr>
      <td width="17%" bgcolor="#FFFF99">Department *</td>
      <td width="83%" bgcolor="#FFFF99"><input type="text" name="department"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">Dataset name *</td>
      <td bgcolor="#FFFF99"><input type="text" name="datasetname"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">Granularity</td>
      <td bgcolor="#FFFF99"><table>
          <tr>
            <td width="140" bgcolor="#FFCC00">Country</td>
            <td width="159" bgcolor="#FFCC00"><input type="radio" name="country" value="single">
              single
              <input type="radio" name="country" value="multiple">
              multiple</td>
          </tr>
          <tr>
            <td bgcolor="#FFCC00">Country/column name</td>
            <td bgcolor="#FFCC00"><input type="text" name="country_col_name"></td>
          </tr>
          <tr>
            <td bgcolor="#FFCC00">State</td>
            <td bgcolor="#FFCC00"><input type="radio" name="state" value="single">
              single
              <input type="radio" name="state" value="multiple">
              multiple</td>
          </tr>
          <tr>
            <td bgcolor="#FFCC00">State/column name</td>
            <td bgcolor="#FFCC00"><input type="text" name="state_col_name"></td>
          </tr>
          <tr>
            <td bgcolor="#FFCC00">District</td>
            <td bgcolor="#FFCC00"><input type="radio" name="district" value="single">
              single
              <input type="radio" name="district" value="multiple">
              multiple</td>
          </tr>
          <tr>
            <td bgcolor="#FFCC00">District/column name</td>
            <td bgcolor="#FFCC00"><input type="text" name="district_col_name"></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">File Format</td>
      <td bgcolor="#FFFF99"><select name="file_format">
          <option>csv</option>
          <option>xml</option>
        </select></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99">upload</td>
      <td bgcolor="#FFFF99"><input type="file" name="file"></td>
    </tr>
    <tr>
      <td bgcolor="#FFFF99" ></td>
      <td bgcolor="#FFFF99"><input type="submit" value="submit"></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
<hr>
</body>
</html>
