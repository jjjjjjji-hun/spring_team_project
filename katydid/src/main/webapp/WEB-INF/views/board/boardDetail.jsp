<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<!DOCTYPE html>
	<html>
	<head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
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
        
        	h1 { 
            text-align: center; 
            }
        
            #container {
              width: 1000px;
              margin: 0px auto;
              padding: 20px;
            }
           
            .NUMBER {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 1000px;
            color: #999999;
            border-radius: 5px;
            }

            .TITLE {
            display: inline-block;
            height: 40px;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            width: 1000px;
            color: #999999;
            border-radius: 5px;
            }
            .CONTENT{
            width: 1000px;
            height: 600px;
            display: inline-block;
            padding: 0 10px;
            vertical-align: middle;
            border: 1px solid #dddddd;
            color: #999999;
            border-radius: 5px;
        }
            




            #modDiv{
			width: 450px;
			height: 130px;
			background-color: black;
			position: fixed;
			top: 50%;
			left: 50%;
			margin-top: -50px;
			margin-left: -150px;
			padding:10px;
			z-index:1000;
		}
		#reply{
		width: 400px;
		}
		
		#modRep{
			width: 450px;
			height: 190px;
			background-color: darkred;
			position: fixed;
			top: 50%;
			left: 50%;
			margin-top: -50px;
			margin-left: -150px;
			padding:10px;
			z-index:1000;
		}

   
   
    .modal_close> a{
        display: block;
        width: 100%;
        height: 100%;
        background:url(https://img.icons8.com/metro/26/000000/close-window.png);
        text-indent: -9999px;
    }

  .boardReportText{
     width: 250px;
		height: 100px;
		background-color: red;
		position: static;
		top: 70%;
		left: 70%;
		margin-top: 40px;
		margin-left: 20px;
		padding:30px;
		z-index:1000;
		font-size:25px;
		word-wrap:break-word

   }

		
		.modal-title{color:white;}
		
	  
		 	#newB_Reportreason{
		 	    width:300px;
		 	}	
		                         	
			.modal_wrap{
			display: none;
			padding : 10px;
			width: 300px;
			height: 180px;
			position: fixed;
			top:50%;
			left: 50%;
			margin: -250px 0 0 -250px;
			background-color: darkred;
			z-index: 2;
					}
			
			.modal_close{
			width: 26px;
			height: 26px;
			position: absolute;
			top: -30px;
			right: 0;
			 }
			 #newB_Reportreason, #board_u_id, #newB_ReportContent{
			 width: 250px;
			 }
															

	
	  .boardReportText{
	     width: 250px;
			height: 100px;
			background-color: red;
			position: static;
			top: 70%;
			left: 70%;
			margin-top: 40px;
			margin-left: 20px;
			padding:30px;
			z-index:1000;
			font-size:25px;
			word-wrap:break-word
	
	   }
	.uploadResult{
	width:100%;
	background-color: white;
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
	align-content :center;
	text-align : center;
	}
	.uploadResult ul li img{
	width : 30%;
	}


#MessageModal{
			width: 250px;
			height: 130px;
			background-color: skyblue;
			position: fixed;
			top: 50%;
			left: 50%;
			padding:10px;
			z-index:1000;
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

                    <div class="container">
                        <h1 class="text text=primary">${board.bno}??? PAGE</h1>
                        NUBER <input type="text" class="NUMBER" value="${board.bno}" readonly/>
                        TITLE <input type="text" class="TITLE" value="${board.title}" readonly/><br/>
                        WRITER <span onclick="messageModal(this)" class="reportedId">${board.u_id}</span><br/>
                        CONTENT <textarea rows="15" class="CONTENT" readonly>${board.content}</textarea>
                        <div class="row">
                            <div class="col-md-6">????????? : ${board.regdate}&nbsp;&nbsp;&nbsp;</div>
                            <div class="col-md-6">????????? ???????????? : ${board.updatedate}</div><br/><br/>
                        </div>
                            
                        <div class="row">
                            <div class="col-md-3">	
                               <a href="/board/list?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-outline-success">????????? ??????</a>
                            </div>
                            <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER','ROLE_USER')">
	                            <sec:authentication property="principal.username" var="u_id"/>
		                            <c:if test="${u_id eq board.u_id}">
		                                <div class="col-md-3">
		                                    <form action="/board/updateForm" method="post">
		                                        <input type="hidden" value="${board.bno}" name="bno"/>
		                                        <input type="hidden" value="${param.pageNum}" name="pageNum"/>
		                                        <input type="hidden" value="${param.searchType}" name="searchType"/>
		                                        <input type="hidden" value="${param.keyword}" name="keyword"/>
		                                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		                                        <input type="submit" value="????????? ??????" class="btn btn-outline-warning"/>
		                                    </form>
		                                </div>
		                                <div class="col-md-3">
		                                    <form action="/board/delete" method="post">
		                                        <input type="hidden" value="${board.bno}" name="bno"/>
		                                        <input type="hidden" value="${param.pageNum}" name="pageNum"/>
		                                        <input type="hidden" value="${param.searchType}" name="searchType"/>
		                                        <input type="hidden" value="${param.keyword}" name="keyword"/>
		                                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		                                        <input type="submit" value="????????? ??????" class="btn btn-outline-primary"/>
		                                    </form>
		                                </div>
		                            </c:if>
                            </sec:authorize>

                            <div class="col-md-3">
                                <button class="btn btn-outline-danger" type="button" id="boardReportBtn">????????????</button>
                                 <div class="black_bg">
                                  <div class="modal_wrap">
                                    <div class="modal_close"><a href="#">close</a></div>
                                       <div>
                                          <input type="hidden" value="${board.bno}" name="bno" id="board_bno"/>
                                          <input type="text" value="${board.u_id }" name="u_id" id="board_u_id"/>
                                          
                                          <select id="newB_Reportreason" required>
                                            <option value="" disabled selected>????????????</option>
                                            <option value="?????????">?????????</option>
                                            <option value="??????">??????</option>
                                            <option value="????????? ??????">????????? ??????</option>
                                         </select>
                                        <input type="text" name="content" id="newB_ReportContent" placeholder="????????? ????????????" class="form-control"/>
                                       </div>	
                                        <div>
                                            <button type="button" id="final_report"  class="btn btn-danger">??? ????????????</button>  
                                      
                                            
                                        </div>						    
                                    </div>	 
                                  </div>							   
                            </div>									      
                        </div><br>									      
                          <br>
                    <div class="row">
                        <h3 class="text-secondary">FILE</h3>
                        <div class="uploadResult">
                            <ul>
                                <!-- ??????????????? ????????? ?????? -->
                            </ul>
                        </div>
                    </div>
                    
                </div>													 	   													 																																																						   													   
                    <hr/>			
                    
                
                <!-- ????????? ????????? ?????? -->
                    <div class="row">
                        <h3 class="text-secondary">COMMENT LIST</h3>
                        <ul id="replies">
                    
                        </ul>
                    </div><br>
                    <hr/>
                    <!-- ?????? ?????? ?????? -->
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MEMBER','ROLE_USER')">
                    <br><div class="row box-box-success">
                        <div class="box-header">
                            <h3 class="text-secondary">COMMENT</h3>
                        </div><!-- header -->
                                <div class="box-body">
                                    <strong>ID</strong>
                                    <input type="text" name="replyer" id="newReplyWriter" value="${u_id }" placeholder="writer" class="form-control"/><br>
                                    <strong>CONTENT</strong>
                                    <input type="text" name="reply" id="newReplyText" placeholder="content" class="form-control"/>
                                </div><!-- body -->
                                <br><div class="box-footer">
                                    <button type="button" id="replyAddBtn" class="btn btn-secondary">??????</button>
                                </div><!-- footer -->
                                </div>
                                </sec:authorize>
                    </div><!-- row -->
                    
                    
                    
                    
                        <!-- ?????? modal -->
                        
                        <div id="modDiv" style="display:none;">
                            <div class="modal-title"></div>
                            
                            <div>
                                <input type="text" id="reply">
                            </div><br/>
                            <div>
                                <button type="button" id="replyModBtn" class="btn btn-outline-primary btn-sm">??????</button>&emsp;
                                <button type="button" id="replyDelBtn" class="btn btn-outline-danger btn-sm">??????</button>&emsp;
                                <button type="button" id="closeBtn" class="btn btn-outline-light btn-sm">??????</button>
                            </div>
                        </div>
                    
                    <!-- ?????? ?????? modal -->
                    
                      <div id="modRep" style="display:none;">
                            <div class="modal-title"></div>
                            <div>	
							   	<input type="hidden" name="rno" id="modal-number"/>
							    <input type="hidden" name="reportedId" id="reported_Id"/>			
								<select id="newR_Reportreason" required>
                                            <option value="" disabled selected>????????????</option>
                                            <option value="?????????">?????????</option>
                                            <option value="??????">??????</option>
                                            <option value="????????? ??????">????????? ??????</option>
                                         </select>
								<input type="text" name="content" id="newR_reportContent" placeholder="????????? ????????????" class="form-control"/>
								<input type="hidden" value="${board.bno}" name="bno" id="board_bno"/> 	
							</div><br>
                            <div>
                                <button type="button" id="replyReportBtn" class="btn btn-danger btn-sm">????????????</button>
                                <button type="button" id="closeReportBtn" class="btn btn-outline-warning btn-sm" >?????????</button>
                            </div>
                        </div>
                        
                    
                    <!-- ?????? ?????? -->
                    <div id="MessageModal" style="display:none;">
                        <span class="receiveId"></span>
                        <input type="text" class="content" />
                        <br>
                        <br><button type="button" class="send">?????? ?????????</button>&emsp;
                        <button type="button" class="close">??????</button>
                    </div>
                    
                    
                
                
                        
                     <!-- jquery cdn ???????????? -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                    
                    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                    
                   
                    <!-- ???????????? ?????? ????????? ?????? ?????????????????? ?????? ?????? -->
                    <script>
                      let bno = ${board.bno}; 
                      var csrfHeaderName = "${_csrf.headerName}"
                      var csrfTokenValue="${_csrf.token}"
                   // ?????? ?????? ????????????
                        function getAllList(){
                            // $.getJSON??? ????????? ????????? get???????????? ????????? ????????????.
                                        // ??????   			  // ???????????? ?????? ???????????? ????????? json??? ????????? ????????????
                            $.getJSON("/replies/all/" + bno, function(data){
                                // ???????????? ????????? ????????? ??????????????? ???????????? ??? ????????????
                                // ??? ???????????? ??????????????? ????????? ??????????????? ????????? ????????? ??????
                                let str = "";
                                
                                // ???????????? ????????? ??????????????? ?????????
                                console.log(data);
                                
                                $(data).each(function(){
                                // 4??? 27??? ????????????
                                // ?????? ????????? ?????? ????????????????????? Date ????????? ???????????????.
                                
                                    let timestamp = this.updateDate;
                                    let date = new Date(timestamp);
                                    
                                    let formattedTime ="????????? :" + date.getFullYear()
                                                     + "/" + (date.getMonth()+1) //?????? 0????????? ????????????????????? +1????????????.
                                                     + "/" + date.getDate()     
                                                     //???????????? ??????????????????.
                                                     + " " + date.getHours()+"??? "
                                                     + " " + date.getMinutes()+"??? "
                                                     + " " + date.getSeconds()+"??? ";
                                    
                                    // ???????????? ???????????? ??? ???????????? this?????? ???????????? ???????????????.
                                    //console.log("----------------");
                                    //console.log(this);
                                    str += "<div class='replyLi' data-rno='"+ this.rno +"'><strong onclick='messageModal(this)' class='reportedId'>"
                                        + this.replyer + "</strong> -" + formattedTime + "<br>"
                                        +"<div class='reply'>" +this.reply + "</div>"
                                        +"<button type='button' class='btn btn-outline-dark btn-sm'>??????/??????</button>"
                                        +"</div>"
                                        +"<div class='report' data-rno='"+ this.rno +"' data-reply='" + this.reply +"'>"					 
                                        +"<button type='button' class='btn btn-outline-danger btn-sm'>?????? ??????</button>"
                                        +"</div>";
                                        
                                            
                                    
                                });
                                // #replies????????? ???????????????????????? console.log()??? ?????????
                                console.log(str);
                                $("#replies").html(str);
                            
                            });
                        }		
                        getAllList();// ?????? ?????? ???????????? #replies??? ???????????? ?????? ??????
                        
                        $("#replyAddBtn").on("click", function(){
                            
                            // ?????? ???????????????, input?????? ?????? ????????? ????????? ???????????? ?????????.
                            // ????????? ????????? ?????????, ???????????? ?????? ????????? ?????? ???????????? ????????? ???????????????. 
                            var replyer = $("#newReplyWriter").val();
                            var reply = $("#newReplyText").val();
                                       
                            // $.ajax({?????????}); ??? ????????????
                            $.ajax({
                                type : 'post',
                                beforeSend : function(xhr) {
                                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                                },
                                url : '/replies',
                                headers : {
                                    "Content-Type" : "application/json",
                                    "X-HTTP-Method-Override" : "POST"
                                },
                                dataType : 'text',
                                data : JSON.stringify({
                                    bno : bno,
                                    replyer : replyer,
                                    reply : reply
                                }),
                                success : function(result){
                                    if(result == 'SUCCESS'){
                                        alert("?????? ???????????????.");
                                        getAllList();// ?????? ?????? ?????????, ?????? ?????? ??????
                                        // ??? ?????? ?????????.
                                        // ?????? : .val(?????????);
                                        $("#newReplyWriter").val("");
                                        $("#newReplyText").val("");
                                    }
                                }
                            });		
                            
                        });
                        
                    // ????????? ??????
                    function messageModal(e) {
                    console.log($(e).html());
                    $(".receiveId").html($(e).html());
                    $("#MessageModal").show();
                    
                	};
                    
                    $(".send").on("click", function() {
                        sendMessage();
                    });
                
                    $(".close").on("click", function() {
                        $(".content").val("");
                        $(".receiveId").html("");
                        $("#MessageModal").hide();
                    });
                
                    function sendMessage() {
                        
                        let content = $(".content").val();
                        let receiveId = $(".receiveId").html();
                        
                        if(!(content)) {
                            alert("?????? ????????? ??????????????????!");
                            return false;
                        }
                        
                        $.ajax({
                                type : 'post',
                                beforeSend : function(xhr) {
                                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                                },
                                url : '/message/send',
                                headers : {
                                    "Content-Type" : "application/json",
                                    "X-HTTP-Method-Override" : "POST"
                                },
                                dataType : 'text',
                                data : JSON.stringify({
                                    receiveId : receiveId,
                                    content : content
                                }),
                                success : function(result){
                                    if(result == 'SUCCESS'){
                                        alert("????????? ?????????????????????.");
                                        
                                        // ?????? ?????????
                                        $(".content").val("");
                                        $(".receiveId").html("");
                                        // ?????? ??????
                                        $("#MessageModal").hide();
                                    }
                                }
                            });	
                    }
                
                        
                        // ????????? ??????
                        $("#replies").on("click", ".replyLi button", function(){//replyLi button?????? replyLi??? ??????????????????.
                            // ????????? ????????? this??????, ?????? button??? ????????? ?????????
                            // this??? button ?????????. button??? ????????? ?????? .replyLi ?????????.
                            // ???, ????????? ????????? ????????? li ????????? replytag ????????? ???????????????.
                            
                            var replytag = $(this).parent();
                            //4??? 27??? ?????? : this(button)??? ??????(.replyLi)??? ??????
                            //?????? ??????.reply??? ????????? ?????? ?????????????????????
                            //?????? replyContent??? ????????? ????????? ??????????????????
                            //(hint :.sibling("?????????"); ?????? ?????? ????????? ????????????????????????.)
                            //var replyContent = $(this).prev().text();//button??? ???????????????.reply??? ????????? ????????????
                            var replyContent = $(this).siblings(".reply").text();// button??? ?????????.reply??? ????????? ????????????
                            //var replyContent = $(this).parent().children(".reply").text();
                            
                            
                            
                            console.log(replytag);
                            
                            // ????????? ????????? ????????? li????????? data-rno??? ??? ??? ????????? ?????? rno??? ????????????
                            var rno = replytag.attr("data-rno");
                           //	console.log(rno);
                            
                            // rno?????? ????????? ????????? ???????????????
                            //var reply = replytag.text();// ?????? text??? ?????????
                            //alert(rno + " : " + reply);// ?????? text??? ??????????????? alert?????? ??????
                            
                            $(".modal-title").html(rno);//modal-title ????????? ????????? ??????
                            $("#reply").val(replyContent);   // reply ????????? ?????? ????????? ??????(??????/??????)
                            $("#modDiv").show("slow");  // ?????? ????????? ?????? ??????
                            
                            
                        });
                        
                    
                         // ?????? ??? ?????? ?????????
                        $("#closeBtn").on("click", function(){// #closeBtn ?????????
                            $("#modDiv").hide("slow");  // #modDiv??? ????????????.
                        });
                        
                        
                     // ???????????? ??????
                         $("#replyDelBtn").on("click",function(){
                            var rno = $(".modal-title").html();
                            
                            $.ajax({
                                type : 'delete',
                                beforeSend : function(xhr) {
                                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                                },
                                url : '/replies/' + rno,
                                header : {
                                    "X-HTTP-Method-Override" : "DELETE"
                                },
                                dataType : 'text',
                                success : function(result){
                                    console.log("result : " + result );
                                    if(result=='SUCCESS'){
                                        alert("?????? ???????????????.");
                                        $("#modDiv").hide("slow");
                                        getAllList();
                                    }
                                }
                            })
                        });
                     
                     // ?????? ??? ????????????
                     $("#replyModBtn").on("click", function(){
                        
                         let rno = $(".modal-title").html();
                         let reply = $("#reply").val();
                         
                         $.ajax({
                             type : 'patch',
                             beforeSend : function(xhr) {
                                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                             },
                             url : '/replies/' + rno,
                             header : {
                                 "Content-Type" : "application/json",
                                 "X-HTTP-Method-Override" : "PATCH"
                                 
                             },
                             contentType : "application/json", //json ????????? ????????? ???????????? ?????????
                             data: JSON.stringify({reply:reply}),
                             dataType : 'text',
                             success : function(result){
                                 console.log("result: " + result);
                                 
                                 if(result == 'SUCCESS'){
                                     alert("?????? ???????????????.");
                                     $("#modDiv").hide("slow");
                                     getAllList();
                                 }
                             }
                                 
                         })
                     })
                     
                      
                                         //???????????????
                                         // ???????????? ??????
                                         $("#replies").on("click", ".report button", function(){
                         
                                        	 var reportedId = $(this).parent().prev().children(".reportedId");
            						    	 console.log(reportedId.html());
            						    	 $("#reported_Id").val(reportedId.html());
                       
                                                var replytag = $(this).parent();
                                                
                                                console.log(rno);
                                                
                                                var rno = replytag.attr("data-rno");
                                                var replyContent = replytag.attr("data-reply");// button??? ?????????.reply??? ????????? ????????????
                                                    
                                                //$(".modal-title").html(replyContent);//?????? ???????????? ????????????
                                                //$("#reply").html(replyContent);   // reply ????????? ?????? ????????? ??????(??????/??????)
                                                 console.log(replytag);
                                                 $(".modal-title").html(replyContent);
                                                 $("#modal-number").val(rno);
                                                 $("#reply_Id").val(reportedId);
                                               $("#modRep").show("slow");  // ?????? ????????? ?????? ??????
                         
                                 });
                     
                   //?????? ??????????????????(?????? ????????????)
				     $("#replyReportBtn").on("click", function(){
						
						// ?????? ???????????????, input?????? ?????? ????????? ????????? ???????????? ?????????.
						// ????????? ????????? ?????????, ???????????? ?????? ????????? ?????? ???????????? ????????? ???????????????. 
						var rno = $("#modal-number").val();
						var bno = $("#board_bno").val();					
						var reason = $("#newR_Reportreason option:selected").val();
						var content = $("#newR_reportContent").val();
						var reportedId = $("#reported_Id").val();
					
							
						
						// $.ajax({?????????}); ??? ????????????
						$.ajax({
							type : 'post',
							beforeSend : function(xhr) {
						        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						    },
							url : '/R_report',
							headers : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType : 'text',
							data : JSON.stringify({
								rno : rno,
								
								bno : bno,
								reason : reason,
								content : content,
								reportedId : reportedId
								//reportId :reportId
								//Principal : Principal
							}),
							
							success : function(result){
								if(result == 'SUCCESS'){
									alert("?????????????????????.");
									$("#modRep").hide("slow");
									getAllList();// ?????? ?????? ?????????, ?????? ?????? ??????
									console.log("???????????????:"+ reportedId);
									console.log("??????????????????:"+ content);
								    console.log("????????? ??????" + bno);	
								
									
									// ??? ?????? ?????????.
									// ?????? : .val(?????????);
									$("#newR_reportReason").val("");
									$("#newR_reportContent").val("");
									
								}
							}
							
						});		
						
					});
                     
                    
                                    // ?????? ??? ?????? ?????????(????????????)
                                    $("#closeReportBtn").on("click", function(){// #closeBtn ?????????
                                        $("#modRep").hide("slow");  // #modDiv??? ????????????.
                                        $("#newR_reportReason").val("");
                                        $("#newR_reportContent").val("");
                                    });
                      
                                    
                                    
                                  
                                    // ????????? ?????? ??????   boardReportBtn
                            
                                                 window.onload = function() {
                                                     
                                            function onClick() {
                                                document.querySelector('.modal_wrap').style.display ='block';
                                                document.querySelector('.black_bg').style.display ='block';
                                            }   
                                            function offClick() {
                                                document.querySelector('.modal_wrap').style.display ='none';
                                                document.querySelector('.black_bg').style.display ='none';
                                            }
                                         
                                           
                                            document.getElementById('boardReportBtn').addEventListener('click', onClick);
                                            document.querySelector('.modal_close').addEventListener('click', offClick);
                                         
                                        };
                         
                            //?????? ????????? ?????????????????????
                             $("#final_report").on("click", function(){
                                
                                // ?????? ???????????????, input?????? ?????? ????????? ????????? ???????????? ?????????.
                                // ????????? ????????? ?????????, ???????????? ?????? ????????? ?????? ???????????? ????????? ???????????????. 
                                var bno = $("#board_bno").val();
                                //var reason = $("#newB_Reportreason").val();
                                        //var replyContent = $(this).prev().text();//button??? ???????????????.reply??? ????????? ????????????
                                    //var reason = $(this).siblings(".reply").text();// button??? ?????????.reply??? ????????? ????????????
                                var reportedId = $("#board_u_id").val();
                                var reason =  $("#newB_Reportreason option:selected").val();
                                    console.log(reason);
                                var content = $("#newB_ReportContent").val();
                                console.log(bno);
                                // $.ajax({?????????}); ??? ????????????
                                $.ajax({
                                    type : 'post',	
                                    beforeSend : function(xhr) {
                                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                                    },
                                    url : '/B_report',
                                    headers : {
                                        "Content-Type" : "application/json",
                                        "X-HTTP-Method-Override" : "POST"
                                    },
                                    dataType : 'text',
                                    data : JSON.stringify({
                                        bno : bno,
                                        reason : reason,
                                        content : content,
                                        reportedId : reportedId
                                    }),
                                
                                    success : function(result){
                                        if(result == 'SUCCESS'){
                                            alert("?????????????????????.");
                                            $(".black_bg").hide("slow");
                                            //getAllList();// ?????? ?????? ?????????, ?????? ?????? ??????
                                            // ??? ?????? ?????????.
                                            // ?????? : .val(?????????);
                                            $("#newB_Reportreason").val("");
                                            $("#newB_ReportContent").val("");
                                            
                                            
                                        }
                                    }
                                });		
                                
                            });
                    
                             (function(){
                                    $.getJSON("/board/getAttachList", {bno : bno}, function(arr){
                                        console.log(arr);
                                        
                                        var str = "";
                                        
                                        $(arr).each(function(i, obj){
                                            // image type
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
                                        $(".uploadResult ul").html(str);
                                    }); // end getJSON
                                })(); // ???????????? ??????
                    
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