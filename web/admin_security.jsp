<%@page import="java.sql.*"%>
<%

String ques=request.getParameter("question");
String ans=request.getParameter("ans");
try
{
 
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();

       String query="update tb8_admin set security='"+ques+"',answer='"+ans+"'";
       st1.executeUpdate(query);
     
    
    con1.close();
    response.sendRedirect("admin_home.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}

 
%>