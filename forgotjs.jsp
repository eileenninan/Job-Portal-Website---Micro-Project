<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Forgot Password</title>
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
			
				String uname= request.getParameter("Username");
				
					
					String name, pass;
			
					PreparedStatement ps=null;
			
					ps=con.prepareStatement("select * from user where Username=?");
					ps.setString(1,uname);
					ResultSet rs=ps.executeQuery();
			
					while(rs.next())
					{
						name=rs.getString(1);
						pass=rs.getString(2);
		%>
						<center><br><br><h2>Your Password is <%=pass %></h2></center>

		<%
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