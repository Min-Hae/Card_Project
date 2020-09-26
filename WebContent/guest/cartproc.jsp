<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cartMgr" class="order.CartMgr" scope="session"></jsp:useBean>
<jsp:useBean id="order" class="order.OrderBean"></jsp:useBean>
<jsp:useBean id="orderMgr" class="order.OrderMgr" />
<jsp:setProperty property="*" name="order" />

<%
//컨트롤러 역할 : flag - 구매목록 보기, 수정, 삭제 판단
String flag= request.getParameter("flag");
String id= (String)session.getAttribute("idKey");
if(id ==null){
	response.sendRedirect("../member/login.jsp"); //로그인 안하고 온 경우
}else{
	if(flag ==null){ 
		order.setId(id);
		cartMgr.addCart(order);
	//	orderMgr.insertOrder(order);
		
%>
<script type="text/javascript">
alert("찜한 카드에 추가되었습니다");
location.href="cartlist.jsp";
</script>
<%	
	}else if(flag.equals("update")){
		order.setId(id);
		cartMgr.updateCart(order);
%>
<script type="text/javascript">
//alert("장바구니의 내용 수정 성공!!!");
location.href="cartlist.jsp";
</script>
<%
	}else if(flag.equals("del")){
		cartMgr.deleteCart(order);
%>
<script type="text/javascript">
alert("찜한 카드에서 삭제되었습니다.");
location.href="cartlist.jsp";
</script>
<%		
	}
}
%>