<%@page import="card.CardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<meta charset="UTF-8">
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>
<title>상품목록</title>
</head>
<body>

<p/>
<%@include file="guest_top.jsp" %>

<%
request.setCharacterEncoding("utf-8");
String bene = new String(request.getParameter("page").getBytes("ISO-8859-1"), "UTF-8");

ArrayList<CardDto> list = cardMgr.getCardBenefit(bene);

for(CardDto p:list){
%>
<div class="card" style="height: 30rem;width: 20rem;margin-right:10px;float:left;">
  <img class="card-img-top" src="../image/<%=p.getImage() %>" alt="Card image cap">
  <div class="card-body">
  <h3><%=p.getName() %></h3>
  <%=p.getDetail() %><br>
  <a href="javascript:productDetail_guest('<%=p.getNo() %>')" class="btn btn-success" >상세보기</a>
  </div>
  </div>

<%
}
%>
<br><br>
<%@include file="guest_bottom.jsp" %>
<form action="productdetail_g.jsp" name="detailFrm" method="post">
<input type="hidden" name="no">
</form>
</body>
</html>