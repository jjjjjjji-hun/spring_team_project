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
		<div class="area" areaNum="${area.ano }">
		지역 : <strong class=ward>${area.ward }</strong>
			<button type="button" class="areaModBtn">Modify</button>
			<button type="button" class="areaDelBtn">Delete</button>
		</div>
		<br/>
	</c:forEach>
	
	<c:forEach var="l_kind" items="${l_kindList}">
		<div class="lkind" lkindNum="${l_kind.lno }">
		대분류 : <strong class=k_group>${l_kind.k_group }</strong>
			<button type="button" class="lkindModBtn">Modify</button>
			<button type="button" class="lkindDelBtn">Delete</button>
		</div>
		<br/>
	</c:forEach>
	
	<c:forEach var="s_kind" items="${s_kindList}">
		<div class="skind" skindNum="${s_kind.sno }">
		소분류 : <strong class=s_class>${s_kind.s_class }</strong>
			<button type="button" class="skindModBtn">Modify</button>
			<button type="button" class="skindDelBtn">Delete</button>
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
	
	<div id="modDiv" style="display:none;">
		<div>
			<input type="hidden" class="num" />
			<input type="text" id="value" />
		</div>
		<div>
			<button type="button" id="ModBtn">Modify</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		
		var isArea = false;
		var isLkind = false;
		var isSkind = false;

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
			
		$("#ModBtn").on("click", function() {
			
			let num = $(".num").val();
			
			let value = $("#value").val();
			
			let params = {
					type : 'patch',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Overrride" : "PATCH"
					},
					contentType: "application/json",
					dataType : 'text',
					success : function(result) {
						if(result == 'SUCCESS') {
							alert("수정 되었습니다.");
							$("#modDiv").hide();		
						}
					}
			}
			if (isArea) {
				params.url = '/category/updateArea';
				params.data = JSON.stringify({ano : num, ward : value});
			} else if(isLkind) {
				params.url = '/category/updateLkind';
				params.data = JSON.stringify({lno : num, k_group : value});
			} else {
				params.url = '/category/updateSkind';
				params.data = JSON.stringify({sno : num, s_class : value});
			}
			
			$.ajax(params);
		});
		
		$(".area").on("click", ".areaModBtn", function() {
			let num = $(this).parent().attr("areaNum");
			let area = $(this).siblings(".ward").text();
			
			isArea = true;
			
			$(".num").val(num);
			$("#value").val(area);
			$("#modDiv").show();
		});
		
		$(".lkind").on("click", ".lkindModBtn", function() {
			let num = $(this).parent().attr("lkindNum");
			let lkind = $(this).siblings(".k_group").text();
			
			isLkind = true;
			
			$(".num").val(num);
			$("#value").val(lkind);
			$("#modDiv").show();
		});
		
		$(".skind").on("click", ".skindModBtn", function() {
			let num = $(this).parent().attr("skindNum");
			let skind = $(this).siblings(".s_class").text();
			
			isSkind = true;
			
			$(".num").html(num);
			$("#value").val(skind);
			$("#modDiv").show();
		});
		
		$("#closeBtn").on("click", () => {
			$("#modDiv").hide();
		});
		
		
	</script>
	
</body>
</html>