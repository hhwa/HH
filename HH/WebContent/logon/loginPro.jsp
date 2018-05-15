<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="log.LogonDBBean"%>
<%@ page import="util.CookieBox" %>
<%

	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String id_rem = request.getParameter("id_rem");
	

	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id, passwd);

	if (check == 1) {
		if (id_rem!=null){
			response.addCookie(CookieBox.createCookie("id", id, "/", -1));
			response.addCookie(CookieBox.createCookie("id_rem", id_rem,"/",-1));
		}else{
			response.addCookie(CookieBox.createCookie("id", "", "/", 0));
			response.addCookie(CookieBox.createCookie("id_rem", "", "/", 0));
		}
		session.setAttribute("memId", id);
		response.sendRedirect("../board/list.jsp");
	} else if (check == 0) {
%>

<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 맞지 않습니다");
	history.go(-1);
</script>
<%
	}
%>