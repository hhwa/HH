<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="log.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String jumin1 = request.getParameter("jumin1");
	String search = request.getParameter("search");
	String id1= request.getParameter("id");
	LogonDBBean manager = LogonDBBean.getInstance();
	String id = "";
	String pw = "";
	if (search.equals("ID 찾기")) {
		id = manager.searchId(name, jumin1);
		if (id != null) {
%>
찾는 아이디는
<%=id%>입니다.
<%
	} else {
%>
(id)정보를 잘못 입력하셨습니다.
<%
	}
	} else {
		pw = manager.searchPw(id1, jumin1);
		if (pw != null) {
%>
찾는 비밀번호는는
<%=pw%>입니다.
<%
	} else {
%>
(pw)정보를 잘못 입력하셨습니다.<%=pw %>
<%
	}
	}
%>




<td align="center"><br> <a href="javascript:this.close();">닫기</a></td>
</head>
<body>

</body>
</html>