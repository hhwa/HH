<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<link href="/KH10/css1/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function deleteSave(){
	if(document.delForm.passwd.value=''){
		alert("��й�ȣ�� �Է��Ͻʽÿ�");
		document.delForm.passwd.focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="header"><b>�� ����</b></div>
<br>
<div id="wrap">
<form action="/KH10/MVC/deletePro.do?pageNum=${pageNum}" method="post" name="delForm" onsubmit="return deleteSave()">
	<table>
		<tr height="30">
			<td align="center">
				<b>��й�ȣ�� �Է����ּ���</b>
			</td>
		</tr>
		<tr height="30">
			<td align="center">
				��й�ȣ : <input type="password" name="passwd" size="12" maxlength="12">
				<input type="hidden" name="num" value="${num}">
			</td>
		</tr>
		<tr height="30">
			<td align="center">
				<input type="submit" value="�ۻ���">
				<input type="button" value="�۸��" onclick="document.location.href='/KH10/MVC/list.do?pageNum=${pageNum}'">
			</td>
		</tr>			
	</table>
	</form>
</div>
</body>
</html>