<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
        <title>katydid</title>

<style>
*{
    margin: 0;
    padding: 0;
    position: relative;
    font-family: 'Noto Sans KR', sans-serif;
    list-style: none;}


    
    body{background-color: white; width: 100%; max-width:1200px; margin: 0 auto;}

    .col-md-7{
        margin-top: 20px;
        text-align: right;
    }
    .col-md-5{
        margin-top: 50px;
        text-align: right;
    }

    .row-nav1{
        text-align: center;
    }
    .row-nav2{
        text-align: center;
    }

    #container {
          width: 500px;
          margin: 0px auto;
          padding: 20px;
          float: center;
        }
        #joinForm > h1 {
            font-size: 60px;
            text-align: center;
        }
    
        

    
    .footer { text-align: center; clear : both;} 
  </style>
  <script>
      $(()=>{
        $(".hover").hover(function(){
                    $(this).css("color", "red");
                }, function(){
                    $(this).css("color", "red");
                });

        });
  </script>
</head>
<body>
    
    <div class="row header">
        <div class="col-md-7">
            <a href="/"><img src="resources2/img/katydidtitle.png" width="230px" height="90px"  border="0"></a>
        </div>
        <div class="col-md-5">
            <img width="50px" height="50px" src="resources2/img/Katydid.gif">
            <button type="button" class="btn btn-light" onclick="location.href='/login' ">Login</button>
            <button type="button" class="btn btn-light" onclick="location.href='/user/join' ">Sign_up</button>

        </div>
    </div>
    <hr/>

    <div class="row-nav1">
        <div class="col-md-12">
            <div class="row">
                <!-- 검색창 부분 -->
                <form action="/board/boardList" method="get">
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
                    <input type="submit" value="검색하기">&emsp;
                            <a href="#" class="hover">공지사항</a>&emsp;<a href="#" class="hover">맛집등록</a>
                    
                </form>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row-nav2">
        <div class="col-md-12">이것은 공지사항이다.</div>
        
    </div>
   
    <hr>

  <div id="container">
      <div id="joinForm">
        <h1><span style="font-family: 'Nanum Pen Script', cursive;">Sign_up</span></h1>
        <form id="join" name="join" action="/user/join" method="post">	
            <div class="mb-3">
                <input type="text" name="u_id" value="" class="form-control" id="formGroupExampleInput" placeholder="ID"><br/>
                <button type="button" class="idconfirm" >아이디 확인하기</button><br/>
                <input type="password" name="upw" value="" class="form-control" id="formGroupExampleInput2" placeholder="Password"><br/>
                <input type="password" name="upwCheck" class="form-control" placeholder="PasswordCheck" required /><br/>
                <input type="text" name="uname" value="" class="form-control" id="formGroupExampleInput2" placeholder="Name"><br/>
                <input type="text" name="pnum" value="" class="form-control" id="formGroupExampleInput2" placeholder="P-Num"><br/>
                &emsp;&emsp;&emsp;<input type="radio" name="role" value="ROLE_ADMIN">어드민 권한&nbsp;&nbsp;&nbsp;
                &emsp;&emsp;&emsp;<input type="radio" name="role" value="ROLE_MEMBER">정회원 권한&nbsp;&nbsp;&nbsp;
                &emsp;&emsp;&emsp;<input type="radio" name="role" value="ROLE_USER">준회원<br/>
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/><br/>
                <input type="hidden" name="idCheck" id="idCheck"/><br/>
                <input type="submit" style="display:block; width:100%; text-align:center; font-size:1em;" class="btn btn-secondary" value="Sign_in"></input>
            </div>
        </form>
    </div> 
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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<script type="text/javascript">
	
		let userid = document.getElementsByName("u_id")[0].value;
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		let form = document.join;
		
		$(".idconfirm").on("click", function() {
			
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
		
		$(".btn btn-secondary").on("click", function(e) {
			e.preventDefault();
			
			let pw = form.upw.value;
			let pwCheck = form.upwCheck.value;
			
			if(!pw.equals(pwCheck)) {
				form.upw.focus();
				form.upw.select();
				form.upw.value = "";
				form.upwCheck.value = "";
				alert("패스워드가 서로 다릅니다.");
			} else {
				if($("#idCheck").val()) {
					$("#join").submit();
				} else {
					alert("아이디를 확인해주세요.");
				}
			}
			
			$(this).unbind('click').click();
		});
	
	</script>

</body>
</html>