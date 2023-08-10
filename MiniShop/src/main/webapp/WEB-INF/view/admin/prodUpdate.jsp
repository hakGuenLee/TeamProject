<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품 등록 페이지 -->

<jsp:include page="../include/a_header.jsp" />

<div class="container w-50 mt-5">
	<h3>상품 수정</h3>
	<form action="<c:url value="/product/prodUpdate"/>" method="post"
		enctype="multipart/form-data">
		<table class="table table-borderless">
			<tbody>
				<tr>
				<td>
					<input type="hidden" name="prod_no" value="${pdto.prod_no}"/>
					카테고리</td>
					<td><select class="form-select form-select-sm w-50"
						name="ctgry_no">
							<c:if test="${cList == null || cList.size() == 0}">
								<option value="">카테고리 없음</option>
							</c:if>
							
							
							<c:if test="${cList != null || cList.size() != 0}">
								<c:forEach var="cdto" items="${cList}">
									<option value="${cdto.ctgry_no}" ${(cdto.ctgry_no == pdto.ctgry_no) ? 'selected':''}>
									(${cdto.ct_cd1})${cdto.ct_nm1} / (${cdto.ct_cd2}) ${cdto.ct_nm2}</option>
								</c:forEach>
							</c:if>
					</select></td>
				</tr>

				<tr>
					<td>상품명</td>
					<td><input type="text"
						class="form-control form-control-sm w-50" name="prod_nm" value="${pdto.prod_nm}" /></td>
				</tr>
            <tr>
               <td>상품 메인이미지</td>
               <td>
				(현재) <img src="<c:url value="/resources/upload/${pdto.main_img}"/>" width="100px"/>
               </td>
               </tr>
               <tr>
               <td>메인 이미지 수정</td>
               <td>
				 <div id="div-file">
  				<input type="file" class="form-control form-control-sm w-50" 
               name="main_img" onchange="preViewImg(this)"/>
             <img id="img-tag" /><button id="btn-chk" type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>
             
                  </div>
               <!-- 이미지를 수정하지 않는 경우에는 지금 현재 이미지를 넘겨야 함. -->
                <input type="hidden" class="form-control form-control-sm" 
               name="imgOld" value="${pdto.main_img}"/>
               
               </td>
            </tr>

            <tr>
               <td>상품 상세이미지</td>
               <td>
				(현재) <img src="<c:url value="/resources/upload/${pdto.detail_img}"/>" width="100px"/>
               </td>
               </tr>
               <tr>
               <td>상세 이미지 수정</td>
               <td>
				 <div id="div-file">
  				<input type="file" class="form-control form-control-sm w-50" 
               name="detail_img" onchange="preViewImg(this)"/>
             <img id="img-tag" /><button id="btn-chk" type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>
             
                  </div>
               <!-- 이미지를 수정하지 않는 경우에는 지금 현재 이미지를 넘겨야 함. -->
                <input type="hidden" class="form-control form-control-sm" 
               name="detailOld" value="${pdto.detail_img}"/>
               
               </td>
            </tr>
            
                        <tr>
               <td>상품 서브이미지1</td>
               <td>
				(현재) <img src="<c:url value="/resources/upload/${pdto.sub_img1}"/>" width="100px"/>
               </td>
               </tr>
               <tr>
               <td>서브1 이미지 수정</td>
               <td>
				 <div id="div-file">
  				<input type="file" class="form-control form-control-sm w-50" 
               name="sub_img1" onchange="preViewImg(this)"/>
             <img id="img-tag" /><button id="btn-chk" type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>
             
                  </div>
               <!-- 이미지를 수정하지 않는 경우에는 지금 현재 이미지를 넘겨야 함. -->
                <input type="hidden" class="form-control form-control-sm" 
               name="subOld1" value="${pdto.sub_img1}"/>
               
               </td>
            </tr>
            
                        <tr>
               <td>상품 서브이미지2</td>
               <td>
				(현재) <img src="<c:url value="/resources/upload/${pdto.sub_img2}"/>" width="100px"/>
               </td>
               </tr>
               <tr>
               <td>서브2 이미지 수정</td>
               <td>
				 <div id="div-file">
  				<input type="file" class="form-control form-control-sm w-50" 
               name="sub_img2" onchange="preViewImg(this)"/>
             <img id="img-tag" /><button id="btn-chk" type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>
             
                  </div>
               <!-- 이미지를 수정하지 않는 경우에는 지금 현재 이미지를 넘겨야 함. -->
                <input type="hidden" class="form-control form-control-sm" 
               name="subOld2" value="${pdto.sub_img2}"/>
               
               </td>
            </tr>



				<tr>
					<td>상품가격</td>
					<td><input type="text"
						class="form-control form-control-sm w-50" name="price" value="${pdto.price}" /></td>
				</tr>
				<tr>
					<td>적립금</td>
					<td><input type="text"
						class="form-control form-control-sm w-50" name="point" value="${pdto.point}" /></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text"
						class="form-control form-control-sm w-50" name="qty" value="${pdto.qty}"/></td>
				</tr>
				<tr>
					<td>할인가</td>
					<td><input type="text"
						class="form-control form-control-sm w-50" name="dc_price" value="${pdto.dc_price}" /></td>
				</tr>
	
				<tr>
					<td>사용유무</td>
					<td><select class="form-select form-select-sm w-50"
						id="use_yn" name="use_yn">
							<option value="Y" ${pdto.use_yn =='Y'?'selected':''}>Y</option>
							<option value="N" ${pdto.use_yn =='N'?'selected':''}>N</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="3" class="text-center"><input type="submit"
						class="btn btn-sm btn-primary" value="상품수정" /> <a
						class="btn btn-sm btn-secondary"
						href="<c:url value="/product/prodList"/>">리스트</a>
								<button onclick="delInput()" class="btn btn-sm btn-danger" type="reset">설정 초기화</button>
						</td> 
				</tr>
			</tbody>
		</table>
	</form>
</div>

<script>

/* //공통 코드 함수 -- > 이거 사용하면 selected를 사용하기 힘듦. 나중에 하자

$(document).ready(function(){
		var codeNum = '200';
		let str = "";
		
		let roleArea = $("#use_yn"); //권한부여 영역

		getCommonCode(codeNum, function(data){
		console.log(data);
		
		let list = data;
		
		for(let i=0; i<list.length; i++){
			str += ' <option value=' + list[i].item_cd+ ' ${pdto.use_yn =="N"?"selected":""} >'+list[i].item_nm+'</option>'
		}
		
		roleArea.html(str);
			
	});
	
}); */

function preViewImg(obj){
	  console.log(obj.files)
	  
	  var imgTag = obj.nextElementSibling; // nextSibling : 다음 형제요소
	  var btnTag = obj.nextElementSibling.nextElementSibling;
	  
	  console.log("imgtag = " + imgTag);
	  
	  if(obj.files && obj.files[0]){
	      var fileReader = new FileReader(); // js의 라이브러리
	      
	      // fileReader.onload는 파일을 성공적으로 읽었을 때 발생하는 이벤트
	      fileReader.onload = function(e){            
	         imgTag.width=100;
	         imgTag.height=100;
	         // e.target(이벤트가 발생한 대상) == fileReader
	         imgTag.src = e.target.result; // 파일을 읽어온 결과값(바이너리)
	         btnTag.style.display="";// button 보이게함.
	         imgTag.style.display="";
	      }
	      // 파일의 종류를 크게 두가지로 분류
	      // i) 바이너리 파일 : 데이터를 있는 그대로 읽고 쓰는 파일
	      // ii) 텍스트 파일 : 데이터를 문자로 변환한 파일
	      
	      // Base64(2^6)는 binary Data를 텍스트로 손실없이 안전하게 인코딩하는 방식
	      // 바이너리 데이터의 훼손없이 정확하게 데이터를 전달할 수 있음.
	      
	      // 바이너리 파일을 base64형식으로 변환해줌
	      fileReader.readAsDataURL(obj.files[0]);
	   }
	  
	  /* let imgName = $("#imgfile").val();
	  alert(imgName)
	  $("#pImage").val(imgName); */
	}

	function delInput(obj){
		  var imgTag = obj.previousElementSibling; // 이전 형제요소
		  var inputTag = obj.previousElementSibling.previousElementSibling;
		  var btnTag = obj;
		  
		  
		  console.log("imgTag = " + imgTag)
		  console.log("inputTag = " + inputTag)
		  
		  
		  inputTag.value="";
		  //inputTag.style.display="none";
		  imgTag.src="";
		  imgTag.style.display="none";
		  btnTag.style.display="none";
		}

</script>    




<jsp:include page="../include/a_footer.jsp" />


</body>
</html>