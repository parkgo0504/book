<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	$("button").on("click", function(e){ 
    		  var oper=$(this).data("oper");
    		  var frm=$("#frm");
    		  if(oper=="update"){
    			  frm.attr("action","updateForm.do");
    		  }else if(oper=="remove"){
    			  frm.attr("action","remove.do");
    			  //frm.submit();    			  
    		  }else if(oper=="list"){
    			  frm.attr("action", "list.do");
    			  //frm.submit();
    		  }else if(oper=="reply"){
    			  frm.attr("action", "replyForm.do");
    		  }
    		  frm.submit();
    	});    	
    });  
  </script>
</head>
<body>

  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Bootstrap Tutorial</h1>
		    <p>Bootstrap is the most popular HTML, CSS...</p>
		  </div>
		</div>
    </div>
    <div class="card-body">
      <div class="row">
         <div class="col-lg-2">
           <jsp:include page="left.jsp"/>
         </div>
         <div class="col-lg-7">
           <!--  사용자화면 -->
			<div class="card" style="min-height: 500px;max-height: 1000px;">
			    <div class="card-body">
			    <h4 class="card-title">상세보기</h4>
			      	<form id="frm">
			      	  <input type="hidden" name="idx" value="${vo.idx}"/> 
			      	  <input type="hidden" name="page" value="${cri.page}"/> 
			      	  <input type="hidden" name="type" value="${cri.type}"/>
			      	  <input type="hidden" name="keyword" value="${cri.keyword}"/>
					  <div class="form-group">
					    <label for="title">제목:</label>
					    <input type="text" class="form-control" readonly="readonly" value="<c:out value='${vo.title}'/>">
					  </div>
					  <div class="form-group">
					    <label for="content">내용:</label>
					    <textarea rows="7" class="form-control" readonly="readonly">${vo.content}</textarea> 
					  </div>
					  <div class="form-group">
					    <label for="writer">작성자:</label>
					    <input type="text" class="form-control" readonly="readonly" value="${vo.writer}">
					  </div>				
					   <button type="button" data-oper="reply" class="btn btn-sm btn-info" ${!empty m ? '' : "disabled='disabled'"}>답글</button>	  
					   <button type="button" data-oper="update" class="btn btn-sm btn-primary" ${m.memId eq vo.memId ? '' : "disabled='disabled'" }>수정</button>
					   <button type="button" data-oper="remove" class="btn btn-sm btn-warning" ${m.memId eq vo.memId ? '' : "disabled='disabled'" }>삭제</button>
					   <button type="button" data-oper="list" class="btn btn-sm btn-success">목록</button>
					</form>
			    </div>   
			 </div>           
         </div>
         <div class="col-lg-3">
           <jsp:include page="right.jsp"/>
         </div>
      </div>    
    </div> 
    <div class="card-footer">AI.BigData 취업역량강화_박매일</div>
  </div>

</body>
</html>
    