

<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*" %>
<%
String host = "smtp.gmail.com";
String user = "pt0981116@apiit.edu.in";
String pass = "WHYTHEFUCK@GMAIL.COM";
String username=(String)session.getAttribute("username");
String password=(String)session.getAttribute("password");
String email=(String)session.getAttribute("email");
String to = email;
String from = "pt0981116@apiit.edu.in";
String subject = "Registration Details";
String messageText = "Details: Your UserName is"+username+"Your Password is"+password;
boolean sessionDebug = true;

Properties props = System.getProperties();
props.put("mail.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", 587);
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.socketFactory.port", "587");
props.put("mail.smtp.socketFactory.fallback", "false");
// Uncomment these 3 lines below and comment out 2 lines above if you prefer to use SSL
// props.put("mail.smtps.auth", "true");
// props.put("mail.smtps.port", "465");
//props.put("mail.smtps.ssl.trust", host);
Session mailSession = Session.getDefaultInstance(props, null);
mailSession.setDebug(sessionDebug);
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, user, pass);
transport.sendMessage(msg, msg.getAllRecipients());
transport.close();
response.sendRedirect("op_details.jsp");
%>