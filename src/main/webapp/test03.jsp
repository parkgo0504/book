<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
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
  List<Board> list=new ArrayList<Board>();
  Board vo=new Board();
  vo.setIdx(1L);
  vo.setTitle("스프링 게시판");
  vo.setWriter("홍길동");
  vo.setIndate(new Date());
  vo.setCount(0L);
  list.add(vo);
  list.add(vo);
  list.add(vo);
  //객체바인딩
  request.setAttribute("list", list);
%>
<c:forEach var="vo" items="${list}">
  ${vo.idx},${vo.title},${vo.writer},${vo.indate},${vo.count}<br/>
</c:forEach>


</body>
</html>