<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*;import javax.swing.JDialog" %>
<%@page import="java.math.*;import javax.swing.JOptionPane" %>
<%@ page import="java.text.*, java.util.Date" %>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
    response.setContentType("text/html;charset=UTF-8");

    String floorname=request.getParameter("floorname");
    String floortype=request.getParameter("floortype");
    String slot=request.getParameter("slots");

try
{ 
        
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st=con.createStatement();
     ResultSet rs1=st.executeQuery("select * from tb4_floor");
     
    int x=0;
    while(rs1.next())
     {
         x=rs1.getInt("FL_ID");
          
     }
    int id=x+1;       
        PreparedStatement pre = con.prepareStatement("insert into tb4_floor(fl_id,floor_name,vehicle_type,slots) values(?,?,?,?)");
      
        pre.setInt(1,id);
          pre.setString(2,floorname);
            pre.setString(3,floortype);
              pre.setString(4,slot);
	pre.executeUpdate();
	pre.close();
        con.close();
        response.sendRedirect("fl_customize.jsp");


           
    

}
catch(Exception ex)
{
    ex.printStackTrace();
}

%>



