	
	
	
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<style>
		#modDiv{
			width: 450px;
			height: 100px;
			background-color: green;
			position: absolute;
			top: 50%;
			left: 50%;
			margin-top: -50px;
			margin-left: -150px;
			padding:10px;
			z-index:1000;
		}
		#reply{
		width: 430px;
		}
		
		#modRep{
			width: 450px;
			height: 150px;
			background-color: darkred;
			position: absolute;
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
			width: 300px;
			height: 300px;
			position: absolute;
			top:50%;
			left: 50%;
			margin: -250px 0 0 -250px;
			background-color: #ffffff;
			z-index: 2;
					}
			.black_bg{
			display: none;
			position: absolute;
			content: "";
			width: 100%;
			height: 100%;
			background-color:rgba(0, 0,0, 0.5);
			top:0;
			left: 0;
			z-index: 1;
			}
			.modal_close{
			width: 26px;
			height: 26px;
			position: absolute;
			top: -30px;
			right: 0;
			 }
			.modal_close> a{
			display: block;
			width: 100%;
			height: 100%;
			background:aqua;
			text-indent: -9999px;
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
	align-content :center;
	text-align : center;
	}
	.uploadResult ul li img{
	width : 30%;
	}
	
	</style>
	
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	
		<div class="container">
			<h1 class="text text=primary">${board.bno}번 게시글 상세 페이지</h1>
			글 번호 : <input type="text" class="form-control" value="${board.bno}" readonly/>
			글 제목 : <input type="text" value="${board.title}" readonly/>
			글쓴이 : <span class="message">${board.u_id}</span><br/>
			글 본문 : <textarea rows="15" class="form-control" readonly>${board.content}</textarea>
			<div class="row">
				<div class="col-md-6">쓴날짜 : ${board.regdate}&nbsp;&nbsp;&nbsp;</div>
				<div class="col-md-6">마지막 수정날짜 : ${board.updatedate}</div><br/><br/>
			</div>
				
			<div class="row">
				<div class="col-md-3">	
					<a href="/board/list?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-success">게시글 목록</a>
				</div>
				<div class="col-md-3">
					<form action="/board/updateForm" method="post">
						<input type="hidden" value="${board.bno}" name="bno"/>
						<input type="hidden" value="${param.pageNum}" name="pageNum"/>
						<input type="hidden" value="${param.searchType}" name="searchType"/>
						<input type="hidden" value="${param.keyword}" name="keyword"/>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input type="submit" value="글 수정하기" class="btn btn-warning"/>
					</form>
				</div>
				<div class="col-md-3">
					<form action="/board/delete" method="post">
						<input type="hidden" value="${board.bno}" name="bno"/>
						<input type="hidden" value="${param.pageNum}" name="pageNum"/>
						<input type="hidden" value="${param.searchType}" name="searchType"/>
						<input type="hidden" value="${param.keyword}" name="keyword"/>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input type="submit" value="글 삭제하기" class="btn btn-primary"/>
					</form>
				</div>
				<div class="col-md-3">
					<button class="btn btn-danger" type="button" id="boardReportBtn">신고하기</button>
					 <div class="black_bg">
					  <div class="modal_wrap">
					    <div class="modal_close"><a href="#">close</a></div>
						   <div>
							  <input type="hidden" value="${board.bno}" name="bno" id="board_bno"/>
							  <input type="text" value="${board.u_id }" name="u_id" id="board_u_id"/>
							  
							  <select id="newB_Reportreason" required>
						        <option value="" disabled selected>신고사유</option>
								<option value="거짓말">거짓말</option>
								<option value="허위">허위</option>
								<option value="상이한 내용">상이한 내용</option>
							 </select>
							<input type="text" name="content" id="newB_ReportContent" placeholder="자세한 신고내용" class="form-control"/>
						   </div>	
						    <div>
								<button type="button" id="final_report"  class="btn btn-warning">글 신고하기</button>  
					      
								
							</div>						    
						</div>	 
					  </div>							   
				</div>									      
			</div>									      
		      
		<div class="row">
			<h3 class="text-primary">첨부파일</h3>
			<div class="uploadResult">
				<ul>
					<!-- 첨부파일이 들어갈 위치 -->
				</ul>
			</div>
		</div>
		
	</div>													 	   													 																																																						   													   
		<hr/>			
		
	
	<!-- 댓글이 추가될 공간 -->
		<div class="row">
			<h3 class="text-primary">댓글</h3>
			<ul id="replies">
		
			</ul>
		</div>
		<hr/>
		<!-- 댓글 작성 공간 -->
		<div class="row box-box-success">
			<div class="box-header">
				<h3 class="text-primary">댓글 작성하기</h3>
			</div><!-- header -->
					<div class="box-body">
						<strong>댓글 글쓴이</strong>
						<input type="text" name="replyer" id="newReplyWriter" placeholder="writer" class="form-control"/>
						<strong>댓글 내용</strong>
						<input type="text" name="reply" id="newReplyText" placeholder="content" class="form-control"/>
					</div><!-- body -->
					<div class="box-footer">
						<button type="button" id="replyAddBtn" class="btn btn-success">댓글 추가</button>
					</div><!-- footer -->
		</div><!-- row -->
		
		
		
		
			<!-- 댓글 modal -->
			
			<div id="modDiv" style="display:none;">
				<div class="modal-title"></div>
				
				<div>
					<input type="text" id="reply">
				</div>
				<div>
					<button type="button" id="replyModBtn">수정</button>
					<button type="button" id="replyDelBtn">삭제</button>
					<button type="button" id="closeBtn">닫기</button>
				</div>
			</div>
		
		<!-- 댓글 신고 modal -->
		
		  <div id="modRep" style="display:none;">
				<div class="modal-title"></div>
				<div>	
				   	<input type="hidden" name="rno" id="modal-number"/>
					<input type="text" name="reason" id="newR_reportReason" placeholder="신고사유" class="form-control"/>
					<input type="text" name="content" id="newR_reportContent" placeholder="자세한 신고내용" class="form-control"/>
						
				</div>
				<div>
					<button type="button" id="replyReportBtn">신고하기</button>
					<button type="button" id="closeReportBtn">창닫기</button>
				</div>
			</div>
			
		
		<!-- 쪽지 모달 -->
		<div id="MessageModal" style="display:none;">
			<span class="receiveId"></span>
			<input type="text" class="content" />
			<button type="button" class="send">쪽지 보내기</button>
			<button type="button" class="close">창 닫기</button>
		</div>
		
		
	
	
			
		 <!-- jquery cdn 가져오기 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		
	   
	    <!-- 여기부터 댓글 비동기 처리 자바스크립트 처리 영역 -->
	    <script>
	      let bno = ${board.bno}; 
	      var csrfHeaderName = "${_csrf.headerName}"
		  var csrfTokenValue="${_csrf.token}"
	   // 전체 댓글 가져오기
			function getAllList(){
				// $.getJSON은 입력한 주소에 get방식으로 요청을 넣습니다.
							// 주소   			  // 콜백함수 주소 요청으로 얻어온 json을 어떻게 처리할지
				$.getJSON("/replies/all/" + bno, function(data){
					// 문자열을 이용해 태그를 생성하거나 끼워넣을 수 있으므로
					// 빈 문자열을 만들어놓고 거기에 댓글정보를 저장해 화면에 전송
					let str = "";
					
					// 데이터를 제대로 들고왔는지 디버깅
					console.log(data);
					
					$(data).each(function(){
					// 4월 27일 추가내용
					// 날짜 처리를 위해 자바스크립트의 Date 객체를 이용합니다.
					
						let timestamp = this.updateDate;
						let date = new Date(timestamp);
						
						let formattedTime ="게시일 :" + date.getFullYear()
						                 + "/" + (date.getMonth()+1) //월은 0월부터 시작하기때문에 +1을해준다.
						                 + "/" + date.getDate()     
						                 //시분초도 추가해보세요.
						                 + " " + date.getHours()+"시 "
						                 + " " + date.getMinutes()+"분 "
						                 + " " + date.getSeconds()+"시 ";
						
						// 하나하나 반복되는 각 데이터는 this라는 키워드로 표현됩니다.
						//console.log("----------------");
						//console.log(this);
						str += "<div class='replyLi' data-rno='"+ this.rno +"'><strong>@"
						    + this.replyer + "</strong> -" + formattedTime + "<br>"
						    +"<div class='reply'>" +this.reply + "</div>"
						    +"<button type='button' class='btn btn-info'>수정/삭제</button>"
						    +"</div>"
						    +"<div class='report' data-rno='"+ this.rno +"' data-reply='" + this.reply +"'>"					 
						    +"<button type='button' class='btn btn-danger'>댓글 신고</button>"
						    +"</div>";
						    
					    		
						
					});
					// #replies사이에 끼워넣을수있도록 console.log()로 디버깅
					console.log(str);
					$("#replies").html(str);
				
				});
			}		
			getAllList();// 댓글 전체 들고와서 #replies에 심어주는 로직 실행
			
			$("#replyAddBtn").on("click", function(){
				
				// 폼이 없기때문에, input태그 내에 입력된 요소를 가져와야 합니다.
				// 버튼을 누르는 시점에, 글쓴이와 내용 내부에 적힌 문자열을 변수에 저장합니다. 
				var replyer = $("#newReplyWriter").val();
				var reply = $("#newReplyText").val();
				           
				// $.ajax({내용물}); 이 기본형태
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
							alert("등록 되었습니다.");
							getAllList();// 댓글 등록 성공시, 다시 목록 갱신
							// 폼 태그 비우기.
							// 힌트 : .val(넣을값);
							$("#newReplyWriter").val("");
							$("#newReplyText").val("");
						}
					}
				});		
				
			});
			
		// 메세지 기능
		$(".message").on("click", function() {
			console.log($(this).html());
			$(".receiveId").html($(this).html());
			$("#MessageModal").show();
			
		});
		
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
				alert("보낼 내용을 입력해주세요!");
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
							alert("쪽지가 전달되었습니다.");
							
							// 내용 초기화
							$(".content").val("");
							$(".receiveId").html("");
							// 모달 닫힘
							$(".MessageModal").hide();
						}
					}
				});	
		}
	
			
			// 이벤트 위임
			$("#replies").on("click", ".replyLi button", function(){//replyLi button에서 replyLi는 생략해도된다.
				// 클릭한 요소가 this이고, 현재 button에 걸렸기 때문에
				// this는 button 입니다. button의 부모가 바로 .replyLi 입니다.
				// 즉, 클릭한 버튼과 연계된 li 태그를 replytag 변수에 저장합니다.
				
				var replytag = $(this).parent();
			    //4월 27일 수정 : this(button)의 부모(.replyLi)가 아닌
				//형제 태그.reply의 내용을 대신 가져올수있도록
				//변수 replyContent를 선언해 거기에 저장해주세요
				//(hint :.sibling("요소명"); 으로 형제 태그를 가져올수있습니다.)
				//var replyContent = $(this).prev().text();//button의 직전태그인.reply의 내용물 가져오기
				var replyContent = $(this).siblings(".reply").text();// button의 형제중.reply의 내용물 가져오기
				//var replyContent = $(this).parent().children(".reply").text();
				
				
				
				console.log(replytag);
				
				// 클릭한 버튼과 연계된 li태그의 data-rno에 든 값 가져와 변수 rno에 저장하기
				var rno = replytag.attr("data-rno");
			   //	console.log(rno);
				
				// rno뿐만 아니라 본문도 가져와야함
				//var reply = replytag.text();// 내부 text를 가져옴
				//alert(rno + " : " + reply);// 내부 text와 댓글번호를 alert으로 띄움
				
				$(".modal-title").html(rno);//modal-title 부분에 글번호 입력
				$("#reply").val(replyContent);   // reply 영역에 리플 내용을 기입(수정/삭제)
				$("#modDiv").show("slow");  // 버튼 누르면 모달 열림
				
				
			});
			
		
			 // 모달 창 닫기 이벤트
			$("#closeBtn").on("click", function(){// #closeBtn 클릭시
				$("#modDiv").hide("slow");  // #modDiv를 닫습니다.
			});
			
			
		 // 삭제버튼 작동
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
							alert("삭제 되었습니다.");
							$("#modDiv").hide("slow");
							getAllList();
						}
					}
				})
			});
		 
		 // 모달 창 수정버튼
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
				 contentType : "application/json", //json 자료를 추가로 입력받기 때문에
				 data: JSON.stringify({reply:reply}),
				 dataType : 'text',
				 success : function(result){
					 console.log("result: " + result);
					 
					 if(result == 'SUCCESS'){
						 alert("수정 되었습니다.");
						 $("#modDiv").hide("slow");
						 getAllList();
					 }
				 }
					 
			 })
		 })
		 
		  
		                     //이벤트위임
						     // 댓글신고 버튼
						     $("#replies").on("click", ".report button", function(){
			 
		   
								    var replytag = $(this).parent();
								    
									console.log(rno);
									
									var rno = replytag.attr("data-rno");
									var replyContent = replytag.attr("data-reply");// button의 형제중.reply의 내용물 가져오기
										
									//$(".modal-title").html(replyContent);//신고 모달창에 댓글보기
									//$("#reply").html(replyContent);   // reply 영역에 리플 내용을 기입(수정/삭제)
				                     console.log(replytag);
				                     $(".modal-title").html(replyContent);
				                     $("#modal-number").val(rno);
			                       $("#modRep").show("slow");  // 버튼 누르면 모달 열림
			 
					 });
		 
		
					    // 모달 창 닫기 이벤트(댓글신고)
						$("#closeReportBtn").on("click", function(){// #closeBtn 클릭시
							$("#modRep").hide("slow");  // #modDiv를 닫습니다.
							$("#newR_reportReason").val("");
							$("#newR_reportContent").val("");
						});
						
	
	                  
						
						     //모달 신고하기버튼(댓글 신고하기)
						     $("#replyReportBtn").on("click", function(){
								
								// 폼이 없기때문에, input태그 내에 입력된 요소를 가져와야 합니다.
								// 버튼을 누르는 시점에, 글쓴이와 내용 내부에 적힌 문자열을 변수에 저장합니다. 
								var rno = $("#modal-number").val();
								var reason = $("#newR_reportReason").val();
								var content = $("#newR_reportContent").val();
								
									
								
								// $.ajax({내용물}); 이 기본형태
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
										reason : reason,
										content : content
									}),
									
									success : function(result){
										if(result == 'SUCCESS'){
											alert("신고되었습니다.");
											$("#modRep").hide("slow");
											getAllList();// 댓글 등록 성공시, 다시 목록 갱신
											// 폼 태그 비우기.
											// 힌트 : .val(넣을값);
											$("#newR_reportReason").val("");
											$("#newR_reportContent").val("");
											
										}
									}
								});		
								
							});
						
					    
					    
					    
					  
					    // 게시판 신고 버튼   boardReportBtn
				
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
	         
				//모달 게시판 글신고하기버튼
			     $("#final_report").on("click", function(){
					
					// 폼이 없기때문에, input태그 내에 입력된 요소를 가져와야 합니다.
					// 버튼을 누르는 시점에, 글쓴이와 내용 내부에 적힌 문자열을 변수에 저장합니다. 
					var bno = $("#board_bno").val();
					//var reason = $("#newB_Reportreason").val();
				            //var replyContent = $(this).prev().text();//button의 직전태그인.reply의 내용물 가져오기
						//var reason = $(this).siblings(".reply").text();// button의 형제중.reply의 내용물 가져오기
					var reportedId = $("#board_u_id").val();
					var reason =  $("#newB_Reportreason option:selected").val();
						console.log(reason);
					var content = $("#newB_ReportContent").val();
					console.log(bno);
					// $.ajax({내용물}); 이 기본형태
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
								alert("신고되었습니다.");
								$(".black_bg").hide("slow");
								//getAllList();// 댓글 등록 성공시, 다시 목록 갱신
								// 폼 태그 비우기.
								// 힌트 : .val(넣을값);
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
							$(".uploadResult ul").html(str);
						}); // end getJSON
					})(); // 익명함수 종료
		
	</script>
		    
	
	
			 
		
	</body>
	</html>