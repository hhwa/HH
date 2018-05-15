<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage = "../error/error_view.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>테마 갤러리</title>
<style>
A { color: blue; font-weight:bold; text-decoration:none}
A:hover { color:blue; font-weight:bold;text-decoration:underline}
</style>
</head>
<body>

<table width="100%" border="1" cellpadding="2" cellspacing="0">
<tr>
	<td>
		<jsp:include page="../module/top.jsp" flush="false"/>
	</td>
</tr>
<tr>
	<td>
		<!--  내용 부분 : 시작: -->
		<jsp:include page="${param.contentpage }" flush="false"/>
		<!--  내용 부분 : 끝 -->
	</td>
</tr>
<tr>
	<td>
		<jsp:include page="../module/bottom.jsp" flush="false"/>
	</td>
</tr>
</table>
</body>
</html>