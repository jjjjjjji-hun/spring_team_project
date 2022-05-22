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
		<form action="/notify/update" method="post">
			<input type="hidden" name="nno"  value="${update.nno }"/>
			글 제목 : <input type="text" name="title" value="${update.title }" required/><br/>
			본문 : <textarea name="content" rows="15" cols="30">${update.content }</textarea>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input type="submit" value="제출"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"/>
		</form>
	</div>
	
	<a href="/notify/list" class="hover">공지사항 목록 가기</a>
</body>
</html>