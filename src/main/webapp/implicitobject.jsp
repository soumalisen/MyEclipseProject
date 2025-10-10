<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="errorpage.jsp" %>
<html>
<head>
    <title>JSP Implicit Objects Example</title>
</head>
<body style="font-family: Arial; margin: 40px;">

<h2>Demonstration of JSP Implicit Objects</h2>
<hr>

<%
    
    String clientIP = request.getRemoteAddr();
    String method = request.getMethod();

    response.setContentType("text/html");

    session.setAttribute("username", "John");

    application.setAttribute("college", "ABC College");

    String servletName = config.getServletName();

    String sessId = pageContext.getSession().getId();

    String pageName = page.getClass().getName();
%>

<h3>1️⃣ request Object:</h3>
<p>Client IP Address: <b><%= clientIP %></b></p>
<p>Request Method: <b><%= method %></b></p>

<h3>2️⃣ response Object:</h3>
<p>Response Content Type: <b><%= response.getContentType() %></b></p>

<h3>3️⃣ session Object:</h3>
<p>Session Attribute (username): <b><%= session.getAttribute("username") %></b></p>

<h3>4️⃣ application Object:</h3>
<p>Application Attribute (college): <b><%= application.getAttribute("college") %></b></p>

<h3>5️⃣ config Object:</h3>
<p>Servlet Name: <b><%= servletName %></b></p>

<h3>6️⃣ pageContext Object:</h3>
<p>Session ID from pageContext: <b><%= sessId %></b></p>

<h3>7️⃣ page Object:</h3>
<p>Page Class Name: <b><%= pageName %></b></p>

<h3>8️⃣ exception Object:</h3>
<p>To see this in action, cause an error → <a href="errorExample.jsp">Click Here</a></p>

</body>
</html>
