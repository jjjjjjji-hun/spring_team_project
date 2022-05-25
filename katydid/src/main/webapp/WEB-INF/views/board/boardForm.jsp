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
									<option value="${list }">${list }</option>
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