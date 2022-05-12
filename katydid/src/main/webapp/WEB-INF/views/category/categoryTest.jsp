<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">카테고리를 선택해주세요.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        지역 : <select id="area">
					<option value="" disabled selected>선택해주세요</option>
						<c:forEach var="area" items="${areaList }">
							<option value="${area.ano }">${area.ward }</option>
						</c:forEach>
			  </select><br/>
		대분류 : <select id="l_kind">
					<option value="" disabled selected>선택해주세요</option>
						<c:forEach var="l_kind" items="${l_kindList }">
							<option value="${l_kind.lno }">${l_kind.k_group }</option>
						</c:forEach>
			 	</select><br/>
		소분류 : <select id="s_kind" disabled selected>
					<option value="">선택해주세요</option>
						<c:forEach var="s_kind" items="${s_kindList }">
							<option value="${s_kind.sno }">${s_kind.s_class }</option>
						</c:forEach>
			 	  </select>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">식당 정보 등록하기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">식당 정보를 입력해주세요.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
        <input type="hidden" id="newCategory" value="${categoryList }"/>
         
        	<div class="col-md-12">
        		카테고리 :
        		<p id="category1" style="display:inline">
			
				</p>
				<p id="category2"  style="display:inline">
			
				</p>
				<p id="category3"  style="display:inline">
			
				</p>  	
        	</div>
        </div>
        <hr/>
        <div id="text">
        	<form>
	          <div class="mb-1">
	            <label for="message-text" class="col-form-label">업체 이름 :</label>
	            <textarea class="form-control" id="message-sname"></textarea>
	          </div>
       		</form>
       		<form>
       		  <div class="mb-1">
	            <label for="message-text" class="col-form-label">업체 주소 :</label>
	            <textarea class="form-control" id="message-address"></textarea>
	          </div>
	        </form>
	        <form>
       		  <div class="mb-1">
	            <label for="message-text" class="col-form-label">업체 전화번호 :</label>
	            <textarea class="form-control" id="message-spnum"></textarea>
	          </div>
	        </form>
        </div>
      </div>
      <div class="modal-footer">
      	<button id="menu" class="btn btn-primary" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">업체 상품 등록하러가기</button>
        <button id="back1" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel3">업체 상품을 등록해주세요.</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="store">
        <div class="row">
        업체정보 : 
        	<div class="col-md-3">
        		<p id="category4" style="display:inline">
			
				</p>
        	</div>
			<div class="col-md-3">
        		<p id="category5"  style="display:inline">
			
				</p>
        	</div>  
        	<div class="col-md-3">
        		<p id="category6"  style="display:inline">
			
				</p>
        	</div>   	
        </div>
        <hr/>
	        <table class="table">
			  <thead>
			    <tr>
			      <th scope="col">상품명</th>
			      <th scope="col">금액</th>
			      <th scope="col">대표 상품 여부</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="i" begin="0" end="4">
				    <tr>
				      <th scope="row"><textarea id="items" rows="2" cols="8"></textarea></th>
				      <td><textarea id="amount" rows="2" cols="8"></textarea></td>
				      <td>
				      	<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						  <label class="form-check-label" for="flexCheckDefault">
						    
						  </label>
						</div>
				      </td>
				    </tr>
				</c:forEach>
			  </tbody>
			</table>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="submitBtn" data-bs-dismiss="modal" aria-label="Close">업체 등록하기</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">업체 등록 요청</a>

	<!-- jquery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script id="text/javascript">
		
		let sno = null;
		let ano =  null;
		let cno =  null;
		let stno = null;
		
		// 선택한 지역, 소분류 값 변수에 저장
		$("#s_kind").on("change", function(){
			sno = $("#s_kind option:selected").val()
		});
		$("#area").on("change", function(){
			ano = $("#area option:selected").val()
		});
		
		
		// 카테고리 선택 후 -> 식당 등록할 시
		$("#exampleModalToggle").on("click", ".modal-footer button", function(){
			let strArea = $("#area option:selected").html();
			let strL_kind = $("#l_kind option:selected").html();
			let strS_kind = $("#s_kind option:selected").html();
			$('#category1').html(strArea);
			$('#category2').html(strL_kind);
			$('#category3').html(strS_kind);

			console.log(strArea);
			console.log(strL_kind);
			console.log(strS_kind);
			
			$.ajax({
				type : 'post', 
				url : '/category/insert', // insert에서 getList로 변경해야함
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"},
				dataType : 'text',
				data : JSON.stringify({
					sno : sno,
					ano : ano
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
					}
				},
					error : function(result){
						if(result != 'SUCCESS'){
							alert("다시 등록해주세요.");
						}
					}
			});
			
			$.getJSON("/category/tests", function(data){
				for (let i=0; i<data.length; i++) {
					
					if(data[i].sno == sno && data[i].ano == ano) {
						cno = data[i].cno;
						console.log(data[i]);
					}
				}
			});
			
		});
				
		
		// 식당 등록 후 -> 메뉴 등록할 시
		$("#menu").on("click", function(){
			let strSname = $("#message-sname").val();
			let strAddress = $("#message-address").val();
			let strSpnum = $("#message-spnum").val();
			$('#category4').html(strSname);
			$('#category5').html(strAddress);
			$('#category6').html(strSpnum);
			
			console.log(strSname);
			console.log(strAddress);
			console.log(strSpnum);
			
			$.ajax({
				type : 'post', 
				url : '/enterprise/storeinsert', 
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"},
				dataType : 'text',
				data : JSON.stringify({
					cno : cno,
					storeName : strSname,
					address : strAddress,
					spNum : strSpnum
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						// 폼 태그 비우기.
						strSname = $("#message-sname").val("");
						strAddress = $("#message-address").val("");
						strSpnum = $("#message-spnum").val("");
						
					}
				},
				error : function(result){
					if(result != 'SUCCESS'){
						alert("다시 등록해주세요.");
					}
				}
			});
			
			$.getJSON("/enterprise/tests/" + cno, function(data){
				for (let j=0; j<data.length; j++) {
					
					if(data[j].cno == cno) {
						stno = data[j].stno;
						console.log(data[j]);
					}
					
				}
			});
			
		});
		
		// 메뉴 등록하고 버튼 클릭시
		$("#submitBtn").on("click", function(){
			let strmenuName = $("#items").val();
			let strAmount = $("#amount").val();
			let represent = $("input[type='checkbox']").is(":checked");
			console.log(strmenuName);
			console.log(strAmount);
			console.log(represent);
			
			$.ajax({
				type : 'post', 
				url : '/enterprise/menuinsert', 
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "POST"},
				dataType : 'text',
				data : JSON.stringify({
					stno : stno,
					menuName : strmenuName,
					amount : strAmount,
					represent : represent
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						// 폼 태그 비우기.
						strmenuName = $("#items").val("");
						strAmount = $("#amount").val("");
					}
				},
				error : function(result){
					if(result != 'SUCCESS'){
						alert("다시 등록해주세요.");
					}
				}
			});
			
		})
		// 대표 상품 여부 체크 제한
		$(document).ready(function(){
			$("input[type='checkbox']").on("click", function(){
				let count = $("input:checked[type='checkbox']").length;
				
				if(count > 3){
					$(this).prop("checked", false);
					alert("3개까지만 선택할 수 있습니다.");
				}
			});
		});
		
	</script>
</body>
</html>