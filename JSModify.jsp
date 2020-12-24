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
			String DB_URL="jdbc:mysql://localhost/jobseeker";
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
					String name, em, dob, g, add, zip, grad, col, po, cgpa, exp, skill;
			
					PreparedStatement ps=null;
			
					ps=con.prepareStatement("select * from pdn where id=?");
					ps.setInt(1,id);
					ResultSet rs=ps.executeQuery();
			
					while(rs.next())
					{
						id=rs.getInt(1);
						name=rs.getString(2);
						em=rs.getString(3);
						dob=rs.getString(4);
						g=rs.getString(5);
						add=rs.getString(6);
						zip=rs.getString(7);
						grad=rs.getString(8);
						col=rs.getString(9);
						po=rs.getString(10);
						cgpa=rs.getString(11);
						exp=rs.getString(12);
						skill=rs.getString(13);
		%>
						<div class="login-box">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<form method="post" action="JSUpdate.jsp">
								<div class="user-box">
									<input type="text" name="Name" value="<%=name %>">
									<label>Name</label>
								</div>
								<div class="user-box">
									<input type="email" name="Email" value="<%=em %>">
									<label>Email</label>
								</div>
								<div class="user-box">
									<input type="date" name="DOB" value="<%=dob %>">
									<label>Date of Birth</label>
								</div>
								<div class="user-box">
									<input type="text" name="Gender" value="<%=g %>">
									<label>Gender</label>
								</div>
								<div class="user-box">
									<input type="text" name="Address" value="<%=add %>">
									<label>Address</label>
								</div>
								<div class="user-box">
									<input type="number" name="Zip" value="<%=zip %>">
									<label>Zip/Postal Code</label>
								</div>
								<div class="user-box">
									<input type="text" name="Graduation" value="<%=grad %>">
									<label>Graduation</label>
								</div>
								<div class="user-box">
									<input type="text" name="College" value="<%=col %>">
									<label>College Name</label>
								</div>
								<div class="user-box">
									<input type="number" name="PassOut" value="<%=po %>">
									<label>Pass Out Year</label>
								</div>
								<div class="user-box">
									<input type="number" name="CGPA" value="<%=cgpa %>">
									<label>CGPA</label>
								</div>
								<div class="user-box">
									<input type="Number" name="Experience" value="<%=exp %>">
									<label>Experience</label>
								</div>
								<div class="user-box">
									<input type="text" name="Skills" value="<%=skill %>">
									<label>Skills</label>
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