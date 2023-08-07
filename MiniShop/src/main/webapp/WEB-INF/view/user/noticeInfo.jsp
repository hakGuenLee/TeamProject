<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 공지사항(게시판) -->

<jsp:include page="../include/header.jsp"/>


<div class="container d-flex mt-5 justify-content-center">
   <div class="w-75 shadow p-5 rounded border">
   
   	
      <h3>글상세보기</h3>
      <div class="form-group">
         <label for="subject">번호</label>
         <input type="text" class="form-control" id="bid" value=${board.pst_no }
            name="bid" readonly/>
      </div>

      <div class="form-group">
         <label for="subject">제목</label>
         <input type="text" class="form-control" id="subject" value=${board.pst_ttl }
            name="subject" disabled/>
      </div>

      <div class="form-group">
         <label for="contents">내용</label>
         <textarea class="form-control" id="contents"
            name="contents" rows="4" disabled>${board.pst_txt }</textarea>
      </div>
      <div class="form-group">
         <label for="writer">글쓴이</label>
         <input type="text" class="form-control" id="writer"  value=${board.wrt_id }
            name="writer" disabled/>
      </div>
      <div class="form-group mt-4">
         <a href="/board/noticePage" type="button" id="btn-list" class="btn btn-primary">Notice 돌아가기</a>
      </div>
   </div>
</div>

	
					
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>