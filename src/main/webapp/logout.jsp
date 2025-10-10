<%@ page import="java.util.*" %>
<%
String name = (String) session.getAttribute("user");
Date start = (Date) session.getAttribute("startTime");
Date end = new Date();
long duration = (end.getTime() - start.getTime()) / 1000;
session.invalidate();
%>
<h3>Thank you <%=name%>! You used this site for <%=duration%> seconds.</h3>
