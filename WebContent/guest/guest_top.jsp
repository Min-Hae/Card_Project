<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memid = (String)session.getAttribute("idKey");
String log ="";

if(memid == null)
	log ="<a class='alla' href='../member/login.jsp'>로그인</a>";
else
	log ="<a class='alla' href='../member/logout.jsp'>로그아웃</a>";
String mem ="";
if(memid == null)
	mem ="<a class='alla' href='../member/register.jsp'>회원가입</a>";
else
	mem ="<a class='alla' href='../member/memberupdate.jsp'>회원수정</a>";
%>
<div class="icon">
<a href="guest_index.jsp"><img alt="icon" src="../image/icon.JPG"></a>
</div>
<div class="log">
<span><%=log %> </span>
<span> | </span>
<span><%=mem %></span>
</div>
<br><br>
<table class="gtable">
<tr>
<td class="gtr"><a  class='atop' href="productlist.jsp">카드보기</a></td>
<td class="gtr"><a class='atop' href="cartlist.jsp">찜한 카드</a></td>
<td class="gtr"><a class='atop' href="orderlist.jsp">내 카드</a></td>
<td class="gtr"><a class='atop' href="benefit.jsp">혜택 종류</a></td>
</tr>
</table>
<hr>