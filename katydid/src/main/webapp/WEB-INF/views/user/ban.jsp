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
	<h1>차단 페이지</h1>
	<a href="/user/admin">관리자 메인페이지 가기</a>
	<table border="1" class="table table">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>차단 여부</th>
				<th>차단 </th>
				<th>차단 해제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.u_id}</td>
					<td>${user.uname}</td>
					<td>${user.pnum}</td>
					<td>${user.banned eq 1 ? '차단됨' : ''}</td>
					<td><a href="/user/ban/${user.u_id}/1">차단</a></td>
					<td><a href="/user/ban/${user.u_id}/0">차단 해제</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>