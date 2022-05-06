<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="area" items="${areaList}">
		areaList : ${area.ward }
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
		</div>
		<br/>
	</c:forEach>
	
	<c:forEach var="l_kind" items="${l_kindList}">
		l_kindList : ${l_kind.k_group }
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
		</div>
		<br/>
	</c:forEach>
	
	<c:forEach var="s_kind" items="${s_kindList}">
		s_kindList : ${s_kind.s_class }
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
		</div>
		<br/>
	</c:forEach>
	
	<div class="row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">지역 추가</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>지역</strong>
			<input type="text" id="newWard" placeholder="지역" class="form-control"/>
		</div><!-- body -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="areaAddBtn">지역 추가</button>
		</div><!-- footer -->
	</div><!-- row -->
	
	<div class="row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">소분류 추가</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>소분류</strong>
			<input type="text" id="newsClass" placeholder="소분류" class="form-control"/>
		</div><!-- body -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="s_kindAddBtn">소분류 추가</button>
		</div><!-- footer -->
	</div><!-- row -->
	
	<div class="row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">대분류 추가</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>대분류</strong>
			<input type="text" id="newK_group" placeholder="대분류" class="form-control"/>
		</div><!-- body -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="l_kindAddBtn">대분류 추가</button>
		</div><!-- footer -->
	</div><!-- row -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		
		$("#areaAddBtn").on("click", function() {
				
				let ward = $("#newWard").val();
			
				$.ajax({
					type : 'post',
					url : '/category/area',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Overrride" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						ward : ward
					}),
					success : function(result) {
						if(result == 'SUCCESS') {
							alert("등록 되었습니다.");
							$("#newArea").val("");
						}
					}
				});
			});
		
		$("#s_kindAddBtn").on("click", function() {
			
			let s_class = $("#newsClass").val();
			let lno = 1;

			$.ajax({
				type : 'post',
				url : '/category/skind',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrride" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					s_class : s_class,
					lno : lno
				}),
				success : function(result) {
					if(result == 'SUCCESS') {

						alert("등록 되었습니다.");
						$("#newsClass").val("");
					}
				}
			});
			
		});
		
		$("#l_kindAddBtn").on("click", function() {
			
			let k_group = $("#newK_group").val();
		
			$.ajax({
				type : 'post',
				url : '/category/lkind',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrride" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					k_group : k_group
				}),
				success : function(result) {
					if(result == 'SUCCESS') {
						alert("등록 되었습니다.");
						$("#newK_group").val("");
					}
				}
			});
		});
			

		
		
	</script>
	
</body>
</html>