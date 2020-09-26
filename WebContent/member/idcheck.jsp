<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="memberMgr" class="member.MemberMgr" scope="page" />
    
<%
request.setCharacterEncoding("utf-8");
String id= request.getParameter("id");
boolean b = memberMgr.checkId(id);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id 중복</title>
<link type="text/css" rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body style="text-align:center; margin-top:30px;">
<b><%=id %> : </b>
<%
if(b){
%>
이미 사용 중인 id 입니다.<p/>
<a href="#" onclick="opener.document.regForm.id.focus();window.close()">닫기</a>
<%	
}else{ %>
	사용 가능합니다. <p/>
	<a href="#" onclick="opener.document.regForm.pw.focus();window.close()">닫기</a>
	
<%	
}
%>
</body>
</html>