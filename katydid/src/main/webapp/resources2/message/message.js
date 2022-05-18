
	function sendMessage() {
		
		$.ajax({
				type : 'post',
				beforeSend : function(xhr) {
			        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			    },
				url : '/send',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					sendId : sendId,
					receiveId : receiveId,
					content : content
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("쪽지가 전달되었습니다.");
						
						// 내용 초기화
						
						// 모달 닫힘
					}
				}
			});	
	}
