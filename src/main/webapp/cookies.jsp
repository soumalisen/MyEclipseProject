<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Cookies</title>
</head>
<body>
<h2>List All Cookies Example</h2>

<form method="post">
    <input type="submit" value="List Cookies">
</form>

<hr>

<%
    // When the form is submitted, request method becomes POST
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        javax.servlet.http.Cookie[] cookies = request.getCookies();

        if (cookies != null && cookies.length > 0) {
            out.println("<h3>Cookies found in your browser:</h3>");
            for (javax.servlet.http.Cookie c : cookies) {
                out.println("Name: <b>" + c.getName() + "</b> | Value: <b>" + c.getValue() + "</b><br>");
            }
        } else {
            out.println("<p>No cookies found in your browser!</p>");
        }
    } else {
        out.println("<p>Click the button above to list cookies.</p>");
    }
%>
</body>
</html>
