<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Mark List</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        table { width: 400px; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .error { color: red; font-weight: bold; }
    </style>
</head>
<body>

    <h1>Student Mark List</h1>

    <%
        // a) Read the parameter value (Register Number)
        String regNumber = request.getParameter("regno");
        
        // Input validation
        if (regNumber == null || regNumber.trim().isEmpty()) {
    %>
            <p class="error">Error: Register Number is required. Please go back and enter a value.</p>
    <%
            return; // Stop further execution
        }

        // JDBC Variables
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // Database connection details (CHANGE THESE TO MATCH YOUR DB)
        String dbUrl = "jdbc:mysql://localhost:3306/your_database_name";
        String dbUser = "your_db_username";
        String dbPass = "your_db_password";
        String dbDriver = "com.mysql.cj.jdbc.Driver"; // Use "oracle.jdbc.driver.OracleDriver" for Oracle, etc.
        
        boolean found = false;

        try {
            // Load the driver
            Class.forName(dbDriver);
            
            // Get the connection
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
            
            // b) Server retrieves the details from the database table
            String sql = "SELECT StudentName, Subject1, Subject2, Subject3 FROM StudentMarks WHERE RegisterNumber = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, regNumber); // Set the RegisterNumber parameter
            
            rs = ps.executeQuery();
            
            // c) Server displays the mark list to the client
            if (rs.next()) {
                found = true;
                String studentName = rs.getString("StudentName");
                int sub1 = rs.getInt("Subject1");
                int sub2 = rs.getInt("Subject2");
                int sub3 = rs.getInt("Subject3");
                int total = sub1 + sub2 + sub3;
    %>
                <h2>Details for Reg. No: <%= regNumber %></h2>
                <p><strong>Student Name:</strong> <%= studentName %></p>
                
                <table>
                    <tr>
                        <th>Subject</th>
                        <th>Marks</th>
                    </tr>
                    <tr>
                        <td>Subject 1</td>
                        <td><%= sub1 %></td>
                    </tr>
                    <tr>
                        <td>Subject 2</td>
                        <td><%= sub2 %></td>
                    </tr>
                    <tr>
                        <td>Subject 3</td>
                        <td><%= sub3 %></td>
                    </tr>
                    <tr>
                        <th>Total Marks</th>
                        <th><%= total %></th>
                    </tr>
                </table>
    <%
            }
            
            if (!found) {
    %>
                <p class="error">No student found with Register Number: **<%= regNumber %>**</p>
    <%
            }

        } catch (ClassNotFoundException e) {
    %>
            <p class="error">JDBC Driver not found: <%= e.getMessage() %></p>
    <%
        } catch (SQLException e) {
    %>
            <p class="error">Database Error: <%= e.getMessage() %></p>
    <%
        } finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
            try { if (conn != null) conn.close(); } catch (SQLException e) { /* ignored */ }
        }
    %>

    <p style="margin-top: 30px;"><a href="stud.html">Search another student</a></p>

</body>
</html>