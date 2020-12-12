<%@ page import = "java.io.*,java.util.*, javax.servlet.*, javax.servlet.http.*, java.sql.*" %>

<%
		String DB_URL="jdbc:mysql://localhost/jobseeker";
		String USER = "root";
		String PASS = "3009";
		
		int flag=0;
		Statement stmt= null;
		String sql=null;
		try
		{			
			java.sql.Connection con;
			con = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = con.createStatement();
			sql = "SELECT * FROM user";
			ResultSet rs = stmt.executeQuery(sql);
			String uname = request.getParameter("Username");
			String pwd = request.getParameter("Password");
			while(rs.next())
			{
				String name = rs.getString("Username");
				String passwrd = rs.getString("Password");
				if(uname.equals(name) && pwd.equals(passwrd))
				{
					flag=1;
					out.println("Welcome" + uname);
					RequestDispatcher rd=request.getRequestDispatcher("JSWelcome.html");
					rd.forward(request, response);
				}
			}
			if(flag==0)
			{
				out.println("User Does Not Exist.Please Register!");
				RequestDispatcher rd=request.getRequestDispatcher("JSregister.html");  
				rd.include(request, response);
			}
			
			rs.close();
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