<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/board/insert" method="post">
			글 제목 : <input type="text" name="title" required/><br/>
			글쓴이 : <input type="text" name="u_id" required/><br/>
			본문 : <textarea name="content" rows="15" cols="30"></textarea>
			<input type="submit" value="제출"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"/>
		</form>
	</div>
</body>
</html>