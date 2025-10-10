<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        h2 {
            color: red;
        }
    </style>
</head>
<body>
    <h2>⚠️ An Exception Occurred!</h2>
    <p><b>Exception Type:</b> <%= exception.getClass().getName() %></p>
    <p><b>Message:</b> <%= (exception.getMessage() != null) ? exception.getMessage() : "No message available" %></p>
</body>
</html>
