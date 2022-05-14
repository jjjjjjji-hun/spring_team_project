<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입창</h1>
	<form id="join" name="join" action="/user/join" method="post">
		아이디 : <input type="text" name="u_id" class="userid" required/>
		<button type="button" class="idconfirm" >아이디 확인하기</button><br/>
		비밀번호 : <input type="password" name="upw" required /><br/>
		비밀번호 확인 : <input type="password" name="upwCheck" required /><br/>
		이름 : <input type="text" name="uname" required /><br/>
		전화번호 : <input type="text" name="pnum" required /><br/>
		<input type="radio" name="role" value="ROLE_ADMIN" required />어드민 권한&nbsp;&nbsp;&nbsp;
		<input type="radio" name="role" value="ROLE_MEMBER" required />정회원 권한&nbsp;&nbsp;&nbsp;
		<input type="radio" name="role" value="ROLE_USER" required />준회원
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/><br/>
		<input type="hidden" name="idCheck" id="idCheck"/><br/>
		<input type="submit" id="submit" value="가입하기" /> <br/>
	</form>
	
	<!-- jquery, ajax cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<script type="text/javascript">
		
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		let form = document.join;
		
		$(".idconfirm").on("click", function() {
			let userid = $(".userid").val();
			console.log(userid);
			
			$.ajax({
				type : 'post',
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
				url : '/user/idConfirm',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					u_id : userid
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("회원가입이 가능합니다!");
						$("#idCheck").val(true);
					} else {
						alert("해당 아이디가 이미 존재합니다.");
					}
				}
			});	
		
		});
		
		$("#submit").on("click", function(e) {
			e.preventDefault();
			
			let pw = form.upw.value;
			let pwCheck = form.upwCheck.value;
			
			if(pw != pwCheck) {
				form.upw.focus();
				form.upw.select();
				form.upw.value = "";
				form.upwCheck.value = "";
				alert("패스워드가 서로 다릅니다.");
			} else {
				if(!$("#idCheck").val()) {
					alert("아이디를 확인해주세요.");
				} else {
					$("#join").submit();
				}
			}
			
			$(this).unbind('click').click();
		});
	
	</script>
	
</body>
</html>