<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*;import javax.swing.JDialog" %>
<%@page import="java.math.*;import javax.swing.JOptionPane" %>
<%@ page import="java.text.*, java.util.Date" %>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%
    response.setContentType("text/html;charset=UTF-8");
    String l1=request.getParameter("user_file");
    String firstname=request.getParameter("firstname");
    String lastname=request.getParameter("lastname");
    String gender=request.getParameter("gender");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String address=request.getParameter("address");
    String dob=request.getParameter("dob");
    String username=request.getParameter("username");
    String country=request.getParameter("select4");
    String pincode=request.getParameter("pincode");
    String dat = DateFormat.getInstance().format(new Date());
    String password=request.getParameter("password");
    System.out.println(dob);
try
{ 
        
	File imgfile = new File(l1);
	FileInputStream fin = new FileInputStream(imgfile);
	 
	
    int c=0;
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","fyp","fyp");
    Statement st=con.createStatement();
     ResultSet rs1=st.executeQuery("select * from tb1_registration");
     
    int x=0;
    while(rs1.next())
     {
       
       String stat=rs1.getString("status");
       if(stat.equalsIgnoreCase("yes"))
     {

         x=x+1;
           
     }
     }
        String status="yes";
        int id=x+2;
        
        PreparedStatement pre = con.prepareStatement("insert into tb1_registration (FIRST_NAME,LAST_NAME,GENDER,ADDRESS,MOBILE_NUMBER,DOB,EMAIL,USERNAME,PASSWORD,OP_ID,REGDATE,STATUS,IMG,COUNTRY,PINCODE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        pre.setString(1,firstname);
        pre.setString(2,lastname);
        pre.setString(3,gender);
        pre.setString(4,address);
        pre.setString(5,mobile);
        pre.setString(6,dob);
        pre.setString(7,email);
        pre.setString(8,username);
        pre.setString(9,password);
        pre.setInt(10,id);
        pre.setString(11,dat);
        pre.setString(12,status);     
        pre.setBinaryStream(13,fin,(int)imgfile.length());
        pre.setString(14,country);
        pre.setString(15,pincode);
	pre.executeUpdate();
	pre.close();
        con.close();
        response.sendRedirect("op_details.jsp");


           
    

}
catch(Exception ex)
{
    ex.printStackTrace();
}

%>



