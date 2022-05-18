<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
     
     
   
     <h1>게시글 신고 목록</h1>
<!--  ${b_reportList}-->

		
<div class="container">		 
		<table border="1" class="table table">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>댓글 번호</th>
					<th>신고자</th>
					<th>신고 사유</th>
					<th>신고 상세내용</th>
					<th>관리자체크사항</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b_report" items="${b_reportList}">
					<tr>
						<td>${b_report.b_reno}</td>
						<td>${b_report.bno}</td>
						<td>${b_report.u_id}</td>
						<td>${b_report.reason}</td>
						<td><a href="/B_report/list/${b_report.b_reno}">${b_report.content}</a></td>
						<td><div class="form-check"><input class="form-check-input" type="checkbox" value="${b_report.b_reno}" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">관리자체크</label></div></td>
                    </tr>
				</c:forEach>
			</tbody>
	</table>
	<!--  <a href="/R_report/insert" class="btn btn-success">글쓰기</a><br/>-->
</div>

<!-- 페이지네이션 -->
<!-- 페이지네이션 -->
<!-- 페이지네이션 -->
	 <!-- 이전 페이지 버튼 보일지 결정하는 부분 -->
	<!--  	  <ul class="pagination justify-content-center">
		  	<c:if test="${pageMaker.prev }">
		    	<li class="page-item">
		    		<a class="page-link" href="/B_report/B_relist?pageNum=${pageMaker.startPage -1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    		&laquo;
		    		</a>
		    	</li>
		    </c:if>
		    -->
		    <!-- 밑에 깔아줄 버튼들 -->
		<!--      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		    	<li class="page-item${pageMaker.cri.pageNum eq idx ? ' active' : '' }">
		    		<a class="page-link" href="/B_report/B_relist?pageNum=${idx}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    			${idx}
		    		</a>
		    	</li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		    	<li class="page-item">
		    		<a class="page-link" href="/B_report/B_relist?pageNum=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    			&raquo;
		    		</a>
		    	</li>
		    </c:if>
		  </ul>
	-->
	 <!-- jquery cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script> 
/*
	document.addEventListener('DOMContentLoaded', () => ){
	const checkbox = document.querySelector('input[type=checkbox]')
	checkbox.addEventListener('change', () => {
		if(checkbox.checked){
			checkboxResult.textContent ='체크'
		}else{
			checkboxResult.textContent ='해제'
		})
	})
		
	*/
	/////////////
		$(document).ready(function(){
			$("input[type='checkbox']").on("click", function(){
				let a = $("input:checked[type='checkbox']").val();
				
				
					alert(a + "번 신고글을 확인하였습니다.");
					//$("checked").val("disabled");
					//$("input:checked[type='checkbox']").val("next"+a);
				
			});
		});
	
    </script>
  
  
					
</body>
</html>