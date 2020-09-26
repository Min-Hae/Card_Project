<%@page import="card.CardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cardMgr" class="card.CardMgr"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드관리</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>

</head>
<body style="margin-top:10px;">

<br>
<%@include file="admin_top.jsp" %><br>
<table style="width: 90%">
<tr style="text-align:center">
<td style="text-align:center; font-size:15pt">
<a href="productinsert.jsp">[카드 추가]</a>
</td>
</tr>

</table>
<br><br>
<table style="width: 90%">

<tr style="background-color: yello;">
<th>번호</th><th>카드명</th><th>등록일</th><th>상세보기</th>

</tr>
<%
ArrayList<CardDto> list = cardMgr.getCardAll();
if(list.size() == 0){
%>
<tr><td colspan="6">등록된 카드가 없습니다.</td></tr>
<%
}else{
for(CardDto p:list){
	%>
	<tr style="text-align: center;">
	<td><%= p.getNo() %></td>
	<td><%= p.getName() %></td>
	<td><%= p.getSdate() %></td>
	<td>
	<a href="javascript:productDetail('<%=p.getNo() %>')">보기</a></td>
	</tr>
	<%
} 
}
%>
</table>
<br>
<%@include file="admin_bottom.jsp" %>
<form action="productdetail.jsp" name="detailForm" method="post">
<input type="hidden" name="no">
</form>
</body>
</html>