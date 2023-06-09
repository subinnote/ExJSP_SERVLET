<%@page import="util.CookieManager"%>
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
    String saveCheck = request.getParameter("saveCheck");
	
    
    // 체크박스가 체크되었을 경우, 아이디를 쿠키에 저장합니다.
    if(saveCheck != null && saveCheck.equals("Y")){
  	  // CookieManager를 이용하여 쿠키를 생성 후 응답객체에 담아줍니다.
  	  CookieManager.makeCookie(response, "userId", id, 3600);
  	}
    
	if("abc".equalsIgnoreCase(id)
			&& "123".equals(pw)){
		// 로그인 성공
		// 세션영역에 id 저장
		session.setAttribute("id", id);
		
		// response.sendRedirect("gogreen.jsp?name="+id);
		response.sendRedirect("gogreen.jsp");
	} else {
		// 로그인 실패
		response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>