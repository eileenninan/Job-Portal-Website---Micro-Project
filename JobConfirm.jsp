<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Modify</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<%
			String DB_URL="jdbc:mysql://localhost/employer";
			String USER = "root";
			String PASS = "3009";
	
			Statement stmt= null;
			String sql=null;
			try
			{
				java.sql.Connection con;
				con = null;
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				con = DriverManager.getConnection(DB_URL, USER, PASS);
				stmt = con.createStatement();
				if(request.getParameter("edit")!=null)
				{
					int id=Integer.parseInt(request.getParameter("edit"));
					String name, em, jp, stat;
			
					PreparedStatement ps=null;
			
					ps=con.prepareStatement("select * from applicant where id=?");
					ps.setInt(1,id);
					ResultSet rs=ps.executeQuery();
			
					while(rs.next())
					{
						id=rs.getInt(1);
						name=rs.getString(2);
						em=rs.getString(3);
						jp=rs.getString(4);
						stat=rs.getString(5);
		%>
						<div class="login-box">
							<h2>Change Status</h2>
							<form method="post" action="JobConfirmUpdate.jsp">
								<div class="user-box">
									<input type="text" name="Status" value="<%=stat %>">
									<label>Status (Confirm/ Not Confirm)</label>
								</div>
								<input type="hidden" name="id" value="<%=id %>">
								<button name="btn_update">
									<span></span>
									<span></span>
									<span></span>
									<span></span>
									Modify
								</button>
							</form>
						</div>

		<%
					}
				}
				else{
					out.println("Error");
				}
				stmt.close();
				con.close();
			}
			catch(SQLException se)
			{
				//Handle errors for JDBC
				se.printStackTrace();
			}
			catch(Exception e)
			{
				//Handle errors for Class.forName
				e.printStackTrace();
			}
			finally
			{
				//finally block used to close resources
				try
				{
					if(stmt!=null)
					stmt.close();
				}
				catch(SQLException se2)
				{
				} // nothing we can do
			} //end try
		%>
	</body>
</html>