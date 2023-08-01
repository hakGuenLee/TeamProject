/**
 공통코드 처리하는 공통함수
 */

 //a는 지정한 코드값(매개변수)
/* function getCommonCode(a){	 
	 $.ajax({
			url:"http://localhost:8887/getCode",
			type : "post", //서버에 전송하기 위한 전송방식
			data:{"code" : a},
			dataType : "json", // 서버에서 응답하는 데이터 형식
			success: (result) => {
				if(cb) cb(result);
			} 
			function(data){
				console.log(data)
				
			}			
			 //서버에서 성공적으로 요청이 수행되었을 때resultList 함수 호출(콜백 함수)
			,error : function(){alert("error")} //서버에서 요청 처리가 실패 됬을 경우
			
		});*/		
	
		
 function getCommonCode(a,cb){	 
 
 var token = $("meta[name='_csrf'").attr("content");
	 var header = $("meta[name='_csrf_header']").attr("content");
	
	 $.ajax({
			url:"/getCode",
	beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			type : "post", //서버에 전송하기 위한 전송방식
			data:{"code" : a},
			dataType : "json", // 서버에서 응답하는 데이터 형식
			success: (result) => {
				if(cb) cb(result);
			} 
			/*function(data){
				console.log(data)
				
			}*/			
			 //서버에서 성공적으로 요청이 수행되었을 때resultList 함수 호출(콜백 함수)
			,error : function(){alert("error")} //서버에서 요청 처리가 실패 됬을 경우
			
		});
	
	 
	 
	 
 }