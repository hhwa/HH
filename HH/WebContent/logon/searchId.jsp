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
	if (search.equals("ID ã��")) {
		id = manager.searchId(name, jumin1);
		if (id != null) {
%>
ã�� ���̵��
<%=id%>�Դϴ�.
<%
	} else {
%>
(id)������ �߸� �Է��ϼ̽��ϴ�.
<%
	}
	} else {
		pw = manager.searchPw(id1, jumin1);
		if (pw != null) {
%>
ã�� ��й�ȣ�´�
<%=pw%>�Դϴ�.
<%
	} else {
%>
(pw)������ �߸� �Է��ϼ̽��ϴ�.<%=pw %>
<%
	}
	}
%>




<td align="center"><br> <a href="javascript:this.close();">�ݱ�</a></td>
</head>
<body>

</body>
</html>