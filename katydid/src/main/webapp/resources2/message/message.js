
	$(".message").on("click", function() {
		$(".receiveId").val("$(this).html()");
		$("#messageModal").show();
	});
	
	$(".send").on("click", function() {
		sendMessage();
	});

	$(".close").on("click", function() {
		$(".content").val("");
		$(".receiveId").val("");
		$("#messageModal").hide();
	});

	function sendMessage() {
		
		let content = $(".content").val();
		let receiveId = $(".receiveId").val();
		
		if(!(content)) {
			alert("보낼 내용을 입력해주세요!");
			return false;
		}
		
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
					receiveId : receiveId,
					content : content
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("쪽지가 전달되었습니다.");
						
						// 내용 초기화
						$(".content").val("");
						$(".receiveId").val("");
						// 모달 닫힘
						$(".messageModal").hide();
					}
				}
			});	
	}
