<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>카테고리 입력</h1>
	
	<form action="/category/area" method="post">
		지역 입력: <input type="text" name="ward" /> <br/>
		<input type="submit" value="추가" /> <br/>
		<input type="reset" value="초기화" />
	</form>
	
	<form action="/category/lkind" method="post">
		(미구현)대분류 입력: <input type="text" name="k_group" /> <br/>
		<input type="submit" value="추가" /> <br/>
		<input type="reset" value="초기화" />
	</form>
	
	<form action="/category/skind" method="post">
		(미구현)소분류 입력: <input type="text" name="sClass" /> <br/>
		<input type="submit" value="추가" /> <br/>
		<input type="reset" value="초기화" />
	</form>
	
	<form action="/category/category" method="post">
		(미구현)분류 입력: <input type="" name="" /> <br/>
		<input type="submit" value="추가" /> <br/>
		<input type="reset" value="초기화" />
	</form>
	
</body>
</html>