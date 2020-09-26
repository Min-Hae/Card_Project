<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자:카드추가</title>
<link type="text/css" rel = "stylesheet" href="../css/style.css">
<script type="text/javascript" src = "../js/script.js"></script>

</head>
<body style="margin-top: 20px;">
<%@include file="admin_top.jsp" %>
<form action="productproc.jsp?flag=insert" enctype="multipart/form-data" method = "post">
<table style="width: 90%">
<tr>
<th colspan="2">** 카드등록 ** </th>
</tr>
<tr>
<td>카드명</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>혜택</td>
<td><textarea rows="5" cols="60" name="detail"></textarea></td>
</tr>
<tr>
<td>카드 이미지</td>
<td><input type="file" name="image" size="40"></td>
</tr>
<tr>
<td>카드 구분</td>
<td>
<select name="part">
<option value ="신용카드">신용카드</option>
<option value="체크카드">체크카드</option>

</select></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<br><br>
<input type="submit" value="카드 등록">
<input type="reset" value="새로 입력">
</td>
</tr>
</table>
</form>
<%@include file="admin_bottom.jsp" %>
</body>
</html>