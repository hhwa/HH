<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="color.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID/PW ã��</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function checkIt(){
	var userinput=eval("document.searchForm");
	if(!userinput.name.value){
		alert("�̸��� �Է��ϼ���");
		return false;
	}
	if(!userinput.jumin1.value){
		alert("��������� �Է��ϼ���");
		return false;
	}
}
</script>
</head>
<body>

<form action="searchId.jsp" name="searchForm" method="post" onsubmit="return checkIt();" >

	<table border="1" align="center">
		<tr>
			<td>�̸�</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>�������</td>
			<td><input type="text" name="jumin1" size="15" maxlength="6"></td>
		</tr>
		<tr>
		<td><input type="submit" name="search" value="ID ã��">
		<td><input type="button" name="search" value="PW ã��" onclick="javascript:window.location='searchForm1.jsp'">
			
	</table>
</form>

</body>
</html>