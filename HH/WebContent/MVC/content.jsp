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
<div id="header"><b>�� ���� ����</b></div>
<br>

<div id="wrap">
<table width="500">
	<tr height="30">
		<td align="center" width="125">�۹�ȣ</td>
		<td align="center" width="125">${article.num }</td>
		<td align="center" width="125">��ȸ��</td>
		<td align="center" width="125">${article.readcount }</td>
	</tr>
	<tr height="30">
		<td align="center" width="125">�ۼ���</td>
		<td align="center" width="125">${article.writer }</td>
		<td align="center" width="125">�ۼ���</td>
		<td align="center" width="125">${article.reg_date }</td>
	</tr>
	<tr height="30">
		<td align="center" width="125">����</td>
		<td align="center" width="375" colspan="3">${article.subject }</td>
	</tr>
	<tr height="30">
		<td align="center" width="125">����</td>
		<td align="center" width="375" colspan="3">${article.content }</td>
	</tr>
	<tr height="30">
		<td colspan="4" align="right">
		<input type="button" value="�ۼ���" onclick="document.location.href='/KH10/MVC/updateForm.do?num=${article.num}&pageNum=${pageNum }'">
	   	&nbsp;&nbsp;&nbsp;&nbsp;
  		<input type="button" value="�ۻ���" onclick="document.location.href='/KH10/MVC/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
   		&nbsp;&nbsp;&nbsp;&nbsp;
      	<input type="button" value="��۾���" onclick="document.location.href='/KH10/MVC/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
   		&nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="�۸��" onclick="document.location.href='/KH10/MVC/list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>
</div>
</body>
</html>