<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 등록 페이지-->

<jsp:include page="../include/header.jsp"/>

<!-- <div class="container w-50 border shadow-sm p-5 mt-5"> -->
<div class="container w-50 mt-5 p-5 shadow">

<form action="<c:url value="/board/question"/>" method="post"  onsubmit="return submitChk()">
  
   <h4>1:1문의하기</h4>
   <div class="d-flex justify-content-center">
	   <label for="sel1" class="form-label  m-3">문의유형 선택</label>
	   <select class="form-select w-50 m-3" id="cs_code" name="cs_code">
	      <option></option>
	   </select>
   </div>
   

   <input type="hidden" id="isTtlChk" value="no"/>
   <input class="form-control" type="text" id="cs_ttl" name="cs_ttl" onkeyup="ttlCheck()" placeholder="제목을 입력하세요" autofocus>      
   <p id="chkMsg" class="mb-2"></p>
   
   <input type="hidden" id="isConChk" value="no"/>
   <textarea class="form-control mt-2"  onkeyup="conCheck()" name="cs_con" id="cs_con" rows="5" cols="33" placeholder="내용을 입력하세요"></textarea>
   <p id="chkMsg2" class="mb-2"></p>

   <input class="form-control" type="text" id="cs_tte" name="cs_ttl" placeholder="제목을 입력하세요" autofocus>      
    <p id="chkMsg" class="mb-5"></p>
   <textarea class="form-control mt-2" name="cs_con" id="cs_con" rows="5" cols="33" placeholder="내용을 입력하세요"></textarea>

   
   <input class="form-control mt-2" type="hidden" id="user_id" name="user_id" readonly value="${user_id}">
   
   <div class="text-center mt-3">
      <button class="btn btn-primary">등록</button>   
   </div>
</form>
</div>

					
<script>

$(document).ready(function(){
	  let qaType= "";	
  var codeNum = '500';
  let str = "";
  
  let roleArea = $("#cs_code"); 

   getCommonCode(codeNum, function(data){
   console.log(data);
   
   let list = data;
   let selected = "";
   
   for(let i=1; i<list.length; i++){          
    
       str += " <option value='" + list[i].item_cd+"' "+selected + ">";
      str += list[i].item_nm+"</option>"; 
      
      
      console.log(str);
   
   }
          
   roleArea.html(str);
      
});

});
</script>

<script>



    function submitChk(){

        let isTtlChk = $("#isTtlChk").val();
        let isConChk = $("#isConChk").val();

        if(isTtlChk=="no"){
            alert("제목을 입력해주세요.")
            $("#cs_ttl").select();            
            return false;
        }
         if(isConChk=="no"){
            alert("내용을 10자 이상 입력해주세요");
            $("#cs_con").select();
            return false;
        } 
    }//submitChk

    function ttlCheck() {

        var cs_ttl = $('#cs_ttl').val();

        if(cs_ttl.length<2){
            $('#isTtlChk').val("no");
            $('#chkMsg').html("제목을 2자 이상 입력해주세요.")
            $('#chkMsg').css({"color":"red","font-size":"13px"});
            return;
        }
        if(cs_ttl.length>1){
            $('#isTtlChk').val("yes");
            $('#chkMsg').html("")
         //   $('#chkMsg').css({"color":"red","font-size":"13px"});
            return;
        }

    }//funtion ttlCheck
    
    function conCheck() {

        var cs_con = $('#cs_con').val();

        if(cs_con.length<10){
            $('#isConChk').val("no");
            $('#chkMsg2').html("내용의 길이는 10자리 이상 입력해주세요.")
            $('#chkMsg2').css({"color":"red","font-size":"13px"});
            return;
        }
        if(cs_con.length>9){
            $('#isConChk').val("yes");
            $('#chkMsg2').html("")
         //   $('#chkMsg').css({"color":"red","font-size":"13px"});
            return;
        }

    }//funtion conCheck



</script>


<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>