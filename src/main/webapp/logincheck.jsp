<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Login Validation</title>
</head>
<body>
<%
    String user = request.getParameter("uname");
    String pass = request.getParameter("pass");

    
    String url = "jdbc:mysql://localhost:3306/jsp_lab";
    String dbUser = "root";       
    String dbPass = "";           

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, dbUser, dbPass);

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM users WHERE username=? AND password=?"
        );
        ps.setString(1, user);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            out.println("<h3 style='color:green'>Login Successful!</h3>");
            out.println("<h4>Welcome, " + user + "</h4>");
        } else {
            out.println("<h3 style='color:red'>Login Failed! Invalid username or password.</h3>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
    }
%>
</body>
</html>
