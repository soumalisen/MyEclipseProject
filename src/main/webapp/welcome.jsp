<%@ page import="java.util.*" %>
<%
String name = request.getParameter("uname");
session.setAttribute("user", name);
Date start = new Date();
session.setAttribute("startTime", start);
%>
<h2>Hello <%=name%></h2>
<p>Login Time: <%=start%></p>
<a href="logout.jsp">Logout</a>
