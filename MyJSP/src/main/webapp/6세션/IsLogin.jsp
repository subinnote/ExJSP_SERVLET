<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("UserId") == null){
%>
	<script>
		alert("로그인 후 이용 가능한 메뉴 입니다.");
		location.href = "/helloServlet/6세션/LoginForm.jsp";
	</script>
<%
	return;
}
%>
</body>
</html>