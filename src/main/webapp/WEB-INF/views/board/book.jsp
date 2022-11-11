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
			url : "https://dapi.kakao.com/v3/search/book?target=title",  // 서버에 요청하는 URL
			headers : {"Authorization": "KakaoAK 1698f03df867097b8d07f394f59c0906 "},		
			type : "get",         // get, post, put, delete 
			data : {"query":keyword,"size":20},
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
	 // input box에서 키업이 되면 ajax()통신
	 $("#keyword").autocomplete({
		 source : function(){
				var keyword=$("#keyword").val();		
				$.ajax({
					url : "https://dapi.kakao.com/v3/search/book?target=title",  // 서버에 요청하는 URL
					headers : {"Authorization": "KakaoAK 3b226ff0eee967ce9d6042d472bd41fb"},		
					type : "get",         // get, post, put, delete 
					data : {"query":keyword,"size":20},
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
		 }, // input 필드에 타이핑시 동작합니다
		 minLength : 1 // 조회를 위한 최소 글자수입니다.
	 });	 
  });
  function jsonHtml(data){
	  console.log(data.meta.total_count);
	  var bList="<table class='table table-hover'>";
	  bList+="<thead>";
	  bList+="<tr>";
	  bList+="<th>책이미지</th>";
	  bList+="<th>저자</th>";
	  bList+="</tr>";
	  bList+="</thead>";
	  bList+="<tbody>";
	  $.each(data.documents,function(index, obj){
		  var image=obj.thumbnail;
		  var price=obj.price;
		  var url=obj.url;
	      bList+="<tr>";
		  bList+="<td><a href='"+url+"'><img src='"+image+"' width='50px' height='60px' alt='이미지'></a></td>";
		  bList+="<td>"+price+"</td>";
		  bList+="</tr>"; 		  
	  });
	  bList+="</tbody>";	  
	  bList+="</table>";
	  $("#jsonList").html(bList);
  }
</script>       
<div class="card" style="min-height: 500px;max-height: 1000px;">
    <div class="card-body">
        <h4 class="card-title">BOOK SEARCH</h4>
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
