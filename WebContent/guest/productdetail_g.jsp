<%@page import="card.CardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>

<%
String no = request.getParameter("no");
CardDto dto = cardMgr.getCard(no);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 상세보기</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>
</head>
<body style="margin-top: 20px">
<%@include file="guest_top.jsp" %>
<form action="cartproc.jsp">
<table style="width: 90%">
<tr>
<td style="width: 20%">
  		<img src="../image/<%=dto.getImage() %>" width="150">
  	</td>
  	<td style="width: 50%; vertical-align: top;">
  		<table style="width: 100%">
  		  <tr><td>번 호 : </td><td><%=dto.getNo() %></td></tr>
  		  <tr><td>상품명 : </td><td><%=dto.getName() %></td></tr>
  		  <tr><td>등록일 : </td><td><%=dto.getSdate() %></td></tr>
  		</table>
  	</td>
  	<td style="width: 30%; vertical-align: top;">
  		<b> 카드 혜택</b><br>
  		<%= dto.getDetail() %>
  	</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">
<br>
<input type="hidden" name="card_no" value="<%= dto.getNo()%>">
<input class="dbutton" type="submit" value="찜한 카드에 담기">
<input class="dbutton" type="button" value="이전 화면으로" onclick="history.back()">
</td>
</table>


</form>

<%@include file="guest_bottom.jsp" %>


</body>
</html>