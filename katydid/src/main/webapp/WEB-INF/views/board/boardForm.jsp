<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      width: 1000px;
      margin: 0px auto;
      padding: 20px;
      text-align: center;
    }
    
    .title {
      display: inline-block;
      height: 40px;
      padding: 0 10px;
      vertical-align: middle;
      border: 1px solid #dddddd;
      width: 1000px;
      color: #999999;
      border-radius: 5px;
    }
    .writer{
      width: 1000px;
      height: 40px;
      display: inline-block;
      padding: 0 10px;
      vertical-align: middle;
      border: 1px solid #dddddd;
      color: #999999;
      border-radius: 5px;

    }
    .L_kind {
    width: 200px;
    height: 40px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
    
   }
   
   .S_kind {
    width: 200px;
    height: 40px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
   }
   
   .Store {
    width: 200px;
    height: 40px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
   }
   .content{
    width: 1000px;
    height: 600px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
   }
   .submit {
    width: 300px;
    height: 50px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;

   }
   .reset{
    width: 300px;
    height: 50px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
   }
	.uploadResult{
	width:100%;
	background-color: gray;
	}
	.uploadResult ul{
	display : flex;
	flex-flow : row;
	justify-content : center;
	align-items: center;
	}
	.uploadResult ul li{
	list-style : none;
	padding : 10px;
	}
	.uploadResult ul li img{
	width : 20px;
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
		<form action="/board/insert" method="post">
			<input type="text" name="title" class="title" placeholder="TITLE" required/><br/>
			<sec:authentication property="principal.username" var="u_id"/>
			<br/><input type="text" name="u_id" class="writer" value="${u_id }" placeholder="WRITER" readonly/><br/>
			<br/>&emsp;category : <select class="L_kind">
							<option value="">??????????????????</option>
								<c:forEach var="list" items="${category }">
									<option value="${list.c_class }">${list.c_class }</option>
								</c:forEach>
					</select>
                &emsp;place : <select class="S_kind">
					<option value="">??????????????????</option>
								<c:forEach var="list" items="${category }">
									<option value="${list }">${list.ward }</option>
								</c:forEach>
			 	  </select>
			 	  &emsp;store : <select class="Store" name="stno">
					<option value="">??????????????????</option>
								<c:forEach var="list" items="${store }">
									<option value="${list.stno }">${list.storeName }</option>
								</c:forEach>
			 	  </select><br/>
            <br/><textarea name="content" rows="15" cols="30" class="content" placeholder="CONTENT"></textarea>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" /><br/>
			<br/><input type="submit" class="submit" value="??????" />&nbsp;&nbsp;&nbsp;<input type="reset" class="reset" value="?????????"/>
		</form><br>
		<h3>FILE</h3>
			<div class="uploadDiv">
				<input type="file" name="uploadFile" class="btn btn-light" multiple>
			</div>
			
			<div class="uploadResult">
				<ul>
					<!-- ???????????? ????????? ????????? ?????? -->
				</ul>
			</div>
			<button id="uploadBtn" class="btn btn-outline-secondary"">Upload</button>
			
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		$(document).ready(function(){
									// .(????????????)*(??????????????????) \. (.???  ???????????? 1?????? ?????? . ????????? ??????)
									// "(.*?)@(.*?)\.(com|net)$" <- ????????? ?????? ???????????????
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("?????? ????????? ??????");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("?????? ????????? ????????? ????????? ??? ??? ????????????.");
					return false;
				}
				return true;
			}
			
			var cloneObj = $(".uploadDiv").clone();
			
			$("#uploadBtn").on("click", function(e){
				let formData = new FormData();
				let inputFile = $("input[name='uploadFile']");
				let files = inputFile[0].files;
				console.log(files);
				
				// ?????? ???????????? ?????? ????????????
				for(var i = 0; i < files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					dataType : 'json',
					success : function(result){
						console.log(result);
						
						showUploadedFile(result);
						// ????????? ?????? ??? ?????? ???????????? .uploadDiv??? ??????????????? ??????????????? ?????? ????????? ????????????
						$(".uploadDiv").html(cloneObj.html())
						alert("Uploaded");
					}
				});//ajax
			});// onclick uploadBtn
			
			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr){
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					// BoardAttachVO???????????? ?????????????????? fileType????????? ??????????????? obj.image -> obj.fileType
					if(!obj.fileType){
						
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
						str += "<li "
							+ "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
							+ "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType
							+ "'><a href='/download?fileName=" + fileCallPath
							+ "'>" + "<img src='/resources2/img/Katydid.gif'>"
							+ obj.fileName + "</a>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='file'> X </span>"
							+ "</li>";
					}else{
						//str += "<li>" + obj.fileName + "</li>"
						// ?????? ??????
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						var fileCallPathOriginal = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
						str += "<li "
							+ "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid
							+ "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType
							+ "'><a href='/download?fileName=" + fileCallPathOriginal
							+ "'>" + "<img src='/display?fileName=" + fileCallPath 
							+ "'>" + obj.fileName + "</a>"
							+ "<span data-file=\'" + fileCallPath + "\' data-type='image'> X </span>"
							+ "</li>";
						
					}
					
				});
				uploadResult.append(str);
			}// showUploadedFile			
			
			$(".uploadResult").on("click", "span", function(e){
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url : '/deleteFile',
					beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					data : {fileName : targetFile, type : type},
					dataType : 'text',
					type : 'POST',
					success : function(result){
						alert(result);
						targetLi.remove();
					}
				})//ajax
			});//click span
			
			// ????????? ?????? ?????? ???, ???????????? ????????? ?????? ???????????? ???????????? ??????
			$(".submit").on("click", function(e){
				// 1. ?????????????????? ???????????? ?????? ???????????? ????????? ?????? ??????
				e.preventDefault();
				
				// 2. var formObj = $("form"); ??? ???????????? ???????????????
				var formObj = $("form");
				
				// formObj????????? hidden ???????????? ???????????? ??????????????????.
				var str="";
				
				// 3. 5??? 19??? ??????????????? ???????????? ?????? ???????????? ????????? ????????? ????????? ????????? ?????? ????????????
				// ?????? ????????? DB??? ?????????????????? ???????????????.
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.log(jobj);
					str += "<input type='hidden' name='attachList[" + i + "].fileName'"
						+ " value='" + jobj.data("filename") + "'>"
						+ "<input type='hidden' name='attachList[" + i + "].uuid'"
						+ " value='" + jobj.data("uuid") + "'>"
						+ "<input type='hidden' name='attachList[" + i + "].uploadPath'"
						+ " value='" + jobj.data("path") + "'>"
						+ "<input type='hidden' name='attachList[" + i + "].fileType'"
						+ " value='" + jobj.data("type") + "'>"				
				});
				// ???????????? ?????? str?????? ????????? ??????????????? ?????????, .submit() ??? ????????? ????????? ?????? ??????
				formObj.append(str).submit();
			});
			
		});// document
		
		
	</script>		
			
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
    </body>
    </html>