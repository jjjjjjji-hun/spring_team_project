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
		
	#modDiv2{
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
		
	#modDiv3{
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
		
	#categoryModDiv{
		position: fixed;
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
<a href="/user/admin">어드민 페이지</a> &nbsp;&nbsp;&nbsp;&nbsp;
<a href="/">메인 페이지</a>
<div>
	<h3 class="text-primary">지역</h3>
<table class="table">
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">지역</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="area" items="${areaList}">
    	<tr class="areaClass">
    	  <th scope="row" data-areaNum="${area.ano }">
      		${area.ano }
     	 </th>
     	 <td>
      		<strong id=area_ward>${area.ward }</strong>
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
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="l_kind" items="${l_kindList}">
    	<tr class="l_kindClass">
    	  <th scope="row" data-lkindNum="${l_kind.lno }">
      		${l_kind.lno }
     	 </th>
     	 <td>
      		<strong id=l_kind_k_group>${l_kind.k_group }</strong>
     	 </td>
   	 	</tr>
    </c:forEach>
  </tbody>
</table>
</div>

<div>
	<h3 class="text-primary">소분류</h3>
<table class="table" >
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">대분류</th>
      <th scope="col">소분류</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="s_kind" items="${s_kindList}">
    	<tr class="s_kindClass">
    	  <th scope="row" data-skindNum="${s_kind.sno }">
      		${s_kind.sno }
     	 </th>
     	 <td>
      		<strong id=s_kind_s_class>${s_kind.s_class }</strong>
     	 </td>
     	 <td>
      		<strong id=s_kind_k_group>${s_kind.k_group }</strong>
     	 </td>
   	 	</tr>
    </c:forEach>
  </tbody>
</table>
</div>

<div>
	<h3 class="text-primary">카테고리</h3>
<table class="table" >
  <thead>
    <tr>
      <th scope="col">구분</th>
      <th scope="col">소분류</th>
      <th scope="col">지역</th>
      <th scope="col">수정</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="category" items="${categoryList}">
    	<tr class="categoryClass">
    	  <th scope="row" data-categoryNum="${category.cno }">
      		${category.cno }
     	 </th>
     	 <td>
      		<strong id=category_c_class>${category.c_class }</strong>
     	 </td>
     	 <td>
      		<strong id=category_ward>${category.ward }</strong>
     	 </td>
     	 <td>
      		<button type="button" class="categoryModBtn">Modify</button>&nbsp;&nbsp;
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
					<option id="kind" value="" disabled selected>대분류 구분</option>
						<c:forEach var="l_kind" items="${l_kindList}">
						    <option value='${l_kind.k_group }'>${l_kind.k_group }</option>
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
	
	<div class="row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">카테고리 추가</h2>
		</div><!-- header -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="categoryAddBtn">카테고리 추가</button>
		</div><!-- footer -->
	</div><!-- row -->
	
	<!-- 모달 -->
	<div id="categoryModDiv" style="display:none;">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">카테고리를 선택해주세요.</h5>
        <button type="button" class="btn-close"></button>
      </div>
      <div class="modal-body">
        지역 : <select id="area">
					<option value="" disabled selected>선택해주세요</option>
						<c:forEach var="area" items="${areaList }">
							<option value="${area.ward }">${area.ward }</option>
						</c:forEach>
			  </select><br/>
		대분류 : <select id="l_kind">
					<option value="" disabled selected>선택해주세요</option>
						<c:forEach var="l_kind" items="${l_kindList }">
							<option value="${l_kind.k_group }">${l_kind.k_group }</option>
						</c:forEach>
			 	</select><br/>
		소분류 : <select id="s_kind">
					<option value=""disabled selected>선택해주세요</option>
						<c:forEach var="s_kind" items="${s_kindList }">
							<option value="${s_kind.s_class }">${s_kind.s_class }</option>
						</c:forEach>
			 	  </select>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-toggle="modal" id="categoryAdd">카테고리 추가하기</button>
      </div>
    </div>
</div>
	
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
	
	<!-- 소분류 modify 버튼 누를때 -->
	<div id="modDiv2" style="display:none;">
		<div>
			<input type="hidden" class="num" />
			<c:if test="true">
				<input type="text" class="lno" />
			</c:if>			
			
			<input type="text" id="value2" />
		</div>
		<div>
			<button type="button" id="ModBtn2">Modify</button>
			<button type="button" id="closeBtn2">Close</button>
		</div>
	</div>
	
	<!-- 카테고리 modify 버튼 누를때 -->
	<div id="modDiv3" style="display:none;">
		<div>
			<input type="hidden" class="num" />
			<c:if test="true">
				<input type="text" class="sno" />
			</c:if>
			<input type="text" id="value3" />
		</div>
		<div>
			<button type="button" id="ModBtn3">Modify</button>
			<button type="button" id="closeBtn3">Close</button>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		var isArea = false;
		var isLkind = false;
		var isSkind = false;
		var isCategory = false;
		
			$("#areaAddBtn").on("click", function() {
					isArea = true;
					let ward = $("#newWard").val();
				
					$.ajax({
						type : 'post',
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					    },
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
								location.reload();
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
					beforeSend : function(xhr) {
				        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				    },
					url : '/category/skind',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Overrride" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						s_class : s_class,
						k_group : lno
					}),
					success : function(result) {
						if(result == 'SUCCESS') {
	
							alert("등록 되었습니다.");
							$("#newsClass").val("");
							location.reload(true);
						}
					}
				});
				
			});
			
			$("#l_kindAddBtn").on("click", function() {
				isLkind = true;
				let k_group = $("#newK_group").val();
			
				$.ajax({
					type : 'post',
					beforeSend : function(xhr) {
				        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				    },
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
							location.reload();
						}
					}
				});
			});
			
			$("#categoryAddBtn").on("click", function() {
				$("#categoryModDiv").show();
			});
				
			let sno = null;
			let ano = null;
			
			$("#s_kind").on("change", function(){
				sno = $("#s_kind option:selected").val()
			});
			$("#area").on("change", function(){
				ano = $("#area option:selected").val()
			});
			
			$("#categoryAdd").on("click", function(){
				
				$.ajax({
					type : 'post',
					beforeSend : function(xhr) {
					        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					url : '/category/insert',
					headers : {
						"Content-type" : "application/json",
						"X-HTTP-Method-Override" : "POST"},
					dataType : 'text',
					data : JSON.stringify({
						c_class : sno,
						ward : ano
					}),
					success : function(result){
						if(result == 'SUCCESS'){
							alert("등록 되었습니다.");
							$("#categoryModDiv").hide();
							location.reload();
						}
					},
						error : function(result){
							if(result != 'SUCCESS'){
								alert("다시 등록해주세요.");
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
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					    },
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PATCH"
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
					params.data = JSON.stringify({sno : num, k_group : lno, s_class : value});
				}
				
				$.ajax(params);
				if(isArea){
					isArea = false;
				}else if(isLkind){
					isLkind = false;
				}else if(isSkind){
					isSkind = false;
				}
				location.reload();
			});
			
			$(".areaModBtn").on("click", function() {
				let num = $(this).parent().prev().prev().attr("data-areaNum");
				console.log(num);
				let area = $(this).parent().prev().children("#area_ward");
				let areaclass = area.text();
				
				$(".num").val(num);
				$("#value").val(areaclass);
				$("#modDiv").show();
				isArea = true;
			});
			
			$(".l_kindClass").on("click", ".lkindModBtn", function() {
				let num = $(this).parent().prev().prev().attr("data-lkindNum");
				//let lkind = $("#l_kind_k_group").text();
				let lkind = $(this).parent().prev().children("#l_kind_k_group");
				let lkindclass = lkind.text();
				
				$(".num").val(num);
				$("#value").val(lkindclass);
				$("#modDiv").show();
				isLkind = true;
			});
			
			
			$(".skindModBtn").on("click", function() {
				let num = $(this).parent().prev().prev().prev().attr("data-skindNum");
				let lno = $(this).parent().prev().children("#s_kind_k_group").text();
				let skind = $(this).parent().prev().prev().children("#s_kind_s_class");
				let skindclass = skind.text();
				console.log(num);
				console.log(lno);
				console.log(skindclass);
				$(".num").val(num);
				$(".lno").val(lno);
				$("#value2").val(skindclass);
				$("#modDiv2").show();
				isSkind = true;
			});
			
			$(".categoryModBtn").on("click", function() {
				let num = $(this).parent().prev().prev().prev().attr("data-categoryNum");
				let sno = $(this).parent().prev().prev().children("#category_c_class").text();
				let ward = $(this).parent().prev().children("#category_ward");
				let categoryclass = ward.text();
				console.log(num);
				console.log(sno);
				console.log(categoryclass);
				$(".num").val(num);
				$(".sno").val(sno);
				$("#value3").val(categoryclass);
				$("#modDiv3").show();
				isCategory = true;
			});
			
			$("#closeBtn").on("click", () => {
				$("#modDiv").hide();
				isArea = false;
				isLkind = false;
				isSkind = false;
			});
		
			$("#ModBtn2").on("click", function() {
				
				let num = $(".num").val();
				console.log(num);
				let lno = $(".lno").val();
				console.log(lno);
				let value = $("#value2").val();
				
				let params = {
						type : 'patch',
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					    },
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PATCH"
						},
						contentType: "application/json",
						dataType : 'text',
						success : function(result) {
							if(result == 'SUCCESS') {
								alert("수정 되었습니다.");
								$("#modDiv2").hide();		
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
					params.data = JSON.stringify({sno : num, k_group : lno, s_class : value});
				}
				
				$.ajax(params);
				isSkind = false;
				location.reload();
			});
			
		$("#ModBtn3").on("click", function() {
				
				let num = $(".num").val();
				console.log(num);
				let sno = $(".sno").val();
				console.log(sno);
				let value = $("#value3").val();
				console.log(value);
				
				$.ajax({
						type : 'patch',
						beforeSend : function(xhr) {
					        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					    },
					    url : '/category/updateCategory',
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PATCH"
						},
						contentType: "application/json",
						dataType : 'text',
						data : JSON.stringify({
							cno : num, 
							c_class : sno, 
							ward : value
						}),
						success : function(result) {
							if(result == 'SUCCESS') {
								alert("수정 되었습니다.");
								$("#modDiv3").hide();	
								isCategory = false;
							}
						}
				});

				location.reload();
			});
		
			$("#closeBtn2").on("click", () => {
				$("#modDiv2").hide();
				isArea = false;
				isLkind = false;
				isSkind = false;
			});
			
			$("#closeBtn3").on("click", () => {
				$("#modDiv3").hide();
				isCategory = false;
			});
			
			$(".btn-close").on("click", () => {
				$("#categoryModDiv").hide();
			});
			
	</script>
	
</body>
</html>