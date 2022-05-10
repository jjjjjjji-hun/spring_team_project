<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입창</h1>
	<form action="/user/join" method="post">
		아이디 : <input type="text" name="u_id" /><br/>
		비밀번호 : <input type="password" name="upw" /><br/>
		이름 : <input type="text" name="uname" /><br/>
		전화번호 : <input type="text" name="pnum" /><br/>
		<input type="radio" name="role" value="ROLE_ADMIN">어드민 권한&nbsp;&nbsp;&nbsp;
		<input type="radio" name="role" value="ROLE_MEMBER">정회원 권한&nbsp;&nbsp;&nbsp;
		<input type="radio" name="role" value="ROLE_USER">준회원
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/><br/>
		<input type="submit" value="가입하기" /><br/>
	</form>
</body>
</html>