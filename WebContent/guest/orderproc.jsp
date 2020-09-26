<%@page import="order.OrderBean"%>
<%@page import="order.OrderDto"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cartMgr" class="order.CartMgr" scope="session" />
<jsp:useBean id="orderMgr" class="order.OrderMgr"></jsp:useBean>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>

<%
Hashtable hCart = cartMgr.getCartList();

Enumeration enu = hCart.keys();

if(hCart.size() ==0){
%>
<script type="text/javascript">
alert("주문 내역이 없습니다");
location.href="orderlist.jsp";
</script>
<%
}else{
	while(enu.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(enu.nextElement());
		orderMgr.insertOrder(order); //주문 자료를 shop_order에 저장
		cartMgr.deleteCart(order); //장바구니 내용 지우기
		
	}
%>
<script>
alert("주문처리 성공!");
location.href = "orderlist.jsp";
</script>
<%
}
%>