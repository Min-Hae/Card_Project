<%@page import="java.net.URLEncoder"%>
<%@page import="card.CardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>혜택 종류</title>
<link rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>
</head>
<body>
<%@ include file = "guest_top.jsp" %>
<%
request.setCharacterEncoding("utf-8");

CardDto dto = new CardDto();
%>
<br>
<div class="bene"><br>
<a class="abene" href="benelist.jsp?page=<%=URLEncoder.encode("렌탈", "utf-8")%>">렌탈</a><br><br>
<img alt="rental" src="../image/rental.png">
</div>
<div class="bene"><br>
<a  class="abene" href="benelist.jsp?page=<%=URLEncoder.encode("레저", "utf-8")%>">레저</a><br><br>
<img alt="leisure" src="../image/leisure.png">
</div>
<div class="bene"><br>
<a class="abene"  href="benelist.jsp?page=<%=URLEncoder.encode("여행", "utf-8")%>">여행</a><br><br>
<img alt="travel" src="../image/travel.png">
</div>
<div class="bene"><br>
<a class="abene"  href="benelist.jsp?page=<%=URLEncoder.encode("컬쳐", "utf-8")%>">컬쳐</a><br><br>
<img alt="culture" src="../image/culture.png">

</div>


<%@ include file = "guest_bottom.jsp" %>

</body>
</html>