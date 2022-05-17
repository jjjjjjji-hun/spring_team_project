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


			<h1>게시판 신고 디테일접속</h1>
			<div class="container">
		<h1 class="text text=primary">${b_report.b_reno}번 게시글 신고상세 페이지</h1>
		댓글 번호 : <input type="text" class="form-control" value="${b_report.bno}" readonly/>
		신고 사유 : <input type="text" value="${b_report.reason}" readonly/>
		글쓴이 : <input type="text" value="${board.u_id}" readonly/><br/><br/>
		신고 상세이유 : <textarea rows="15" class="form-control" readonly>${b_report.content}</textarea>
		
			
		<div class="row">
			<div class="col-md-3">	
				<a href="/B_report/B_relist" class="btn btn-success">신고글 목록</a>
			</div>
			<div class="col-md-3">
				<form action="/B_report/updateForm" method="post">
					<input type="hidden" value="${b_report.b_reno}" name="b_reno"/>
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<input type="submit" value="신고글 수정" class="btn btn-warning"/>
					
				</form>
			</div>
			<div class="col-md-3" >
				<form action="/B_report/delete" method="post">
					<input type="hidden" value="${b_report.b_reno}" name="b_reno"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">										
					<input type="submit" value="신고글 삭제" class="btn btn-primary"/>
				</form>
			</div>
		</div>			      
	</div>
   												
</body>
</html>