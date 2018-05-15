<%@page import="java.io.File"%>
<%@page import="imageboard.gallery.Theme"%>
<%@page import="imageboard.gallery.ThemeManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage="../error/error_view.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
</head>
<body>
<%
	String themeId = request.getParameter("id");
	ThemeManager manager = ThemeManager.getInstance();
	Theme oldTheme = manager.select(Integer.parseInt(themeId));
%>
<c:set var="oldTheme" value="<%=oldTheme %>"/>
<c:choose>
	<c:when test="${empty oldTheme }">
	<script>
	alert("���� �������� �ʽ��ϴ�.");
	location.href="list.jsp";
	</script>
	</c:when>
	
	<c:when test="${oldTheme.password != param.password }">
	<script>
	alert("��ȣ�� �ٸ��ϴ�.");
	history.go(-1);
	</script>
	</c:when>
	
	<c:when test="${oldTheme.password == param.password }">
	<%
		manager.delete(oldTheme.getId());
		String fileName=oldTheme.getImage();
		String filePath="C:\\Java\\App\\KH10\\WebContent\\image\\";
		
		filePath +=fileName;
		File f = new File(filePath);
		filePath +=".small.jpg";
		File fsmall = new File(filePath);
		if(f.exists()) f.delete();
		if(fsmall.exists()) fsmall.delete();
	%>
	<script>
	alert("���� �����Ͽ����ϴ�.");
	location.href="list.jsp";
	</script>
	</c:when>
</c:choose>
</body>
</html>