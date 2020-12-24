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
		
		
		
		if(request.getParameter("btn_add")!=null)
		{
			String jp = request.getParameter("Jobpost");
			String loc = request.getParameter("Location");
			String lan = request.getParameter("Language");
			String sal = request.getParameter("Salary");
			String stat = request.getParameter("Status");
			
			PreparedStatement preparedStatement = null;
			String query = "INSERT INTO job(jobpost, location, language, salary, status) VALUES(?, ?, ?, ?, ?)"; 
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, jp);
			preparedStatement.setString(2, loc);
			preparedStatement.setString(3, lan);
			preparedStatement.setString(4, sal);
			preparedStatement.setString(5, stat);
			preparedStatement.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("EmpWelcome.html");
				rd.forward(request, response);
		
		stmt.close();
		con.close();
	}
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