<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>마이페이지</h1>
	<a href="/user/message">메세지 확인</a>
	<form action="/user/delete" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="submit" value="회원 탈퇴" />
	</form>
	
</body>
</html>