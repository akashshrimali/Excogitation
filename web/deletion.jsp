<%@page import="java.sql.*"%>
<%
String abc=request.getParameter("name");
session.setAttribute("abc",abc);
String blabel=request.getParameter("blabel");
if(blabel.equalsIgnoreCase("Delete Record"))
try
{
    String stat="NO";
   int i=Integer.parseInt(abc);
  Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();
    String query="update tb1_registration set STATUS='"+stat+"' where OP_ID="+i+"";
    st1.executeUpdate(query);
    con1.close();
    response.sendRedirect("op_details.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}
else if(blabel.equalsIgnoreCase("Update Record"))
{
    response.sendRedirect("op_update.jsp");
    
}
else if(blabel.equalsIgnoreCase("EMAIL DETAILS"))
{
    response.sendRedirect("op_email.jsp");

}
%>