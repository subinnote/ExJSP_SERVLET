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
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	
	out.print("id : " + id + "<br>");
	out.print("pw : " + pw + "<br>");
	
	// 아이디가 abc, 비밀번호가 123
	if("abc".equals(id) && "123".equals(pw)){
		// 로그인 성공
		//세션에 id 저장
		session.setAttribute("id", id);
		
		
		// 요청할 페이지 정보
		response.sendRedirect("gogreen.jsp?name="+ id);
		//response.sendRedirect("gogreen.jsp");
	} else {
		// 로그인 실패
		out.print("로그인 실패");
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
	
			
%>
</body>
</html>