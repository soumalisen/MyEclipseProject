<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String msg = "WelcomeToJSP";
pageContext.setAttribute("msg", msg);
%>
<h3>JSTL Function Tags Example</h3>
<p>Length: ${fn:length(msg)}</p>
<p>Contains 'JSP': ${fn:contains(msg, "JSP")}</p>
<p>To Upper Case: ${fn:toUpperCase(msg)}</p>
<p>Substring: ${fn:substring(msg, 0, 7)}</p>
