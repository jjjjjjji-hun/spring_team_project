<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container">
	<h1>게시글 목록</h1>
	<table border="1" class="table table">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>글 제목</th>
				<th>글 본문</th>
				<th>글쓴이</th>
				<th>글쓴 날짜</th>
				<th>글 수정 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td>${board.bno}</td>
					<td><a href="/board/list/${board.bno}?pageNum=${pageMaker.cri.pageNum}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${board.title}</a>[${board.replyCount}]</td>
					<td>${board.content}</td>
					<td>${board.u_id}</td>
					<td>${board.regdate}</td>
					<td>${board.updatedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/board/insert" class="btn btn-success">글쓰기</a><br/>
	</div>
 
</body>
</html>