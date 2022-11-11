<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
           <div class="card" style="min-height: 500px;max-height: 1000px;">
              <div class="row">
               <div class="col-lg-12">
               <div class="card-body">
                 <c:if test="${empty m}">
                 <h4 class="card-title">GUEST</h4>
                 <p class="card-text">회원님 Welcome!</p>
                 <form action="login.do" method="post">
                    <div class="form-group">
                      <label for="memId">아이디</label>
                      <input type="text" class="form-control" name="memId"/>
                    </div>
                    <div class="form-group">
                      <label for="memPwd">비밀번호</label>
                      <input type="password" class="form-control" name="memPwd"/>
                    </div>
                    <button type="submit" class="btn btn-sm btn-primary form-control">로그인</button>
                 </form>
                 </c:if>
                 <c:if test="${!empty m}">
                   <h4 class="card-title">${m.memName}</h4>
                   <p class="card-text">회원님 Welcome!</p>
                   <form action="logout.do">  
                    <button type="submit" class="btn btn-sm btn-primary form-control">로그아웃</button>
                   </form>
                 </c:if>
                </div>
                </div>               
               </div>
               <div class="row">
	             <div class="col-lg-12">
	                <div class="card-body">	  
	                
	                        <p class="card-text">My POSITION</p>
					<div class="input-group mb-3">
                          <input type="text" class="form-control" id="address" placeholder="Search">
                          <div class="input-group-append">
                               <button class="btn btn-secondary" id="addr" type="button">Go</button>
                          </div>
                     </div>
	                        <div id="map" style="width:100%;height:150px;"></div>
	                </div>
	             </div>
               </div>
            </div>
           