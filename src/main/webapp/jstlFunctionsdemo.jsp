<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSTL Functions Demonstration</title>
</head>
<body>

    <h1>JSTL Functions Demo</h1>

    <%-- Setup variables --%>
    <c:set var="text1" value="Hello JSTL Functions" />
    <c:set var="text2" value="functions" />
    <c:set var="text3" value="   Trim Me   " />
    <c:set var="delimiter" value="," />
    <c:set var="array" value="${fn:split('Java,JSP,JSTL,Servlets', delimiter)}" />
    <c:set var="xmlContent" value="<tag>content</tag>" />

    <p><strong>Original Text 1:</strong> ${text1}</p>
    <p><strong>Original Text 2:</strong> ${text2}</p>
    <p><strong>Original Text 3 (with spaces):</strong> '${text3}'</p>
    <p><strong>Original Array:</strong> Java, JSP, JSTL, Servlets</p>

    <hr>

    <h2>String Manipulation Functions</h2>

    <ul>
        <li>
            <strong>length(text1):</strong> ${fn:length(text1)}
        </li>
        <li>
            <strong>toLowerCase(text1):</strong> ${fn:toLowerCase(text1)}
        </li>
        <li>
            <strong>toUpperCase(text1):</strong> ${fn:toUpperCase(text1)}
        </li>
        <li>
            <strong>trim(text3):</strong> '${fn:trim(text3)}'
        </li>
        <li>
            <strong>substring(text1, 6, 10):</strong> ${fn:substring(text1, 6, 10)} (from index 6, up to 10)
        </li>
        <li>
            <strong>replace(text1, 'Hello', 'Welcome'):</strong> ${fn:replace(text1, 'Hello', 'Welcome')}
        </li>
    </ul>

    <hr>

    <h2>Searching and Checking Functions</h2>

    <ul>
        <li>
            <strong>contains(text1, 'JSTL'):</strong> ${fn:contains(text1, 'JSTL')}
        </li>
        <li>
            <strong>containsIgnoreCase(text1, text2):</strong> ${fn:containsIgnoreCase(text1, text2)}
        </li>
        <li>
            <strong>startsWith(text1, 'Hello'):</strong> ${fn:startsWith(text1, 'Hello')}
        </li>
        <li>
            <strong>endsWith(text1, 'tions'):</strong> ${fn:endsWith(text1, 'tions')}
        </li>
        <li>
            <strong>indexOf(text1, 'Functions'):</strong> ${fn:indexOf(text1, 'Functions')}
        </li>
        <li>
            <strong>substringAfter(text1, 'JSTL'):</strong> ${fn:substringAfter(text1, 'JSTL')}
        </li>
        <li>
            <strong>substringBefore(text1, 'Functions'):</strong> ${fn:substringBefore(text1, 'Functions')}
        </li>
    </ul>

    <hr>

    <h2>Array/Collection Functions</h2>

    <ul>
        <li>
            <strong>split('Java,JSP,JSTL,Servlets', ','):</strong>
            <c:forEach var="item" items="${array}">
                [${item}]
            </c:forEach>
        </li>
        <li>
            <strong>join(array, ' | '):</strong> ${fn:join(array, ' | ')}
        </li>
    </ul>

    <hr>

    <h2>Utility Function</h2>

    <ul>
        <li>
            <strong>Original XML Content:</strong> ${xmlContent}
        </li>
        <li>
            <strong>escapeXml(xmlContent):</strong> ${fn:escapeXml(xmlContent)}
        </li>
    </ul>

</body>
</html>