<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cardMgr" class="card.CardMgr" scope="page"></jsp:useBean>

<%
String flag = request.getParameter("flag");
boolean result = false;
if(flag.equals("insert")){
	//System.out.println("insert");
	result = cardMgr.insertCard(request);
}else if(flag.equals("update")){
	//System.out.println("update");
	result = cardMgr.updateCard(request);


}else if(flag.equals("delete")){
	result = cardMgr.deleteCard(request.getParameter("no"));
}else{
	response.sendRedirect("productmanager.jsp");
}
if(result){
%>
<script>
alert("정상 처리되었습니다.");
location.href="productmanager.jsp";
</script>
<%}else{ %>

<script>
alert("오류 발생\n관리자에게 문의 바람");
location.href="productmanager.jsp";
</script>
<%} %>

