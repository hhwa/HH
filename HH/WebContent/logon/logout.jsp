<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="util.CookieBox"%>
<%
	session.invalidate();
	response.sendRedirect("../board/list.jsp");
%>