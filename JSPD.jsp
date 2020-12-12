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
		
		
		
		if(request.getParameter("btn_add")!=null)
		{
			String nname = request.getParameter("Name");
			String nemail = request.getParameter("Email");
			String ndob = request.getParameter("DOB");
			String ng = request.getParameter("Gender");
			String nadd = request.getParameter("Address");
			String ncode = request.getParameter("ZipCode");
			String ngrad = request.getParameter("Graduation");
			String ncol = request.getParameter("College");
			String npo = request.getParameter("PassOut");
			String ncgpa = request.getParameter("CGPA");
			String nex = request.getParameter("TotEx");
			String nskills = request.getParameter("Skills");
			
			PreparedStatement preparedStatement = null;
			String query = "INSERT INTO pdn(Name, email, dob, gender, address, zip, Graduation, College, PassOut, CGPA, Experience, Skills) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
			preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, nname);
			preparedStatement.setString(2, nemail);
			preparedStatement.setString(3, ndob);
			preparedStatement.setString(4, ng);
			preparedStatement.setString(5, nadd);
			preparedStatement.setString(6, ncode);
			preparedStatement.setString(7, ngrad);
			preparedStatement.setString(8, ncol);
			preparedStatement.setString(9, npo);
			preparedStatement.setString(10, ncgpa);
			preparedStatement.setString(11, nex);
			preparedStatement.setString(12, nskills);
			preparedStatement.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("JSWelcome.html");
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