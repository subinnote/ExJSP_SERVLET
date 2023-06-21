<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>패턴을 지정하여 숫자를 활용</h4>
<c:set var="num1" value="12345.0111"/>

<fmt:formatNumber value="${num1 }"/><br>
<fmt:formatNumber value="${num1 }" pattern="0,00.0"/><br>
<fmt:formatNumber value="${num1 }" pattern="0,000,00.0"/><br>
<fmt:formatNumber value="${num1 }" pattern="#,###.##"/><br>
<fmt:formatNumber value="${num1 }" pattern="###,###.0000000"/><br>

<fmt:parseNumber value="${num1 }" integerOnly="true" var="saveVar"/><br>
정수 부분만 : ${saveVar }

<h4>날짜 포맷</h4>
<c:set var="today" value="<%=new Date() %>"/>
오늘 날짜 : ${today }
</body>
</html>