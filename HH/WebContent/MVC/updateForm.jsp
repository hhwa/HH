<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/KH10/css1/style.css" rel="stylesheet" type="text/css"> 
<title>�Խ���</title>
</head>
<body>
<div id="header"><b>�� ����</b></div>
<br>

<form action="/KH10/MVC/updatePro.do?PageNum=${pageNum }" method="post" name="writeform" onsubmit="return writeSave()">
<table>
	<tr>
		<th width="70">��   ��</th>
		<td align="left" width="230">
			<input type="text" size="30" maxlength="10" name="writer" value="${article.writer }">
			<input type="hidden" name="num" value="${article.num }">
		</td>
	</tr>
	<tr>
		<th width="70">��    ��</th>
		<td width="230" align="left"><input type="text" size="70" maxlength="50" name="subject" value="${article.subject }"></td>
	</tr>
	<tr>
		<th width="70">E-mail</th>
		<td width="230" align="left"><input type="text" size="70" maxlength="30" name="email" value="${article.email }"></td>
	</tr>
	<tr>
		<th width="70">��    ��</th>
		<td width="230" align="left"><textarea rows="13" cols="75" name="content">${article.content }</textarea></td>
	</tr>
	<tr>
		<th width="70">��й�ȣ</th>
		<td width="230" align="left"><input type="password" size="8" maxlength="12" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="�� ����">
			<input type="reset" value="�ٽ��ۼ�">
			<input type="button" value="��Ϻ���" onclick="document.location.href='/KH10/MVC/list.do?pageNum=${pageNum}'">
		</td>
	</tr>
</table>
</form>

</body>
</html>