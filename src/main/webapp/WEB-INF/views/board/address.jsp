<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $(document).ready(function(){
	 $("#go").on("click",function(e){
		//  Controller에게 어떻게 요청하나요? - Ajax통신-JSON
		var keyword=$("#keyword").val();		
		$.ajax({
			url : "https://dapi.kakao.com/v2/local/search/address.json",  // 서버에 요청하는 URL
			headers : {"Authorization": "KakaoAK 1698f03df867097b8d07f394f59c0906 "},		
			type : "get",         // get, post, put, delete 
			data : {"query":keyword},
			dataType : "json",    // 서버에서 처리후 전달되는 데이터의 타입(json,xml)
			success : jsonHtml , // Callback(콜백함수)
			error : function(){ alert("error");}
		});
		
		$(document).ajaxStart(function(){
			$(".loading-progress").show();
			//$(".loading-progress").css("display","block");
		});
		$(document).ajaxStop(function(){
			$(".loading-progress").hide();
			//$(".loading-progress").css("display","none");
		});
	 });
  });
  function jsonHtml(data){
	  console.log(data.meta.total_count);
	  var bList="<table class='table table-hover'>";
	  bList+="<thead>";
	  bList+="<tr>";
	  bList+="<th>경도</th>";
	  bList+="<th>위도</th>";
	  bList+="</tr>";
	  bList+="</thead>";
	  bList+="<tbody>";
	  bList+="<tr>";
	  bList+="<td>"+data.documents[0].x+"</td>";
	  bList+="<td>"+data.documents[0].y+"</td>";
	  bList+="</tr>";
	  bList+="</tbody>";	  
	  bList+="</table>";
	  $("#jsonList").html(bList);
  }
</script>       
<div class="card" style="min-height: 500px;max-height: 1000px;">
    <div class="card-body">
        <h4 class="card-title">ADDRESS SEARCH</h4>
        <div class="input-group mb-3">
		  <input type="text" class="form-control" id="keyword" placeholder="Search">
		  <div class="input-group-append">
			    <button class="btn btn-secondary" id="go" type="submit">Go</button>
		  </div>
	    </div>
	    <div class="loading-progress" style="display: none;">
         <div class="spinner-border text-secondary" role="status">
          <span class="sr-only">Loading...</span>
         </div>
        </div>
        <!-- 여기에 데이터를 출력하세요 -->
        <div id="jsonList" class="box" style="overflow:scroll; height:500px; padding:10px;">
          여기에 데이터를 출력하세요
        </div>
    </div>
</div> 
