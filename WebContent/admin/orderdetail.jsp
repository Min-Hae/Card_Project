<%@page import="card.CardDto"%>
<%@page import="order.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="orderMgr" class="order.OrderMgr" />
    <jsp:useBean id="cardMgr" class="card.CardMgr" />

<%

OrderDto order = orderMgr.getOrderDetail(request.getParameter("no"));
CardDto product = cardMgr.getCard(order.getCard_no());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청관리:관리자</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>
</head>
<body style="margin-top: 20px">
<%@include file="admin_top.jsp" %>
<form action="orderproc_admin.jsp" name="detailFrm" method = "post">

<table style="width: 90%">
<tr>
<td>고객 아이디: <%=order.getId() %></td>
<td>주문번호: <%=order.getNo() %></td>
<td>카드번호: <%=order.getCard_no() %></td>
<td>카드명: <%=product.getName() %></td>
</tr>
<tr>

<td>신청일 : <%=order.getSdate() %></td>

</tr>
<tr>
<td colspan="4" style="text-align: center;">
신청상태:
<select name="state">
<option value="1">접수</option>
<option value="2">승인 완료</option>
</select>
<script type="text/javascript">
document.detailFrm.state.value = <%=order.getState() %>
</script>
</td>
</tr>
<tr>
<td colspan="4" style="text-align: center;">
<input type="button" value=" 수 정 " onclick="orderUpdate(this.form)"> /
<input type="button" value=" 삭 제 " onclick="orderDelete(this.form)">
<input type="hidden" name="no" value="<%=order.getNo() %>">
<input type="hidden" name="flag">
</td>
</tr>
</table>
</form>
<%@include file="admin_bottom.jsp" %>

</body>
</html>