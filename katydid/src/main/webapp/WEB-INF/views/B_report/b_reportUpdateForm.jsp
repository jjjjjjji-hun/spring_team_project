<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>수정폼접근</h1>
   <h1>1111</h1>
      
      <div class="container">
		<form action="/B_report/update" method="post">
			<h1 class="text text=primary">${b_report.b_reno}번 글 수정페이지</h1>
			         <input type="hidden" name="rno" value="${b_report.b_reno}"/>
			신고 번호: <input type="number" name="rno" value="${b_report.bno}"readonly/>
			
			신고사유 : <input type="text" name="reason" value="${b_report.reason}"/><br/>
			신고 상세이유 : <textarea rows="15" class="form-control"name="content">${b_report.content}</textarea>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<input type="submit" value="수정"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"/>
		</form>
	</div>
</body>
</html>