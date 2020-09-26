<%@page import="card.CardDto"%>
<%@page import="order.OrderDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="order.OrderMgr"></jsp:useBean>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>

</head>
<body style="margin-top: 20px;">
<%@ include file="guest_top.jsp" %>
<%
if(memid == null){
%>
<br>
<div style="text-align:center; color: green">
<h1>로그인 후 이용바랍니다</h1><br><br>
<a href="../member/login.jsp" style="text-align:center; color: green">로그인</a>
</div>
<%}else{ %>
<table style="width: 90%">
<tr><th>신청번호</th><th>카드명</th><th>신청일</th><th>신청상태</th>
</tr>
<%
String id = (String)session.getAttribute("idKey");
ArrayList<OrderDto> list = orderMgr.getOrder(id);
if(list.size()==0){
%>
<tr>
<td colspan="5">신청한 카드가 없습니다</td>
</tr>
<% 
}else{
	for(OrderDto ord:list){
		CardDto product = cardMgr.getCard(ord.getCard_no());
%>
<tr style="text-align: center;">
<td><%=ord.getNo() %></td>
<td><%=product.getName()%></td>
<td><%=ord.getSdate() %></td>
<td>
<%
switch(Integer.parseInt(ord.getState())){
case 1 :out.println("접수"); break;
case 2 :out.println("신청완료"); break;

default:out.println("접수중");
}
%>
</td>
</tr>
<%		
	}
}
}
%>
</table>
<%@ include file="guest_bottom.jsp" %>
</body>
</html>