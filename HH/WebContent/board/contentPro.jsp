<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="cmt" scope="page" class="board.CommentDataBean">
	<jsp:setProperty name="cmt" property="*" />
</jsp:useBean>
<%
	CommentDBBean comt = CommentDBBean.getInstance();
	cmt.setReg_date(new Timestamp(System.currentTimeMillis()));
	cmt.setIp(request.getRemoteAddr());
	comt.insertComment(cmt);
	String content_num = request.getParameter("content_num");
	String pageNum = request.getParameter("pageNum");
	String url = "content1.jsp?num=" + content_num + "&pageNum=" + pageNum;
	response.sendRedirect(url);
%>

