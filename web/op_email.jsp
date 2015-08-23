<%@page import="java.sql.*"%>
<%
String abc=(String)session.getAttribute("abc");

try
{
   String str=null,str1=null,str2=null,str3=null;
   String stat="yes";
   int y=0;
   int i=Integer.parseInt(abc);
  
   Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();
    ResultSet rs=st1.executeQuery("select * from tb1_registration");
    while(rs.next())
    {
        y=rs.getInt("OP_ID");
        str3=rs.getString("status");
        if(str3.equalsIgnoreCase(stat)&&y==i)
       {
        str1=rs.getString("username");
        session.setAttribute("username", str1);
        str2=rs.getString("password");
        session.setAttribute("password", str2);
        str=rs.getString("email");
        session.setAttribute("email", str);
        str3=rs.getString("status");
        response.sendRedirect("op_email1.jsp");
       }

    }
    con1.close();
    
}
catch(Exception ex)
{
ex.printStackTrace();
}

%>