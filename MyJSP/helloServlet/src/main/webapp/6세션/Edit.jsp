<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String num = request.getParameter("num");
	BoardDao dao = new BoardDao();
	// 1건의 게시물을 조회
	Board board = dao.selectOne(num);
	
%>
</head>
<body>
<jsp:include page="Link.jsp"></jsp:include>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form action="EditProcess.jsp" method="post">
<input type=text value='<%=board.getNum() %>' name='num'>
	<table border='1' width='90%'>
		<tr>
			<td>번호</td>
			<td><%=board.getNum() %></td>  
			<td>작성자</td>
			<td><%=board.getId() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=board.getPostdate() %></td>
			<td>조회수</td>
			<td><%=board.getVisitcount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan='3'><input type="text" value='<%=board.getTitle() %>' name="title" style="width:90%"></td>		
		</tr>
		<tr>
			<td>내용</td>
			<td colspan='3'><textarea name="content" style="width:90%; height:100px"><%=board.getContent() %></textarea></td>
		</tr>
		<tr>
			<td colspan='4' align="center">
			<button type="submit">수정하기</button>
			<button type="reset">초기화</button>
			<button type="button" onclick="location.href='Board.jsp'">목록보기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>