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
				if(request.getParameter("JobPost")!=null)
				{
					String jp, name, em, stat;
					
					name=request.getParameter("Name");
					em=request.getParameter("Email");
					jp=request.getParameter("JobPost");
					stat=request.getParameter("Status");
					
			
					PreparedStatement ps=null;
			
					ps=con.prepareStatement("select * from job where jobpost=?");
					ps.setString(1,jp);
					ResultSet rs=ps.executeQuery();
				
					while(rs.next())
					{
						ps=con.prepareStatement("Insert into applicant(Name, email, jobpost, status) values (?, ?, ?, ?)");
						ps.setString(1, name);
						ps.setString(2, em);
						ps.setString(3, jp);
						ps.setString(4, stat);
						ps.executeUpdate();
						RequestDispatcher rd=request.getRequestDispatcher("JSViewOfEmp.jsp");
							rd.forward(request, response);
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