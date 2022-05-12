<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  #reply{
	width: 430px;
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<body>
     
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
     

  
      <ul id="replies">
	
		</ul>
  
 <script id="text.javascript">
			       
			   // 전체 댓글 가져오기
					function getAllList(){
						// $.getJSON은 입력한 주소에 get방식으로 요청을 넣습니다.
									// 주소   			  // 콜백함수 주소 요청으로 얻어온 json을 어떻게 처리할지
						$.getJSON("/B_report/all/", function(data){
							// 문자열을 이용해 태그를 생성하거나 끼워넣을 수 있으므로
							// 빈 문자열을 만들어놓고 거기에 댓글정보를 저장해 화면에 전송
							let str = "";
							
							// 데이터를 제대로 들고왔는지 디버깅
							console.log(data);
							
							$(data).each(function(){
							
							
								
								// 하나하나 반복되는 각 데이터는 this라는 키워드로 표현됩니다.
								//console.log("----------------");
								//console.log(this);
								str += "<div class='reason' data-b_reno='"+ this.b_reno +"'><strong>@"
								    + this.reason + "</strong><br>"
								    +"<div class='content'>" +this.content + "</div>"
								
								
							});
							// #replies사이에 끼워넣을수있도록 console.log()로 디버깅
							console.log(str);
							$("#replies").html(str);
						
						});
					}		
					getAllList();// 댓글 전체 들고와서 #replies에 심어주는 로직 실행
					
					
		</script>		
					
</body>
</html>