<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="/resources2/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<title>Insert title here</title>

<style>
    *{
    margin: 0;
    padding: 0;
    position: relative;
    font-family: 'Noto Sans KR', sans-serif;
    list-style: none;}
   

    
    body{background-color: white; width: 100%; max-width:1500px; margin: 0 auto;}

    .col-md-5{
    margin-top: 20px;
    text-align: right;
    }
    .col-md-3{
      margin-top: 30px;
      text-align: left;
     }
    .col-md-4{
      margin-top: 30px;
      text-align: left;
      padding: 10px;
     }
    

    .row-nav1{
        text-align: center;
    }
    .row-nav2{
        text-align: center;
    }



    #container {
      width: 190px;
      margin: 0px auto;
      padding: 20px;
      float: center;
    }

    


    .footer { text-align: center; clear : both;} 
    </style>

</head>
<body>

	<div class="row header">
                    <div class="col-md-5">
                        <img width="90px" height="90px" src="/resources2/img/Katydid.gif">
                    </div>
                    <div class="col-md-3">
                        <a href="/"><img src="/resources2/img/katydidtitle.png" width="250px" height="90px"  border="0"></a>
                    </div>
                    <div class="col-md-4">
                    	<sec:authorize access="isAnonymous()">
	                        <form action="/login" method="post">
	                            <input type="text" name="username" value="" placeholder="ID"/><br/>
	                            <input type="password" name="password" value="" placeholder="PW"/><br/>
	                            <input type="checkbox" name="remember-me"/>자동로그인<br/>
	                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	                            &emsp;&emsp;<input type="submit" class="btn btn-light" value="Login" />
	                            <button type="button" class="btn btn-light" onclick="location.href='/user/join' ">Sign_up</button>
	                        </form>
                        </sec:authorize>
                        
                        <sec:authorize access="isAuthenticated()">
                            <button type="button" class="btn btn-light" onclick="location.href='/user/'">My Page</button>
                            <form action="/logout" method="post">
                                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                  <input type="submit" class="btn btn-light" value="Log_out"/>
                            </form>
                        </sec:authorize>
                    </div>
     </div>
<hr/>

 <div class="row-nav1">
    <div class="col-md-12">
        <div class="row">
            <!-- 검색창 부분 -->
            <form action="/board/list" method="get">
                <!--  select 태그를 이용해 클릭해 검색조건을 선택할수있도록 처리합니다.  -->
                <select name="searchType">
                    <!-- 검색조건을 option태그를 이용해 만듭니다.  -->
                    <option value="n">-</option>
                    <option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : '' }>제목</option>
                    <option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected' : '' }>본문</option>
                    <option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : '' }>글쓴이</option>
                    <option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected' : '' }>제목+본문</option>
                    <option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected' : '' }>본문+글쓴이</option>
                    <option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected' : '' }>제목+본문+글쓴이</option>
                </select>
                <input type="text" name="keyword" placeholder="검색어" value="${pageMaker.cri.keyword }">
                <input type="submit" class="btn btn-outline-secondary" value="검색하기">&nbsp;
                <button type="button" class="btn btn-outline-danger" onclick="location.href='/notify/list' ">공지사항</button>&nbsp;
                <sec:authorize access="hasAnyRole('ROLE_MEMBER')">
						<button type="button" class="btn btn-secondary" onclick="location.href='/category/test'">업체등록</button>
				</sec:authorize>
                
                
            </form>
        </div>
    </div>
</div>
<br>
<div class="row-nav2">
    <div class="col-md-12">
        	<table border="1" class="table table">
				<thead>
					<tr>
						<th>공지사항</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${recentNotifyList}">
						<tr>
							<td><a href="/notify/detail/${list.nno}">${list.content}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </div>
    
</div>


<br>
<div id="container">
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
        
        	<div class="col-md-12">
        	업체정보 : 
        		<p id="category4" style="display:inline">
			
				</p>
				<p id="category5"  style="display:inline">
			
				</p>
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
			  <tr>
			  	<th id="itemName">
			  	</th>
			  	<td id="price">
			  	</td>
			  	<td id="checkBox">

			  	</td>
			  </tr>
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
			  </tbody>
			</table>
        </div>
      </div>
      <div class="modal-footer">
      <button class="btn btn-primary" id ="menuAddBtn" data-bs-target="#exampleModalToggle3">메뉴 추가하기</button>
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
		
		let c_class = null;
		let ward =  null;
		let cno =  null;
		let stno = null;
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}" 
		
		// 선택한 지역, 소분류 값 변수에 저장
		$("#s_kind").on("change", function(){
			c_class = $("#s_kind option:selected").val()
		});
		$("#area").on("change", function(){
			ward = $("#area option:selected").val()
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
			
			$.getJSON("/category/tests", function(data){
				for (let i=0; i<data.length; i++) {
					
					if(data[i].c_class == c_class && data[i].ward == ward) {
						cno = data[i].cno;
						console.log(data[i]);
					}
				}
			});
			
		});
				
		
		// 식당 등록 후 -> 메뉴 등록할 시
		$("#menu").on("click", function(){
			let regex = /[^0-9]/g;
			
			let strSname = $("#message-sname").val();
			let strAddress = $("#message-address").val();
			let strSpnum = $("#message-spnum").val().replace(regex, "");;
			
			if(strSpnum != ""){
				$('#category4').html(strSname);
				$('#category5').html(strAddress);
				$('#category6').html(strSpnum);
			}
			
			console.log(strSname);
			console.log(strAddress);
			console.log(strSpnum);
			
			$.ajax({
				type : 'post',
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
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
						
						$.getJSON("/enterprise/tests/" + cno, function(data){
							for (let j=0; j<data.length; j++) {
								
								if(data[j].cno == cno) {
									stno = data[j].stno;
									console.log(data[j]);
								}
								
							}
						});
						
					}
				},
				error : function(result){
					if(result != 'SUCCESS'){
						alert("다시 등록해주세요.");
						strSname = $("#message-sname").val("");
						strAddress = $("#message-address").val("");
						strSpnum = $("#message-spnum").val("");
					}
				}
			});
			
		});
		let count = 0;
		// 메뉴 등록하고 버튼 클릭시
		$("#menuAddBtn").on("click", function(){
			let regex = /[^0-9]/g;

			let strmenuName = $("#items").val();
			let strAmount = $("#amount").val().replace(regex, "");
			let represent = $("input[type='checkbox']").is(":checked");
			
			
			
			if(strAmount != ""){
			$("#itemName").append(strmenuName + "<br/>");
			$("#price").append(strAmount + "<br/>");
				if($("input[type='checkbox']").is(":checked")==true){
					$("#checkBox").append("대표상품 <br/>"); 
					
				}else if($("input[type='checkbox']").is(":checked")==false){
					$("#checkBox").append("일반상품 <br/>");
				}
			}
			
			$.ajax({
				type : 'post',
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
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
					if(result == 'SUCCESS' && strAmount != ""){
						alert("등록 되었습니다.");
						if(represent == true){
							count += 1;
						}
						// 폼 태그 비우기.
						strmenuName = $("#items").val("");
						strAmount = $("#amount").val("");
						represent = $("input:checkbox[id='flexCheckDefault']").prop("checked", false);
						
					}else{
						alert("다시 등록해주세요.");
						strmenuName = $("#items").val("");
						strAmount = $("#amount").val("");
						represent = $("input:checkbox[id='flexCheckDefault']").prop("checked", false);
					}
				},
				error : function(result){
					if(result != 'SUCCESS'){
						alert("다시 등록해주세요.");
					}
				}
			});
			
		});
		// 대표 상품 여부 체크 제한
		$(document).ready(function(){
			$("input[type='checkbox']").on("click", function(){
				//let count = $("input:checked[type='checkbox']").length;
				//count = $("#checkBox").val("대표상품").length;
				console.log(count);
				if(count > 2){
					$(this).prop("checked", false);
					alert("3개까지만 선택할 수 있습니다.");
				}
			});
		});
		
		$("#submitBtn").on("click", function(){
			location.reload();
		});
		
	</script>
</div>
<footer class="footer">
    <hr>
    <div class="container">
        <address>
    
            ADD :서울특별시 신촌로 Katydid빌딩 3층<br>
            PNUM : 02-0101-0101<br>
            COPYRIGHT &copy; Katydid ALL Rights Reserved
    
        </address>
    </div>
</footer>

</body>
</html>





