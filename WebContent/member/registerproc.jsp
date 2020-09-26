<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberBean" class="member.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="memberBean" />
<jsp:useBean id="memberMgr" class="member.MemberMgr"></jsp:useBean>

<%
boolean b = memberMgr.memberInsert(memberBean);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
if(b){
	out.println("<b>회원가입을 축하합니다.</b>");
	out.println("<a href ='login.jsp'>로그인</a>");
}else{
	%>
	<script>
	alert("정보가 올바르지 않습니다.")
	history.back();
	</script>
<%	
}

%>
</body>
</html>