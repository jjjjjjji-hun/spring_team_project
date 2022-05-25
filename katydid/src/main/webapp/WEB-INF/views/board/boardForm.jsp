<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    list-style: none;
    }
   

    
    body{background-color: white; width: 100%; max-width:1500px; margin: 0 auto;}

    .col-md-12{
        margin-top: 20px;
        text-align: center;
    }
    

    .row-nav1{
        text-align: center;
    }
    .row-nav2{
        text-align: center;
    }



    .container {
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
    width: 250px;
    height: 40px;
    display: inline-block;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    color: #999999;
    border-radius: 5px;
    
   }
   
   .S_kind {
    width: 250px;
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
        <div class="col-md-12">
            <img width="90px" height="90px" src="resources2/img/Katydid.gif">
            <a href="/"><img src="resources2/img/katydidtitle.png" width="250px" height="90px"  border="0"></a>
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
                    <input type="submit" class="btn btn-outline-secondary" value="검색하기">&nbsp;
                    <button type="button" class="btn btn-outline-danger" onclick="location.href='#' ">공지사항</button>&nbsp;
                    <button type="button" class="btn btn-secondary" onclick="location.href='/category/test' ">맛집등록</button>
                    
                    
                </form>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row-nav2">
        <div class="col-md-12">이것은 공지사항이다.</div>
        
    </div>
    
   
    <hr>
    

    <div class="container">
		<form action="/board/insert" method="post">
			<input type="text" name="title" class="title" placeholder="TITLE" required/><br/>
			<br/><input type="text" name="u_id" class="writer" placeholder="WRITER"required/><br/>
			<br/>&emsp;category : <select class="L_kind">
							<option value="">선택해주세요</option>
								<c:forEach var="list" items="${category }">
									<option value="${list.c_class }">${list.c_class }</option>
								</c:forEach>
					</select>
                &emsp;place : <select class="S_kind">
					<option value="">선택해주세요</option>
								<c:forEach var="list" items="${category }">
									<option value="${list }">${list.ward }</option>
								</c:forEach>
			 	  </select><br/>
            <br/><textarea name="content" rows="15" cols="30" class="content" placeholder="CONTENT"></textarea>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" /><br/>
			<br/><input type="submit" class="submit" value="제출" />&nbsp;&nbsp;&nbsp;<input type="reset" class="reset" value="초기화"/>
		</form>
		<h3>첨부파일 영역</h3>
			<div class="uploadDiv">
				<input type="file" name="uploadFile" multiple>
			</div>
			
			<div class="uploadResult">
				<ul>
					<!-- 업로드된 파일이 들어갈 자리 -->
				</ul>
			</div>
			<button id="uploadBtn">Upload</button>
			
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		$(document).ready(function(){
									// .(문자한개)*(개수제한없음) \. (.을  아무문자 1개가 아닌 . 자체로 쓸때)
									// "(.*?)@(.*?)\.(com|net)$" <- 이메일 검증 정규표현식
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB
			
			function checkExtension(fileName, fileSize){
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
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
				
				// 파일 데이터를 폼에 집어넣기
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
						// 업로드 성공 시 미리 복사해둔 .uploadDiv로 덮어씌워서 첨부파일이 없는 상태로 되돌리기
						$(".uploadDiv").html(cloneObj.html())
						alert("Uploaded");
					}
				});//ajax
			});// onclick uploadBtn
			
			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr){
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					// BoardAttachVO내부에서 이미지여부를 fileType변수에 저장하므로 obj.image -> obj.fileType
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
						// 수정 코드
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
			
			// 글쓰기 버튼 클릭 시, 첨부파일 정보를 폼에 추가해서 전달하는 코드
			$("#submitBtn").on("click", function(e){
				// 1. 글쓰기버튼을 눌렀을때 바로 작동하지 않도록 기능 막기
				e.preventDefault();
				
				// 2. var formObj = $("form"); 로 폼태그를 가져옵니다
				var formObj = $("form");
				
				// formObj내부에 hidden 태그들을 순서대로 만들어줍니다.
				var str="";
				
				// 3. 5월 19일 수업에서는 첨부파일 내에 들어있던 이미지 정보를 콘솔에 찍기만 하고 종료하고
				// 내일 수업에 DB에 넣는부분까지 진행합니다.
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
				// 폼태그에 위의 str내부 태그를 추가해주는 명령어, .submit() 을 추가로 넣으면 제출 완료
				formObj.append(str).submit();
			});
			
		});// document
		
		
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