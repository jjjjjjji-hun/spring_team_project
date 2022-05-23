<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		글 제목 : <input type="text" name="title" value="${detail.title }" readonly/><br/>
		본문 : <textarea name="content" rows="15" cols="30">${detail.content}</textarea>
	</div>
	
	<a href="/notify/update/${detail.nno }" class="hover">수정하기</a>
	
	<form action="/notify/delete/${detail.nno }" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="submit" value="삭제"/>
	</form>
	<a href="/notify/list" class="hover">공지사항 목록 가기</a>
</body>
</html>