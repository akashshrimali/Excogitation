<%@page import="java.sql.*"%>
<%
String id=(String)session.getAttribute("id");
String floorname=request.getParameter("text3");
String floortype=request.getParameter("text4");
String slot=request.getParameter("text5");
try
{

   int i=Integer.parseInt(id);
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();
    ResultSet rs=st1.executeQuery("select * from tb4_floor");
    while(rs.next())
    {
     int x=rs.getInt("FL_ID");

     if(i==x)
     {
       String query="update tb4_floor set fl_id="+i+",floor_name='"+floorname+"',vehicle_type='"+floortype+"',slots='"+slot+"'  where FL_ID="+i+" ";
       st1.executeUpdate(query);
     }
    }
  
    con1.close();
    response.sendRedirect("fl_customize.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}

 
%>