<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/KH10/css1/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<title>�Խ���</title>
</head>
<body>
<div id="header"><b>�۾���</b></div>
<br>
<form method="post" name="writeform" action="/KH10/MVC/writePro.do" onsubmit="return writeSave()">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">
<input type="hidden" name="re_level" value="${re_level}">

<div id="wrap">
<table>
<tr>
	<td colspan="2" align="right"><a href="/KH10/MVC/list.do">�� ���</a></td>
</tr>
</table>

<table width="500">
<tr>
	<th width="70">��    ��</th>
	<td width="230"><input type="text" size="30" maxlength="10" name="writer"></td>
</tr>
<tr>
	<th width="70">��    ��</th>
	<td width="230">
	<c:if test="${num==0}">
		<input type="text" size="70" maxlength="50" name="subject">
	</c:if>
	<c:if test="${num!=0}">
		<input type="text" size="70" maxlength="50" name="subject" value="[�亯]">
	</c:if>
	</td>
</tr>
<tr>
	<th width="70">E-mail</th>
	<td width="230"><input type="text" size="70" maxlength="30" name="email"></td>
</tr>
<tr>
	<th width="70">��    ��</th>
	<td width="230"><textarea rows="13" cols="75" name="content"></textarea></td>
</tr>
<tr>
	<th width="70">��й�ȣ</th>
	<td width="230"><input type="password" size="8" maxlength="12" name="passwd"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="�۾���"> 
		<input type="reset" value="�ٽ� �ۼ�">
		<input type="button" value="��Ϻ���" onclick="window.location='/KH10/MVC/list.do'">
	</td>
</tr>
</table>
</div>
</form>
</body>
</html>