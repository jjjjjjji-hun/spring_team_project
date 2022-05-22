<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/board/update" method="post">
			<h1 class="text text=primary">${board.bno}번 글 수정페이지</h1>
			<input type="hidden" name="bno" value="${board.bno}"/>
			글 제목 : <input type="text" name="title" value="${board.title}" required/><br/>
			글쓴이 : <input type="text" value="${board.u_id}" readonly/><br/>
			쓴 날짜 : ${board.regdate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			마지막 수정날짜 : ${board.updatedate}<br/><br/>
			본문 : <textarea name="content" rows="15" cols="30">${board.content }</textarea>
			
			<input type="hidden" name="pageNum" value="${param.pageNum}"/>
			<input type="hidden" name="searchType" value="${param.searchType}"/>
			<input type="hidden" name="keyword" value="${param.keyword}"/>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input type="submit" value="수정"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"/>
		</form>
	</div>
</body>
</html>