<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<style>
	select option[value=""][disabled] {
		display: none;
	}
</style>
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h3 class="text-primary">지역</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">지역</th>
      <th scope="col">수정/삭제</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="area" items="${areaList}">
    	<tr>
    	  <th scope="row">
      		${area.ano }
     	 </th>
     	 <td>
      		<strong class=ward>${area.ward }</strong>
     	 </td>
     	 <td>
      		<button type="button" class="areaModBtn">Modify</button>&nbsp;&nbsp;
			<button type="button" class="areaDelBtn">Delete</button>
     	 </td>
   	 	</tr>
    </c:forEach>
  </tbody>
</table>
</div>

<div>
	<h3 class="text-primary">대분류</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">종류</th>
      <th scope="col">수정/삭제</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="l_kind" items="${l_kindList}">
    	<tr>
    	  <th scope="row">
      		${l_kind.lno }
     	 </th>
     	 <td>
      		<strong class=ward>${l_kind.k_group }</strong>
     	 </td>
     	 <td>
      		<button type="button" class="lkindModBtn">Modify</button>&nbsp;&nbsp;
			<button type="button" class="lkindDelBtn">Delete</button>
     	 </td>
   	 	</tr>
    </c:forEach>
  </tbody>
</table>
</div>

<div>
	<h3 class="text-primary">소분류</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">종류</th>
      <th scope="col">종류2</th>
      <th scope="col">수정/삭제</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="s_kind" items="${s_kindList}">
    	<tr>
    	  <th scope="row">
      		${s_kind.sno }
     	 </th>
     	 <td>
      		<strong class=ward>${s_kind.s_class }</strong>
     	 </td>
     	 <td>
      		<strong class=ward>${s_kind.lno }</strong>
     	 </td>
     	 <td>
      		<button type="button" class="skindModBtn">Modify</button>&nbsp;&nbsp;
			<button type="button" class="skindDelBtn">Delete</button>
     	 </td>
   	 	</tr>
    </c:forEach>
  </tbody>
</table>
</div>

	
	
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
			<strong>소분류</strong><br/>
				<select class='lno' required>
					<option value="" disabled selected>대분류 구분</option>
						<c:forEach var="l_kind" items="${l_kindList}">
						    <option value='${l_kind.lno }'>${l_kind.k_group }</option>
						</c:forEach>
				</select>
				
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
			<c:if test="true">
				<select class='lno' required>
					<option value="" disabled selected>대분류 구분</option>
					<c:forEach var="l_kind" items="${l_kindList}">
						<option value='${l_kind.lno }' ${l_kind.lno eq lno ? 'selected' : ''}>${l_kind.k_group }</option>
					</c:forEach>
				</select>
			</c:if>
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
					isArea = true;
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
				isSkind = true;
				let s_class = $("#newsClass").val();
				let lno = $(".lno").val();
	
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
				isLkind = true;
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
				console.log(num);
				let lno = $(".lno").val();
				console.log(lno);
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
				} else if (isSkind) {
					params.url = '/category/updateSkind';
					params.data = JSON.stringify({sno : num, lno : lno, s_class : value});
				}
				
				$.ajax(params);
			});
			
			$(".areaModBtn").on("click", function() {
				let num = $(this).parent().attr("areaNum");
				let area = $(this).siblings(".ward").text();
				
				$(".num").val(num);
				$("#value").val(area);
				$("#modDiv").show();
			});
			
			$(".lkindModBtn").on("click", function() {
				let num = $(this).parent().attr("lkindNum");
				let lkind = $(this).siblings(".k_group").text();
				
				$(".num").val(num);
				$("#value").val(lkind);
				$("#modDiv").show();
			});
			
			$(".skindModBtn").on("click", function() {
				let num = $(this).parent().attr("skindNum");
				let lno = $(this).parent().attr("lkindNum");
				let skind = $(this).siblings(".s_class").text();
				
				$(".num").val(num);
				$(".lno").val(lno);
				$("#value").val(skind);
				$("#modDiv").show();
			});
			
			$("#closeBtn").on("click", () => {
				$("#modDiv").hide();
			});
		
		
	</script>
	
</body>
</html>