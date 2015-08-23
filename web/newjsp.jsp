<%@ page contentType="text/html; charset=iso-8859-1" language="java"  %>
<%
  String ipAddress=request.getRemoteAddr();
    //out.println("HELLO");
  //response.wait(10);

%>
<html>
<head>
<title>IP Address of remote client machine in JSP</title>
</head>

<body>
IP Address of Client <%=ipAddress%>
</body>
</html>