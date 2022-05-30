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
                float: center;
            }
        
        
            h1 { 
            text-align: center; 
            }
            
            #container {
              width: 1000px;
              margin: 0px auto;
              padding: 20px;
              float: center;
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
                            <button type="button" class="btn btn-outline-danger" onclick="location.href='/notify/list' ">공지사항</button>&nbsp;
                            <sec:authorize access="hasAnyRole('ROLE_MEMBER')">
									<button type="button" class="btn btn-secondary" onclick="location.href='/category/test'">맛집등록</button>
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
                                <th>공지사항</th>
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
            
        
            <div id ="container">
                <h1>공지사항 목록</h1>
                <table border="1" class="table table-hover">
                    <thead>
                        <tr>
                            <th>글 제목</th>
                            <th>글 본문</th>
                            <th>쓴 날짜</th>
                            <th>수정 날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="list" items="${notifyList }">
                            <tr>
                                <td><a href="/notify/detail/${list.nno}">${list.title}</a></td>
                                <td>${list.content}</td>
                                <td>${list.regdate}</td>
                                <td>${list.updatedate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
	</div>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<button type="button" class="btn btn-secondary" onclick="location.href='/notify/insert'">공지사항 작성</button>
	</sec:authorize>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<button type="button" class="btn btn-light " onclick="location.href='/'">메인가기</button>
	
	
	
	
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