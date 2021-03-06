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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <style>
            *{
            margin: 0;
            padding: 0;
            position: relative;
            font-family: 'Noto Sans KR', sans-serif;
            list-style: none;
            }
           
        
            
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
            .first {
            width: 250px;
            height: 40px;
            display: inline-block;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            color: #999999;
            border-radius: 5px;
            
           }
           
           .last {
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
            margin-top: 20px
        
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
            margin-top: 20px
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
                            <button type="button" class="btn btn-outline-danger" onclick="location.href='#' ">????????????</button>&nbsp;
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
                <form action="/board/update" method="post">
                    <h1 class="text text=primary">${board.bno}??? ??? ???????????????</h1>
                    <input type="hidden" name="bno" value="${board.bno}"/>
                    <input type="text" name="title" class="title" placeholder="TITLE" value="${board.title}" required/><br/>
                    <input type="text" class="writer" placeholder="WRITER" value="${board.u_id}" readonly/><br/>
                    ????????? : <input type="text" class="first" value= "${board.regdate}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    ????????? ???????????? : <input type="text" class="last" value= "${board.updatedate}"/> <br/><br/>
                    <textarea name="content" rows="15" cols="30" class="content" placeholder="CONTENT">${board.content }</textarea>
                    
                    <input type="hidden" name="pageNum" value="${param.pageNum}"/>
                    <input type="hidden" name="searchType" value="${param.searchType}"/>
                    <input type="hidden" name="keyword" value="${param.keyword}"/>
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                    <input type="submit" class="submit" value="??????"/>&nbsp;&nbsp;&nbsp;<input type="reset" class="reset" value="?????????"/>
                </form>
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