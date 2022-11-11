<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   int a=10;
   for(int i=1;i<=5;i++){
   if(i%2==0){	  
%>
   <font size="<%=i%>">야호</font><br/>
<% 
   }
  }
%>
<c:set var="s" value="1"/>
<c:set var="e" value="100"/>
<c:forEach var="i" begin="${s}" end="${e}" step="1"> 
    <font size="${i}">${i%2==0 ? '야호' : ''}</font><br/>
</c:forEach>

</body>
</html>