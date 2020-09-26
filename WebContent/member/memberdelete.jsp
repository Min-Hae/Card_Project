<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="memberBean" class="member.MemberBean" scope="page" />
<jsp:setProperty property="*" name="memberBean" />
<jsp:useBean id="memberMgr" class="member.MemberMgr" />

<%
String id = (String)session.getAttribute("idKey");
boolean b = memberMgr.deleteMember(memberBean, id); 

if(b){
%>
	<script>
	alert("안녕히 가세요");
	location.href="../guest/guest_index.jsp";
	</script>
<%}else{%>
	<script>
	alert("삭제 실패\n관리자에게 문의 바람");
	history.back();
	</script>
<%	
}
%>