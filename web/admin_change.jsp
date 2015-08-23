<%@page import="java.sql.*"%>
<%

String pass1=request.getParameter("pass1");
try
{
 
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();
    ResultSet rs=st1.executeQuery("select * from tb8_admin");
    while(rs.next())
    {

       String query="update tb8_admin set password='"+pass1+"'";
       st1.executeUpdate(query);
     
    }
    con1.close();
    response.sendRedirect("admin_home_1.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}

 
%>