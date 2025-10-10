<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
String email = request.getParameter("email");
if(email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")){
    out.println("<h3 style='color:green'>Valid Email ID</h3>");
} else {
    out.println("<h3 style='color:red'>Invalid Email ID</h3>");
}
%>


</body>
</html>