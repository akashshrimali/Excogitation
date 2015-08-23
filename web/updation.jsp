<%@page import="java.sql.*"%>
<%
String id=(String)session.getAttribute("id");
String firstname=request.getParameter("text2");
String lastname=request.getParameter("text3");
String gender=request.getParameter("text4");
String address=request.getParameter("text5");
String mobile_number=request.getParameter("text6");
String dob=request.getParameter("text7");
String email=request.getParameter("text8");
String username=request.getParameter("text9");
String password=request.getParameter("text10");
String regdate=request.getParameter("text11");
try
{
    String stat="yes";
   int i=Integer.parseInt(id);
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st1=con1.createStatement();
    ResultSet rs=st1.executeQuery("select * from tb1_registration");
    while(rs.next())
    {
     String str=rs.getString("status");
     int x=rs.getInt("OP_ID");
    System.out.println(str);
    System.out.println(x);
     if(str.equalsIgnoreCase(stat)&&i==x)
     {
       String query="update tb1_registration set first_name='"+firstname+"',last_name='"+lastname+"',gender='"+gender+"',address='"+address+"',mobile_number='"+mobile_number+"',dob='"+dob+"',email='"+email+"',username='"+username+"',password='"+password+"',op_id="+i+",regdate='"+regdate+"',status='"+stat+"' where OP_ID="+i+" and status='"+stat+"'";
       st1.executeUpdate(query);
     }
    }
  
    con1.close();
    response.sendRedirect("op_details.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}

 
%>