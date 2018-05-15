<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<link href="/KH10/css1/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function deleteSave(){
	if(document.delForm.passwd.value=''){
		alert("비밀번호를 입력하십시요");
		document.delForm.passwd.focus();
		return false;
	}
}
</script>
</head>
<body>
<div id="header"><b>글 삭제</b></div>
<br>
<div id="wrap">
<form action="/KH10/MVC/deletePro.do?pageNum=${pageNum}" method="post" name="delForm" onsubmit="return deleteSave()">
	<table>
		<tr height="30">
			<td align="center">
				<b>비밀번호를 입력해주세요</b>
			</td>
		</tr>
		<tr height="30">
			<td align="center">
				비밀번호 : <input type="password" name="passwd" size="12" maxlength="12">
				<input type="hidden" name="num" value="${num}">
			</td>
		</tr>
		<tr height="30">
			<td align="center">
				<input type="submit" value="글삭제">
				<input type="button" value="글목록" onclick="document.location.href='/KH10/MVC/list.do?pageNum=${pageNum}'">
			</td>
		</tr>			
	</table>
	</form>
</div>
</body>
</html>