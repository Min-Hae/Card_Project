<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminId = (String)session.getAttribute("adminKey");
if(adminId == null){
	response.sendRedirect("adminlogin.jsp");
}
%>
<div class="log">
<span><a href="adminlogout.jsp"> 로그아웃</a></span>
</div>
<table class="gtable">
<tr style="background-color: white;text-align: center;">
<td class="gtr"><a href="../main.jsp">고객용 화면</a></td>
<td class="gtr"><a href="admin_index.jsp">홈페이지</a></td>
<td class="gtr"><a href="membermanager.jsp">회원관리</a></td>
<td class="gtr"><a href="productmanager.jsp">카드관리</a></td>
<td class="gtr"><a href="ordermanager.jsp">카드신청관리</a></td>
</tr>
</table>
<hr style="width: 80%;" float: left;"/>