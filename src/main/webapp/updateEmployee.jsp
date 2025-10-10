<%@ page import="java.sql.*" %>
<%
    int empid = Integer.parseInt(request.getParameter("empid"));
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String desg = request.getParameter("desg");
    double salary = Double.parseDouble(request.getParameter("salary"));

    String url = "jdbc:mysql://localhost:3306/company";
    String username = "root"; // replace with your DB username
    String password = "";     // replace with your DB password
    String message = "";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String sql = "UPDATE employee SET name=?, age=?, desg=?, salary=? WHERE empid=?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, desg);
        ps.setDouble(4, salary);
        ps.setInt(5, empid);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            message = "Updating Success";
        } else {
            message = "Updating Error: Employee ID not found";
        }
    } catch (Exception e) {
        message = "Updating Error: " + e.getMessage();
    } finally {
        try { if (ps != null) ps.close(); } catch(Exception e) {}
        try { if (conn != null) conn.close(); } catch(Exception e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Result</title>
</head>
<body>
    <h2><%= message %></h2>
    <a href="updateEmployee.html">Go Back</a>
</body>
</html>
