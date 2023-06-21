<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>

<%
	// 검색조건
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 페이지 번호
	int pageNo = request.getParameter("pageNo")==null
			? 1 : Integer.parseInt(request.getParameter("pageNo"));

	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	
	NewBoardDao dao = new NewBoardDao();
	//List<Board> list = dao.getList(criteria);
	
	List<Board> list = dao.getListPage(criteria);
	int totalCnt = dao.getTotlaCnt(criteria);
	
	out.print("총건수 : " + totalCnt);
	
%>

<body>
<!-- 
/ : 절대경로
../ : 상위폴더
 -->
<%@include file="/6세션/Link.jsp" %>
	<h1>new</h1>
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get" name="searchForm">
    <input type="text" name="pageNo" value="<%=criteria.getPageNo()%>">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        
        
        
        
        <!-- 목록의 내용 --> 
	<c:set var="list" value="<%=list %>"/>
	<c:if test="${empty list }" var="res">
		<tr>
			<td colspan="5" align="center">게시물이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${not res }">
		<c:forEach items="${list }" var="board">
			<tr align="center">
	            <td>${board.num}</td>  <!--게시물 번호-->
	            <td align="left">  <!--제목(+ 하이퍼링크)-->
	                <a href="View.jsp?num=${board.num}&pageNo=<%=criteria.getPageNo()%>">${board.title }</a> 
	            </td>
	            <td align="center">${board.id }</td>          <!--작성자 아이디-->
	            <td align="center">${board.visitcount }</td>  <!--조회수-->
	            <td align="center">${board.postdate}</td>    <!--작성일-->
	        </tr>
		</c:forEach>
	</c:if>
	
	<tr>
			<td colspan="5" align="center">===================</td>
	</tr>
	
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    
    <c:if test="${not empty sessionScope.UserId}">
	    <table border="1" width="90%">
	        <tr align="right">
	            <td><button type="button" 
	            		onclick="location.href='Write.jsp'">글쓰기</button></td>
	        </tr>
	    </table>
    </c:if>
    
    <!-- 
    페이지블럭 생성 시작
	    - 총 건수 조회
	    - 쿼리수정
	    - form의 이름을 searchForm으로 지정
	    - pageNo 필드를 생성
    -->
	<%
		PageDto pageDto = new PageDto(totalCnt, criteria);
	%>
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<%@include file="/9페이지/PageNavi.jsp" %>
			</td>
		</tr>
	</table>
	<!-- 페이지블럭 생성 끝-->
	
</body>
</html>














