<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>

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
		
		if(request.getParameter("btn_update")!=null)
		{
			int hide;
			
			String namen, emn, dobn, gn, addn, zipn, gradn, coln, pon, cgpan, expn, skilln;
			
			hide=Integer.parseInt(request.getParameter("id"));
			namen=request.getParameter("Name");
			emn=request.getParameter("Email");
			dobn=request.getParameter("DOB");
			gn=request.getParameter("Gender");
			addn=request.getParameter("Address");
			zipn=request.getParameter("Zip");
			gradn=request.getParameter("Graduation");
			coln=request.getParameter("College");
			pon=request.getParameter("PassOut");
			cgpan=request.getParameter("CGPA");
			expn=request.getParameter("Experience");
			skilln=request.getParameter("Skills");
			
			PreparedStatement ps = null;
			
			ps = con.prepareStatement("Update pdn set Name=?, email=?, dob=?, gender=?, address=?, zip=?, Graduation=?, College=?, PassOut=?, CGPA=?, Experience=?, Skills=? where id=?");
			ps.setString(1, namen);
			ps.setString(2, emn);
			ps.setString(3, dobn);
			ps.setString(4, gn);
			ps.setString(5, addn);
			ps.setString(6, zipn);
			ps.setString(7, gradn);
			ps.setString(8, coln);
			ps.setString(9, pon);
			ps.setString(10, cgpan);
			ps.setString(11, expn);
			ps.setString(12, skilln);
			ps.setInt(13, hide);
			ps.executeUpdate();
			
			RequestDispatcher rd=request.getRequestDispatcher("JSView.jsp");
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