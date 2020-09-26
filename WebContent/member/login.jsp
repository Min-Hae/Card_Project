<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("idKey"); //세션 읽기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
//	document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
	document.getElementById("btnHome").addEventListener("click", funcHome, false);

}

function funcLogin(){
	//alert("a");
	if(loginForm.id.value===""){
		alert("id 입력하세요");
		loginForm.id.focus();
	}else if(loginForm.passwd.value===""){
		alert("비밀번호 입력하세요");
		loginForm.passwd.focus();
	}else{
		loginForm.action = "loginproc.jsp";
		loginForm.method ="post";
		loginForm.submit();
	}
}

function funcNew(){
	location.href="register.jsp";
}

function funcHome(){
	location.href ="../main.jsp";
}
</script>
</head>
<body>
<%@ include file="../guest/guest_top.jsp" %>

<br>
<div class="loginbanner"><br><br>
<h1>앗! 회원이 아니신가요?</h1>
<a class="abene" href="register.jsp">회원가입하러 가기</a>
<br><br>
</div><br><br>
	<form name="loginForm"  class="logf">
	<table class="logf">
	  <tr class="trlog">
	  	<td class="tdlog">로그인</td>
	  </tr>
	  <tr class="trlog">
	  	<td class="tdlog">아이디 : <input type="text" name="id"></td>
	  </tr>
	
	  <tr class="trlog">
	  	<td class="tdlog">비밀번호 : <input type="text" name="passwd"></td>
	  </tr>
	  <tr>
	  	<td class="tdlog">
	  		<input type="button" value="로 그 인" id="btnLogin"> &nbsp;
	  	 	 <input type="button" value="홈 페 이 지" id="btnHome">
	  	</td>
	  </tr>
	</table>
	</form>
<%@ include file="../guest/guest_bottom.jsp" %>

</body>
</html>