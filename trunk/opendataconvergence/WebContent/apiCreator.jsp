<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="rdbms.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="js/loading.js"></script>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js'></script>
<script src='js/jquery.autosize.js'></script>
<script>
			$(function(){
				$('.normal').autosize();
				$('.animated').autosize({append: "\n"});
			});
		</script>
</head>
<body>
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
					<td colspan="2" bgcolor="#FFFF99"><label> <select
							name="department" id="department"
							onchange="loadDataset(this.value)" multiple>
								<option value="">Select Department</option>
								<%
        Connection con = DB_Config.registerDB();

		String sql = "select distinct department from location_index";

		PreparedStatement pst = con.prepareStatement(sql);

		ResultSet res = pst.executeQuery();

		while (res.next()) {%>
								<option value=<%=res.getString("department")%>>
									<%=res.getString("department") %></option>
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
					<td bgcolor="#FFFF99">Country :&nbsp;
						<div id=country>
							<select id="countries" name="countries">
								<option value="">Select country</option>

							</select>
						</div>
					</td>
					<td bgcolor="#FFFF99">State :&nbsp;
						<div id=state>
							<select id="states" name="states">
								<option value="">Select state</option>

							</select>
						</div>
					</td>
					<td bgcolor="#FFFF99">District :&nbsp;
						<div id=district>
							<select id="districts" name="districts">
								<option value="">Select District</option>

							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFF99">Dataset</td>
					<td colspan="2" bgcolor="#FFFF99">
						<div id=dataset_name>
							<select id="dataset" name="dataset">
								<option value="">Select DataSets</option>

							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFF99">Field</td>
					<td colspan="2" bgcolor="#FFFF99">
						<div id="dataset_field">
							<select id="dataset_fields" name="dataset_fields">
								<option value="">Select Fields Required</option>

							</select>
						</div>
					</td>
				</tr>
				<tr>
					
					<td bgcolor="#FFCC66">Output Format:</td>
					<td bgcolor="#FFCC66"><select name="format" id="format"><option value="json">json</option><option value="xml">xml</option></select></td>
					<td bgcolor="#FFCC66"></td>
				</tr>
				<tr>
					<td bgcolor="#FFCC66">Specify Limit:</td>
					<td bgcolor="#FFCC66">Start:</td>
					<td bgcolor="#FFCC66"><input type="text" id="start"
						name="start" value="0" /></td>
				</tr>
				<tr>
					<td bgcolor="#FFCC66">&nbsp;</td>
					<td bgcolor="#FFCC66">Limit:</td>
					<td bgcolor="#FFCC66"><input type="text" id="limit"
						name="limit" value="1" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><label> <input type="button" name="Submit"
							value="Generate API" onclick="show()">
					</label></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>


			<h4>Query Statement is:</h4>
			<textarea id="query" class="normal" name="query"  rows="5" cols="100" readonly></textarea>
			<br />
			<div id="query_generate"></div>
		</form>
	</center>
</body>
</html>