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
	<h1>어드민(관리자) 페이지</h1>
	<div>
	<button type="button" class="btn btn-primary"onclick="location.href='http://localhost:8181/' ">메인페이지가기</button>
	<button type="button" class="btn btn-dark"onclick="location.href='http://localhost:8181/category/list' ">카테고리리스트보기</button>
	<button type="button" class="btn btn-success"onclick="location.href='http://localhost:8181/board/list' ">게시판가기</button>
	<button type="button" class="btn btn-danger"onclick="location.href='http://localhost:8181/R_report/R_relist' ">댓글신고보기</button>
	<button type="button" class="btn btn-danger"onclick="location.href='http://localhost:8181/B_report/B_relist' ">게시판신고보기</button>
	<button type="button" class="btn btn-danger"onclick="location.href='http://localhost:8181/user/ban' ">유저 차단</button>
	</div>
	
	
	<div>

	</div>
	
	
	
</body>
</html>