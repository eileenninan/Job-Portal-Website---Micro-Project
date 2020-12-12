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
					String jp, loc, lan, sal,stat;
			
					PreparedStatement ps=null;
			
					ps=con.prepareStatement("select * from job where id=?");
					ps.setInt(1,id);
					ResultSet rs=ps.executeQuery();
			
					while(rs.next())
					{
						id=rs.getInt(1);
						jp=rs.getString(2);
						loc=rs.getString(3);
						lan=rs.getString(4);
						sal=rs.getString(5);
						stat=rs.getString(6);
		%>
						<div class="login-box">
							<form method="post" action="EmpUpdate.jsp">
								<div class="user-box">
									<input type="text" name="Jobpost" value="<%=jp %>">
									<label>Job Post</label>
								</div>
								<div class="user-box">
									<input type="text" name="Location" value="<%=loc %>">
									<label>Location</label>
								</div>
								<div class="user-box">
									<input type="text" name="Language" value="<%=lan %>">
									<label>Program Language</label>
								</div>
								<div class="user-box">
									<input type="number" name="Salary" value="<%=sal %>">
									<label>Salary</label>
								</div>
								<div class="user-box">
									<input type="text" name="Status" value="<%=stat %>">
									<label>Status (Active/Inactive)</label>
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