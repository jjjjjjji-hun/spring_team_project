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
		본문 : <textarea name="content" rows="15" cols="30">${datail.content }</textarea>
	</div>
</body>
</html>