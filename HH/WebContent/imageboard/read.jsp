<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:forward page="template/template.jsp">
	<jsp:param value="../read_view.jsp" name="contentpage" />
</jsp:forward>