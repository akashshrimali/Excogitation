<%@page import="java.sql.*;"%>
<%@page import="javax.swing.*;" %>
<%@ page import="java.text.*, java.util.Date" %>
<%

int c=0,b=0;
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st=con.createStatement();
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

 try
{
 ResultSet rs=st.executeQuery("select * from tb8_admin");
 while(rs.next())
{
     String uname=rs.getString("username");
     String password=rs.getString("password");
  
     if(uname.equalsIgnoreCase(user)&&password.equalsIgnoreCase(pass))
     {
        b=1;
         
     }
}
}
catch(Exception ex)
{
ex.printStackTrace();
}

 try
{
 ResultSet rs=st.executeQuery("select * from tb1_registration");
 while(rs.next())
{
     String firstname=rs.getString("first_name");
     String lastname=rs.getString("last_name");
  
     
     String str=rs.getString("username");
     String str1=rs.getString("password");
     String stat=rs.getString("status");
     if(str.equalsIgnoreCase(user)&&str1.equalsIgnoreCase(pass)&&stat.equalsIgnoreCase("yes"))
     {
       session.setAttribute("firstname",firstname);
       session.setAttribute("lastname",lastname);
        c=1;
         
     }
}
}
catch(Exception ex)
{
ex.printStackTrace();
}
String role=null;
if(c==1)
{
 role=user;
response.sendRedirect("operator_home.jsp");
}
else if(b==1)
{    
    String dat = DateFormat.getInstance().format(new Date());
    role="admin";
  int y=st.executeUpdate("insert into tb9_logtime values('"+role+"','"+dat+"')");
       
response.sendRedirect("admin_home.jsp");

}
else
{
response.sendRedirect("index.html");

}





%>

<html>
    <body>
        <font color="red">
        </font>
  
</html>
  <div id="apDiv3">
   