package xyz;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class addphoto extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // Apache Commons-Fileupload library classes
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload sfu  = new ServletFileUpload(factory);

            if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }

            // parse request
            List items = sfu.parseRequest(request);
            FileItem  name1 = (FileItem) items.get(0);
            String firstname =  name1.getString();
            
            FileItem name2 = (FileItem) items.get(1);
            String lastname =  name2.getString();
            
            FileItem name3 = (FileItem) items.get(2);
            String gender =  name3.getString();
          
            FileItem name5 = (FileItem) items.get(3);
            String address=  name5.getString();
            
            FileItem name6 = (FileItem) items.get(4);
            String dob=  name6.getString();
                       
            FileItem name9 = (FileItem) items.get(5);
            String mobile=  name9.getString();
            
            // get uploaded file
            FileItem file = (FileItem) items.get(6);
                        
            FileItem name10 = (FileItem) items.get(7);
            String country=  name10.getString();
            
            FileItem name11 = (FileItem) items.get(8);
            String email=  name11.getString();
            
            FileItem name12 = (FileItem) items.get(9);
            String pincode=  name12.getString();
            
            FileItem name13 = (FileItem) items.get(10);
            String username=  name13.getString();
            
            FileItem name14 = (FileItem) items.get(11);
            String password=  name14.getString();
            
                String dat = DateFormat.getInstance().format(new Date());

             String status="yes";
            // Connect to Oracle
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
        System.out.println("reached");       
        int id=x;
        System.out.println(id);
        PreparedStatement pre = con.prepareStatement("insert into tb1_registration (FIRST_NAME,LAST_NAME,GENDER,ADDRESS,MOBILE_NUMBER,DOB,EMAIL,USERNAME,PASSWORD,OP_ID,REGDATE,STATUS,IMG,COUNTRY,PINCODE) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	System.out.println(firstname);
        System.out.println(lastname);
        System.out.println(gender);
        System.out.println(address);
        System.out.println(mobile);

      

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
        pre.setBinaryStream(13, file.getInputStream(), (int) file.getSize());
        pre.setString(14,country);
        pre.setString(15,pincode);
	pre.executeUpdate();
	pre.close();
        con.close();
        response.sendRedirect("op_details.jsp");
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    } 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request,response);
    }
}