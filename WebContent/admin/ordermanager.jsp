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
<title>신청관리 : 관리자</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>

</head>
<body style="margin-top:20px">
<%@include file="admin_top.jsp" %>
<form action="orderdetail.jsp" name="detailFrm" method="post">

<table style="width: 80%">
<tr>
<th>신청번호</th><th>고객아이디</th><th>신청일</th><th>신청상태</th><th>보기</th>
</tr>
<%
ArrayList<OrderDto> list = orderMgr.getOrderAll();
if(list.size() ==0){
%>
<tr><td colspan="7">주문 내역이 없습니다.</td></tr>	
<%
}else{
	for(int i=0;i<list.size();i++){
		OrderDto order = list.get(i);
		CardDto card = cardMgr.getCard(order.getCard_no());
%>
<tr style="text-align: center;">
<td><%=order.getNo() %></td>
<td><%=order.getId() %></td>
<td><%=order.getSdate() %></td>
<td>
<% 
switch(Integer.parseInt(order.getState())){
case 1 :out.println("접수"); break;
case 2 :out.println("신청 완료"); break;

default:out.println("접수 중");
}
%>
</td>
<td>
<a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
</tr>
<%		
	}
}
%>
</table>
<%@include file="admin_bottom.jsp" %>

<input type="hidden" name="no">
</form>
</body>
</html>