<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>
<!DOCTYPE html><%
String jbp=request.getParameter("jp");
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

		if(request.getParameter("delete")!=null)
		{
			int id=Integer.parseInt(request.getParameter("delete"));
			
			PreparedStatement ps=null;
			
			ps=con.prepareStatement("delete from job where id=? ");
			ps.setInt(1, id);
			ps.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("EmpWelcome.html");
				rd.forward(request, response);
		}
		stmt.close();
		con.close();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>