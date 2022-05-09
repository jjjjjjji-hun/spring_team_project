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
					<option value="">선택해주세요</option>
						<c:forEach var="area" items="${areaList }">
							<option value="${area }">${area.ward }</option>
						</c:forEach>
			  </select><br/>
		대분류 : <select id="l_kind">
					<option value="">선택해주세요</option>
						<c:forEach var="l_kind" items="${l_kindList }">
							<option value="${l_kind }">${l_kind.k_group }</option>
						</c:forEach>
			 	</select><br/>
		소분류 : <select id="s_kind">
					<option value="">선택해주세요</option>
						<c:forEach var="s_kind" items="${s_kindList }">
							<option value="${s_kind }">${s_kind.s_class }</option>
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
        카테고리 : 
        	<div class="col-md-3">
        		<p id="category1" style="display:inline">
			
				</p>
        	</div>
			<div class="col-md-3">
        		<p id="category2"  style="display:inline">
			
				</p>
        	</div>  
        	<div class="col-md-3">
        		<p id="category3"  style="display:inline">
			
				</p>
        	</div>   	
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
        
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" id="submitBtn">업체 등록하기</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">업체 등록 요청</a>

	<!-- jquery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script id="text/javascript">
		
		// 모달 창닫기
		$("#submitBtn").on("click", function(){
			$("#exampleModalToggle3").hide("slow");
		});
		
		// 카테고리 선택 후 -> 식당 등록할 시
		$("#exampleModalToggle").on("click", ".modal-footer button", function(){
			let strArea = $("#area option:selected").val("${area.ward}");
			let strL_kind = $("#l_kind option:selected").val("${l_kind.k_group}");
			let strS_kind = $("#s_kind option:selected").val("${s_kind.s_class}");
			$('#category1').html(strArea);
			$('#category2').html(strL_kind);
			$('#category3').html(strS_kind);
		});
		
		/* 식당 등록 후 -> 메뉴 등록할 시
		$("#exampleModalToggle2").on("click", ".modal-footer button", function(){
			let strArea = $("#area option:selected").val("${area.ward}");
			let strL_kind = $("#l_kind option:selected").val("${l_kind.k_group}");
			let strS_kind = $("#s_kind option:selected").val("${s_kind.s_class}");
			let categoryList = [strArea, strL_kind, strS_kind];
			$('#category').html(categoryList);
		});*/
		
	</script>
</body>
</html>