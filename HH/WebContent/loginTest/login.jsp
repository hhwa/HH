<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.net.*"%>
<%
	Cookie cookie=null;
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String id_rem = request.getParameter("id_rem");

	if (id.equals(pw)) {
		if(id_rem != null){
			cookie = new Cookie("id",URLEncoder.encode(id,"euc-kr"));
			cookie.setPath("/");
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}else {
			cookie = new Cookie("id","");
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="<%=request.getContextPath()%>/loginTest/loginForm.jsp" method="post">

<%=id %>�� �α��� �߽��ϴ�.

<input type="submit" value="�α׾ƿ�">
</form>
</body>
</html>

<%
	} else {
%>
<script>
	alert("�α��ο� �����Ͽ����ϴ�.");
	history.go(-1);
</script>
<%
	}
%>