<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="member.MemberDto" />
<jsp:useBean id="memberMgr" class="member.MemberMgr" />
<jsp:useBean id="dto" class="member.MemberDto" /> 

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");

bean = memberMgr.getMember(id); 

if(bean == null){
	response.sendRedirect("../guest/guest_index.jsp");
	return;  //service 메소드를 탈출
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnUpdate").onclick=memberUpdate;
	document.getElementById("btnUpdateCancel").onclick=memberUpdateCancel;
}
</script>
</head>
<body>
<form action="memberupdateproc.jsp" name="updateForm" method="post">
<table>
  <tr style="background-color: navy;">
  	<td colspan="2" style="color: white">
  		<b><%=bean.getName() %></b> 회원님의 정보를 수정합니다 
  	</td>
  </tr>
  <tr>
  	<td>아이디</td>
  	<td><%=bean.getId() %></td>
  </tr>
  <tr>
  	<td>비밀번호</td>
  	<td>
  		<input type="text" name="pw" value="<%=bean.getPw()%>">
  	</td>
  </tr>
  <tr>
  	<td>회원명</td>
  	<td>
  		<input type="text" name="name" value="<%=bean.getName()%>">
  	</td>
  </tr>
  <tr>
  	<td>이메일</td>
  	<td>
  		<input type="text" name="email" value="<%=bean.getEmail()%>">
  	</td>
  </tr>
  <tr>
  	<td>전화번호</td>
  	<td>
  		<input type="text" name="phone" value="<%=bean.getPhone()%>">
  	</td>
  </tr>
  <tr>
  	<td>우편번호</td>
  	<td>
  		<input type="text" name="zipcode" value="<%=bean.getZipcode()%>">
  	</td>
  </tr>
  <tr>
  	<td>주소</td>
  	<td>
  		<input type="text" name="address" value="<%=bean.getAddress()%>" size="50">
  	</td>
  </tr>
  <tr>
  	<td colspan="2" style="text-align: center;">
  		<input type="button" value="수정완료" id="btnUpdate">
  		<input type="button" value="수정취소" id="btnUpdateCancel">
  	</td>
  </tr>
</table>
</form>

</body>
</html>





