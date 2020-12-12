<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>

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
		
		if(request.getParameter("btn_update")!=null)
		{
			int hide;
			
			String statn;
			
			hide=Integer.parseInt(request.getParameter("id"));
			statn=request.getParameter("Status");
			
			PreparedStatement ps = null;
			
			ps = con.prepareStatement("Update applicant set status=? where id=?");
			ps.setString(1, statn);
			ps.setInt(2, hide);
			ps.executeUpdate();
			
			RequestDispatcher rd=request.getRequestDispatcher("ViewApplicants.jsp");
				rd.forward(request, response);
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