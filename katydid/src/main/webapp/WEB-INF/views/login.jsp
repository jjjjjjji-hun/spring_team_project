<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 폼</h1>
	<h2>${error }</h2>
	<h2>${logout }</h2>
	
	<form action="/login" method="post">
		아이디 : <input type="text" name="username" value="" /><br/>
		비밀번호 : <input type="password" name="password" value="" /> <br/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="submit" value="로그인" />
	</form>
	
</body>
</html>