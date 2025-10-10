<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Email Validation</title>
</head>
<body>
    <h2>Check if Email is Valid</h2>

    <form method="post">
        Enter Email ID: 
        <input type="text" name="email" required>
        <input type="submit" value="Check">
    </form>
    <hr>

<%
   
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");

        
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";

        if (email.matches(emailRegex)) {
%>
            <h3 style="color:green">✅ <%= email %> is a Valid Email ID</h3>
<%
        } else {
%>
            <h3 style="color:red">❌ <%= email %> is an Invalid Email ID</h3>
<%
        }
    } else {
%>
        <p>Enter an email and click “Check” to validate.</p>
<%
    }
%>
</body>
</html>
