<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
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
	String num = request.getParameter("num");
	out.print(num);
	BoardDao dao = new BoardDao();
	int res = dao.delete(num);
	
	if(res > 0){
		// 성공 : 메세지 출력 리스트로 이동
		JSFunction.alertLocation("게시글이 삭제되었습니다.", "Board.jsp", out);
	} else {
		// 실패 : 메세지 출력
		JSFunction.alertBack("게시글 삭제에 실패하였습니다.", out);
	}
%>
</body>
</html>