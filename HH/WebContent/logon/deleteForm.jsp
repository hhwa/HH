<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="color.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function focusIt(){
	document.myform.passwd.focus();
}
</script>
</head>
<body onLoad="focusIt()" bgcolor="<%=bodyback_c%>">
<form name="myform" action="deletePro.jsp" method="post" onsubmit="return checkIt()">
<table border="1" cellpadding="1" cellpacing="1" width="260" align="center">
<tr height="30">
<td colspan="2" align="center" bgcolor="<%=title_c %>">
<font size="+1"><b>회원 탈퇴</b></font></td></tr>
<tr height="30">
<td width="110" bgcolor="<%=value_c %>" align="center">비밀번호</td>
<td width="150" bgcolor="<%=value_c %>" align="center">
<input type="password" name="passwd" size="15" maxlength="12"></td></tr>
<tr height="30" align="center" bgcolor="<%=value_c%>">
<td colspan="2" align="center" bgcolor="<%=value_c %>">
<input type="submit" value="회원탈퇴">
<input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
</td>
</table>
</form>
</body>
</html>