<%@page import="imageboard.gallery.ThemeManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="imageboard.gallery.Theme" %>    

<%
	String themeId = request.getParameter("id");
	ThemeManager manager = ThemeManager.getInstance();
	Theme theme = manager.select(Integer.parseInt(themeId));
%>
<script type="text/javascript">
function validate(form) {
	if(form.password.value == ""){
		alert("암호를 입력하세요.");
		return false;
	}
}
</script>
<c:set var="theme" value="<%=theme %>"/>
<c:if test="${! empty theme }">

	<form action="delete.jsp" method="post" onsubmit="return validate(this)">
	<input type="hidden" name="id" value="${theme.id }">
	<table width="100%" border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>제목</td>
			<td>${theme.title }</td>
		</tr>
		<tr>
			<td>암호</td>
			<td><input type="password" name="password" size="10" value=""></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><img src="/KH10/image/${theme.image }" width="150" border="0"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="삭제">
			<input type="button" value="취소" onclick="javascripte:history.go(-1)">
			</td>
		</tr>
	</table>
	</form>
</c:if>

<c:if test="${empty theme }">
글이 존재하지 않습니다.
</c:if>
