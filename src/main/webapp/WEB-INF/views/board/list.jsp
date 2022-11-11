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
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5187e2ddaa9f772f7cf1f943b9d68472"></script>
  <script type="text/javascript">
    $(document).ready(function(){    	
    	
    	// 주소 검색 버튼이 클릭 되었을 때 실행
			$("#addr").on("click", function(e){ 
          var address=$("#address").val();
          $.ajax({
             url : "https://dapi.kakao.com/v2/local/search/address.json",  // 서버에 요청하는 URL
             headers : {"Authorization": "KakaoAK 9bc81f16e40c74c5c91a5f0d8f80670a"},      
             type : "get",         // get, post, put, delete 
             data : {"query":address},
             dataType : "json",    // 서버에서 처리후 전달되는 데이터의 타입(json,xml)
             success : mapHtml , // Callback(콜백함수)
             error : function(){ alert("error");}
          });
       });
		
    	$("button[data-oper='register']").click(function(){
    		location.href="register.do";
    	});
    	// 페이지번호 클릭(a tag)시 list.do로 이동하는 부분(page, type, keyword)
    	var pageForm=$("#pageForm");
    	$(".pagination a").on("click", function(e){
    		e.preventDefault(); // a tag의 고유한 기능을 막는다.
    		var page=$(this).attr("href");
    		// hidden의 page에 값을 저장
    		$("#page").val(page);
    		pageForm.submit(); //전송
    	});
    	// 상세보기 a tag를 클릭시 get.do로 이동(idx, page, type, keyword)
    	$(".move").on("click", function(e){
    		e.preventDefault();
    		var idx=$(this).attr("href");
    		var tag="<input type='hidden' name='idx' value='"+idx+"'>";
    		pageForm.append(tag); // 추가
    		pageForm.attr("action","get.do");
    		pageForm.attr("method", "get");
    		pageForm.submit();    		
    	});
    	
    });  
    function delPopup(){
    	//alert("삭제된 게시물 입니다.");
    	//jQuery model 띄우기? id="myModal"
    	$("#myModal").modal("show");
    }
    function mapHtml(data){
    	// 여기에서 지도를 띄우기
    	var x=data.documents[0].x; //경도
    	var y=data.documents[0].y; //위도
    	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(y, x,), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };	
	    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	    var map = new kakao.maps.Map(mapContainer, mapOption); 
	    // 마커 띄우기 	    	
	    // 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(y, x);
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	    
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">${m.memName}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		
		// 마커에 클릭이벤트를 등록합니다
		if(${!empty m}){
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
		}
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	    
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">${m.memName}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		
		// 마커에 클릭이벤트를 등록합니다
		if(${!empty m}){
			kakao.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
		}    	
    }
  </script>
</head>
<body>
 
  <div class="card">
    <div class="card-header">
		<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		    <h1>Spring Framework!!</h1>
		    <p>Bootstrap is the most popular HTML, CSS...</p>
		  </div>
		</div>	
    </div>
      
    <div class="card-body">
      <div class="row justify-content-around">
         <div class="col-lg-2">
            <jsp:include page="left.jsp"/>
         </div>
         <div class="col-lg-7">
            <div class="card" style="min-height: 500px;max-height: 1000px;">
               <div class="card-body">
                  <h4 class="card-title">BOARD</h4>
                  <!-- 게시판 리스트보기 화면 구현 -->
		        <table class="table table-hover">
		        <thead>
		           <th>번호</th>
		           <th>제목</th>
		           <th>작성자</th>
		           <th>작성일</th>
		           <th>조회수</th>
		        </thead>
		        <tbody>
		          <c:forEach var="vo" items="${list}">
		          <tr>
		            <td>${vo.idx}</td>
		            <td>
		            <c:if test="${vo.blevel>0}">
		               <c:forEach begin="1" end="${vo.blevel}">
		                  <span style="padding-left: 15px"></span>		                  
		               </c:forEach>
		               <i class="bi bi-arrow-return-right"></i>
		               [RE]
		            </c:if> 
		            <c:if test="${vo.bdelete!=1}">
		            <a class="move" href="${vo.idx}"><c:out value="${vo.title}"/></a>
		            </c:if>
		            <c:if test="${vo.bdelete==1}">
		            <a href="javascript:delPopup()">삭제된 게시물 입니다.</a>
		            </c:if>
		            </td>
		            <td>${vo.writer}</td>
		            <td><fmt:formatDate value="${vo.indate}"  pattern="yyyy-MM-dd"/></td>
		            <td>${vo.count}</td>
		          </tr>
		          </c:forEach>
		        </tbody>
		      </table>  
		      <c:if test="${!empty m}">
		        <button data-oper="register" class="btn btn-sm btn-default">글쓰기</button>
              </c:if>
              
              <!-- 검색메뉴 -->
              <form class="form-inline" action="list.do" method="post">
              <div class="container mt-3">			
				  <div class="input-group mb-3">				   
				    <div class="input-group-prepend">				   
				      <select name="type" class="form-control">
					      <option value="writer" ${pageMaker.cri.type=='writer' ? 'selected' : ''}>이름</option>
					      <option value="title" ${pageMaker.cri.type=='title' ? 'selected' : ''}>제목</option>
					      <option value="content" ${pageMaker.cri.type=='content' ? 'selected' : ''}>내용</option>                    
					  </select> 
				    </div>
				    <input type="text" class="form-control" placeholder="Some text" name="keyword" value="${pageMaker.cri.keyword}">
				     <div class="input-group-append">
				      <button class="btn btn-secondary" type="submit">Search</button> 
				     </div>				  
				  </div>
               </div>
                </form>	           	  
              <!-- 페이징 START -->
                <ul class="pagination justify-content-center">
                <c:if test="${pageMaker.prev}">
				  <li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>  
				  <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				  <li class="page-item ${(pageNum==pageMaker.cri.page) ? 'active' :''}" ><a class="page-link" href="${pageNum}">${pageNum}</a></li>
				  </c:forEach>
				<c:if test="${pageMaker.next}">
				  <li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">Next</a></li>
				</c:if>
				</ul>
              <!-- 페이징 END -->
               <form id="pageForm" action="list.do" method="post">
                  <input type="hidden" id="page" name="page" value="${pageMaker.cri.page}"/>
                  <input type="hidden" name="type" value="${pageMaker.cri.type}"/>
                  <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
               </form>                           
             </div>
            </div> 
         </div>
         <div class="col-lg-3">
             <jsp:include page="book.jsp"/>
         </div>
      </div>    
    </div> 
    <div class="card-footer">AI.BigData 취업역량강화_송도혁</div>
  </div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Message</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        삭제된 게시물 입니다.
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
</body>
</html>  