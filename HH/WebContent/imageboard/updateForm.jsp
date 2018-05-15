<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>    
<jsp:forward page="template/template.jsp">
	<jsp:param name="contentpage" value="../updateForm_view.jsp"/>
</jsp:forward>