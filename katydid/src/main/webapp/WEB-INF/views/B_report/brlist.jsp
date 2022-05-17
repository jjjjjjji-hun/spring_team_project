<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
     
     
   
     <h1>게시글 신고 목록</h1>
${b_reportList}

		
<div class="container">		 
		<table border="1" class="table table">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>댓글 번호</th>
					<th>작성자</th>
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
						<td>${""}</td>
						<td>${b_report.reason}</td>
						<td><a href="/B_report/list/${b_report.b_reno}">${b_report.content}</a></td>
						<td><div class="form-check"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">관리자체크</label></div></td>
                    </tr>
				</c:forEach>
			</tbody>
	</table>
	<!--  <a href="/R_report/insert" class="btn btn-success">글쓰기</a><br/>-->
</div>
	
	
	 <!-- jquery cdn 가져오기 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script> 
/*
	 result = false;
	  if(#flexCheckDefault == checked){
	    result = true;
	    console.log("true");
	    
	    else{
	    	result = false;
	     console.log("false")	
	    }
	    }*/
	    
</script>
  
  
					
</body>
</html>