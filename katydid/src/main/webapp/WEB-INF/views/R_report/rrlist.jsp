<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    
    <h1>댓글 신고리스트</h1>
       ${r_reportList}
     <div class="container">   
       <table border="1" class="table table">
		<thead>
			<tr>
				<th>신고 번호</th>
				<th>댓글 번호</th>
				<th>신고 사유</th>
				<th>신고 상세내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r_report" items="${r_reportList}">
				<tr>
					<td>${r_report.r_reno}</td>
					<td>${r_report.rno}</td>
					<td>${r_report.reason}</td>
					<td><a href="/R_report/list/${r_report.r_reno}">${r_report.content}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!--  <a href="/R_report/insert" class="btn btn-success">글쓰기</a><br/>-->
	</div>
	
	
	<!-- 페이지네이션 -->
	 <!-- 이전 페이지 버튼 보일지 결정하는 부분 -->
  	  <ul class="pagination justify-content-center">
		  	<c:if test="${pageMaker.prev }">
		    	<li class="page-item">
		    		<a class="page-link" href="/R_report/R_relist?pageNum=${pageMaker.startPage -1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    		&laquo;
		    		</a>
		    	</li>
		    </c:if>
		  
		    <!-- 밑에 깔아줄 버튼들 -->
		      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		    	<li class="page-item${pageMaker.cri.pageNum eq idx ? ' active' : '' }">
		    		<a class="page-link" href="/R_report/R_relist?pageNum=${idx}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    			${idx}
		    		</a>
		    	</li>
		    </c:forEach>
		    
		    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		    	<li class="page-item">
		    		<a class="page-link" href="/R_report/R_relist?pageNum=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
		    			&raquo;
		    		</a>
		    	</li>
		    </c:if>
		  </ul>
	
	
	
    	<button type="button" class="btn btn-primary"onclick="location.href='http://localhost:8181/user/admin'">어드민페이지</button>
    
     <!-- jquery cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
   
	 <ul id="replies">
	
		</ul>
  
  
    <script>
     // let r_reno = $r_report.r_reno}; 
       
   // 전체 댓글 가져오기
/*		    function getAllList(){
			// $.getJSON은 입력한 주소에 get방식으로 요청을 넣습니다.
						// 주소   			  // 콜백함수 주소 요청으로 얻어온 json을 어떻게 처리할지
			$.getJSON("/R_report/all/", function(data){
				// 문자열을 이용해 태그를 생성하거나 끼워넣을 수 있으므로
				// 빈 문자열을 만들어놓고 거기에 댓글정보를 저장해 화면에 전송
				let str = "";
				
				// 데이터를 제대로 들고왔는지 디버깅
				console.log(data);
				
				$(data).each(function(){
				
				
					
					// 하나하나 반복되는 각 데이터는 this라는 키워드로 표현됩니다.
					//console.log("----------------");
					//console.log(this);
					str += "<div class='reason' data-r_reno='"+ this.r_reno +"'><strong>@"
					    + this.reason + "</strong> -" "<br>"
					    +"<div class='content'>" +this.content + "</div>"
					
					
				});
				// #replies사이에 끼워넣을수있도록 console.log()로 디버깅
				console.log(str);
				$("#replies").html(str);
			
			});
		}		
		getAllList();// 댓글 전체 들고와서 #replies에 심어주는 로직 실행
		*/
	</script>
	
</body>
</html>