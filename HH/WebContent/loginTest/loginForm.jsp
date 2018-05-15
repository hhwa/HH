<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	Cookie[] cookies = request.getCookies();
	String id = "";
	String id_rem = "";
	if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("id")) {
				id = cookies[i].getValue();
			}
			if (cookies[i].getName().equals("id_rem")) {
				id_rem = cookies[i].getValue();
			}
		}

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 폼</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/loginTest/login.jsp"
		method="post">

		id<input type="text" name="id" value="<%=id%>">
		pw<input type="password" name="pw">
		<%if(id_rem != null){%>
		 <input type="checkbox" name="id_rem" value="id_rem" checked>아이디저장
		<%}else{ %>
		<input type="checkbox" name="id_rem" value="id_rem" >아이디저장
		<%} %>
		<input type="submit" value="로그인">

	</form>
</body>
</html>