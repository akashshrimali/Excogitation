<%@page import="java.sql.*;import javax.swing.JDialog" %>
<%@page import="java.math.*;import javax.swing.JOptionPane" %>
<%@ page import="java.text.*, java.util.Date" %>
<%
    
    String receiver=request.getParameter("name");
    String message=request.getParameter("compose");
    String dat = DateFormat.getInstance().format(new Date());
    String sender="admin";
    int i=0;
try
{
    System.out.println("Reached here");
    int c=0;
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st=con.createStatement();
       int y=st.executeUpdate("insert into tb2_messages values('"+sender+"','"+receiver+"','"+message+"','"+dat+"')");
        response.sendRedirect("adm_sent.jsp");

}
catch(Exception ex)
{
    ex.printStackTrace();
}



%>



