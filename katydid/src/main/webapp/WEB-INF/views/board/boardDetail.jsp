<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#modDiv{
		width: 450px;
		height: 100px;
		background-color: green;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding:10px;
		z-index:1000;
	}
	#reply{
	width: 430px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<h1 class="text text=primary">${board.bno}번 게시글 상세 페이지</h1>
		글 번호 : <input type="text" class="form-control" value="${board.bno}" readonly/>
		글 제목 : <input type="text" value="${board.title}" readonly/>
		글쓴이 : <input type="text" value="${board.u_id}" readonly/><br/><br/>
		글 본문 : <textarea rows="15" class="form-control" readonly>${board.content}</textarea>
		<div class="row">
			<div class="col-md-6">쓴날짜 : ${board.regdate}&nbsp;&nbsp;&nbsp;</div>
			<div class="col-md-6">마지막 수정날짜 : ${board.updatedate}</div><br/><br/>
		</div>
			
		<div class="row">
			<div class="col-md-3">	
				<a href="/board/list?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-success">게시글 목록</a>
			</div>
			<div class="col-md-3">
				<form action="/board/updateForm" method="post">
					<input type="hidden" value="${board.bno}" name="bno"/>
					<input type="hidden" value="${param.pageNum}" name="pageNum"/>
					<input type="hidden" value="${param.searchType}" name="searchType"/>
					<input type="hidden" value="${param.keyword}" name="keyword"/>
					<input type="submit" value="글 수정하기" class="btn btn-warning"/>
				</form>
			</div>
			<div class="col-md-3">
				<form action="/board/delete" method="post">
					<input type="hidden" value="${board.bno}" name="bno"/>
					<input type="hidden" value="${param.pageNum}" name="pageNum"/>
					<input type="hidden" value="${param.searchType}" name="searchType"/>
					<input type="hidden" value="${param.keyword}" name="keyword"/>
					<input type="submit" value="글 삭제하기" class="btn btn-danger"/>
				</form>
			</div>
		</div>

	<hr/>
	<!-- 댓글이 추가될 공간 -->
	<div class="row">
		<h3 class="text-primary">댓글</h3>
		<ul id="replies">
	
		</ul>
	</div>
	<hr/>
	<!-- 댓글 작성 공간 -->
	<div class="row box-box-success">
		<div class="box-header">
			<h3 class="text-primary">댓글 작성하기</h3>
		</div><!-- header -->
				<div class="box-body">
					<strong>댓글 글쓴이</strong>
					<input type="text" name="replyer" id="newReplyWriter" placeholder="writer" class="form-control"/>
					<strong>댓글 내용</strong>
					<input type="text" name="reply" id="newReplyText" placeholder="content" class="form-control"/>
				</div><!-- body -->
				<div class="box-footer">
					<button type="button" id="replyAddBtn" class="btn btn-success">댓글 추가</button>
				</div><!-- footer -->
	</div><!-- row -->
	
		<!-- 댓글 modal -->
		<div id="modDiv" style="display:none;">
			<div class="modal-title"></div>
			<div>
				<input type="text" id="reply">
			</div>
			<div>
				<button type="button" id="replyModBtn">수정</button>
				<button type="button" id="replyDelBtn">삭제</button>
				<button type="button" id="closeBtn">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>