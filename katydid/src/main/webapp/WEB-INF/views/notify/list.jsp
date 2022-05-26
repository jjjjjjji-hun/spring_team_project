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
				<th>글 제목</th>
				<th>글 본문</th>
				<th>쓴 날짜</th>
				<th>수정 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${notifyList }">
				<tr>
					<td><a href="/notify/detail/${list.nno}">${list.title}</a></td>
					<td>${list.content}</td>
					<td>${list.regdate}</td>
					<td>${list.updatedate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<c:if test="hasRole('ROLE_ADMIN')">
		<a href="/notify/insert" class="hover">글쓰기</a>
	</c:if>
	
</body>
</html>