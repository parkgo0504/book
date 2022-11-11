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
   String[] flist={"사과","바나나","포도","귤","오랜지"};
   //객체바인딩
   request.setAttribute("flist", flist);
%>
<c:forEach var="f" items="${flist}">
   ${f}<br/>
</c:forEach>
</body>
</html>