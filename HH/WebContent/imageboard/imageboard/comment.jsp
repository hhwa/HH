<%@page import="java.sql.Timestamp"%>
<%@page import="imageboard.gallery.Theme"%>
<%@page import="imageboard.gallery.ThemeManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="theme" class="imageboard.gallery.Theme">
<jsp:setProperty name="theme" property="*"/>
</jsp:useBean>
<%
	String id = request.getParameter("id");
	String num=request.getParameter("cmtNum");
	String cmtpw=request.getParameter("cmtPassword");
	ThemeManager manager = ThemeManager.getInstance();
	theme.setCmtpassword(cmtpw);
	theme.setRegister(new Timestamp(System.currentTimeMillis()));
	theme.setComment_num(Integer.parseInt(num));
	manager.cmtInsert(theme);
	
	String paged=request.getParameter("page");
		
%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>댓글 등록</title>
</head>
<body>
<form action="read.jsp" method="post">
	댓글을 등록했습니다.
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="page" value="<%=paged %>">
<input type="submit" value="확인">
</form>
</body>
</html>