<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form action="미정" method="post">
			지역 : <select class="area">
							<option value="">선택해주세요</option>
								<c:forEach var="area" items="${areaList }">
									<option value="${area }">${area.ward }</option>
								</c:forEach>
					</select>&nbsp;&nbsp;
			대분류 : <select class="L_kind">
					<option value="">선택해주세요</option>
								<c:forEach var="l_kind" items="${l_kindList }">
									<option value="${l_kind }">${l_kind.k_group }</option>
								</c:forEach>
			 	  </select>&nbsp;&nbsp;
			소분류 : <select class="S_kind">
					<option value="">선택해주세요</option>
								<c:forEach var="s_kind" items="${s_kindList }">
									<option value="${s_kind }">${s_kind.s_class }</option>
								</c:forEach>
			 	  </select><br/>
			<input type="submit" value="제출"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"/>
		</form>
	</div>
</body>
</html>