<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	                            <input type="checkbox" name="remember-me"/>???????????????<br/>
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

     <div class="row-nav1">
        <div class="col-md-12">
            <div class="row">
                <!-- ????????? ?????? -->
                <form action="/board/list" method="get">
                    <!--  select ????????? ????????? ????????? ??????????????? ????????????????????? ???????????????.  -->
                    <select name="searchType">
                        <!-- ??????????????? option????????? ????????? ????????????.  -->
                        <option value="n">-</option>
                        <option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : '' }>??????</option>
                        <option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected' : '' }>??????</option>
                        <option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : '' }>?????????</option>
                        <option value="tc" ${pageMaker.cri.searchType eq 'tc' ? 'selected' : '' }>??????+??????</option>
                        <option value="cw" ${pageMaker.cri.searchType eq 'cw' ? 'selected' : '' }>??????+?????????</option>
                        <option value="tcw" ${pageMaker.cri.searchType eq 'tcw' ? 'selected' : '' }>??????+??????+?????????</option>
                    </select>
                    <input type="text" name="keyword" placeholder="?????????" value="${pageMaker.cri.keyword }">
                    <input type="submit" class="btn btn-outline-secondary" value="????????????">&nbsp;
                    <button type="button" class="btn btn-outline-danger" onclick="location.href='/notify/list' ">????????????</button>&nbsp;
                    <sec:authorize access="hasAnyRole('ROLE_MEMBER')">
						<button type="button" class="btn btn-secondary" onclick="location.href='/category/test'">????????????</button>
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
						<th>????????????</th>
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
      <div id="joinForm">
        <h1><span style="font-family: 'Nanum Pen Script', cursive;">Sign_up</span></h1>
        <form id="join" name="join" action="/user/join" method="post">	
            <div class="mb-3">
                <input type="text" name="u_id" value="" class="form-control" id="formGroupExampleInput" placeholder="ID" required>
                <button type="button" class="idconfirm" style="float: right" >ID check</button><br/>
                <input type="password" name="upw" value="" class="form-control" id="formGroupExampleInput2" placeholder="Password" required><br/>
                <input type="password" name="upwCheck" class="form-control" placeholder="PasswordCheck" required /><br/>
                <input type="text" name="uname" value="" class="form-control" id="formGroupExampleInput2" placeholder="Name" required><br/>
                <input type="text" name="pnum" value="" class="form-control" id="formGroupExampleInput2" placeholder="P-Num" required><br/>
                &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="radio" name="role" value="ROLE_MEMBER">??????
                &emsp;&emsp;<input type="radio" name="role" value="ROLE_USER">????????????
                &emsp;&emsp;<input type="radio" name="role" value="ROLE_ADMIN">?????????
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/><br/>
                <input type="hidden" name="idCheck" id="idCheck" required/><br/>
                <button type="button" style="display:block; width:100%; text-align:center; font-size:1em;" class="btn btn-secondary">Sign_in</button>
            </div>
        </form>
  </div>
</div>

  <footer class="footer">
    <hr>
    <div class="container">
        <address>
    
            ADD :??????????????? ????????? Katydid?????? 3???<br>
            PNUM : 02-0101-0101<br>
            COPYRIGHT &copy; Katydid ALL Rights Reserved
    
        </address>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	
	<script type="text/javascript">
	
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		let form = document.join;
		
		$(".idconfirm").on("click", function() {
			
			let userid = form.u_id.value;
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
						alert("??????????????? ???????????????!");
						$("#idCheck").val(true);
					} else {
						alert("?????? ???????????? ?????? ???????????????.");
					}
				}
			});	
		
		});
		
		$(".btn-secondary").on("click", function check(e) {
			
			console.log(!$("#idCheck").val());
			
			userid = form.u_id.value;
			let pw = form.upw.value;
			let pwCheck = form.upwCheck.value;
			let uname = form.uname.value;
			let pnum = form.pnum.value;
			
			console.log(!(pw === pwCheck));
			
			if(!userid) {
				alert("???????????? ??????????????????!")
				return false;
			}

			if(!$("#idCheck").val()) {
				alert("???????????? ??????????????????.");
				return false;
			}
			
			if(!pw) {
				alert("??????????????? ??????????????????!")
				return false;
			}

			if(!(pw == pwCheck)) {
				form.upw.focus();
				form.upw.select();
				form.upw.value = "";
				form.upwCheck.value = "";
				alert("??????????????? ?????? ????????????.");
				return false;
			}
			
			if(!uname) {
				alert("????????? ??????????????????!")
				form.uname.focus();
				form.uname.select();
				return false;
			}
			
			if(!pnum) {
				alert("??????????????? ??????????????????!")
				form.pnum.focus();
				form.pnum.select();
				return false;
			}
			
			form.submit();
		});
	
	</script>

</body>
</html>