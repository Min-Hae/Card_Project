<%@page import="card.CardDto"%>
<%@page import="card.CardMgr"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>    
<jsp:useBean id="cartMgr" class="order.CartMgr" scope="session"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>

</head>
<body style="margin-top: 20px">

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
<tr>
<th>카드 이름</th><th>조회</th>
</tr>
<%
Hashtable hCart = cartMgr.getCartList(); //카트에 저장된 전체 자료 읽기
if(hCart.size() == 0){
%>
<tr><td colspan="5">주문 건수가 없습니다</td></tr>
<% 	
}else{
	Enumeration enu = hCart.keys();
	while(enu.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(enu.nextElement());
		CardDto card = cardMgr.getCard(order.getCard_no());
	
%>
<tr style="text-align: center;">
<td><%=card.getName() %></td>

<td><a href="javascript:productDetail_guest('<%=card.getNo() %>')">상세보기</a>
</tr>
<%} %>
<tr>
<td colspan="4">
<br style="font-size:15px">
<a href ="orderproc.jsp" style="font-size:15px">[신청하기]</a>
</td>
</tr>
</table>
<% 
}
}
%>

<form action="productdetail_g.jsp" name="detailFrm">
<input type="hidden" name="no">
</form>
<br>
<%@ include file="guest_bottom.jsp" %>
</body>
</html>