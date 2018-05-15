<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="imageboard.gallery.Theme"%>
<%@ page import="imageboard.gallery.ThemeManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	String themeId = request.getParameter("id");
	ThemeManager manager = ThemeManager.getInstance();
	Theme theme = manager.select(Integer.parseInt(themeId));
	
	int cPageSize = 5;
	String cPageNum = request.getParameter("cPageNum");
	if (cPageNum == null) {
		cPageNum = "1";
	}
	int cCurrentPage = Integer.parseInt(cPageNum);
	int cStartRow = (cCurrentPage * cPageSize) - (cPageSize - 1);
	int cEndRow = cCurrentPage * cPageSize;
	
	int count = manager.cmtCount(Integer.parseInt(themeId));
	ArrayList comments = manager.cmtSelectList(theme.getId(), cStartRow, cEndRow);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<c:set var="theme" value="<%=theme%>"></c:set>
<c:if test="${empty theme }">���������ʴ� �׸� �̹��� �Դϴ�.</c:if>
<c:if test="${!empty theme }">
	<table width="100%" border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>����</td>
			<td>${theme.title }</td>
		</tr>
		<tr>
			<td>�ۼ���</td>
			<td>${theme.name }<c:if test="${empty theme.email }">
					<a href="mailto:${theme.email }">[�̸���]</a>
				</c:if></td>
		</tr>
		<c:if test="${!empty theme.image }">
			<tr>
				<td colspan="2" align="center">
				<a href="javascript:viewLarge('/KH10/image/${theme.image}')"> 
				<img src="/KH10/image/${theme.image }" width="150" border="0"><br>[ũ�Ժ���]
				</a></td>
			</tr>
		</c:if>

		<tr>
			<td>����</td>
			<td><pre>${theme.content }</pre></td>
		</tr>
		<tr>
			<td colspan="2">
 			<%-- <jsp:include page="../guestbook/list.jsp" flush="false"/>  --%>
 			<form action="comment.jsp" method="post">
 			<table width="300" border="1" cellpadding="1" cellspacing="0">
 			<tr>
 			<td>
 				�ۼ��� <input type="text" name="writer"> 
 				��й�ȣ <input type="password" name="cmtPassword"></td>
 			</tr>
 			<tr>
 			<td width="350">
 			<textarea name="comment" rows="3" cols="60"></textarea>
 			<input type="hidden" name="cmtNum" value="<%=count+1 %>">
 			<input type="hidden" name="id" value="${theme.id }">
 			<input type="hidden" name="page" value="${param.page}">
 			<input type="submit" value="Ȯ��"></td>
 			</tr>
 			<%if(comments!=null){%>
 			��� �� : <%=comments.size() %>
 			<%
				for (int i = 0; i < comments.size(); i++) {
							Theme the = (Theme) comments.get(i);
			%>
			<tr>
				<td align="left"> �ۼ��� : <%=the.getWriter() %>(<%=sdf.format(the.getRegister())%>) 
				<a href="#">[����]</a><br>
				 <%=the.getComment() %></td>
 			<% } 		 			
 			} else{%>
 			����� �����ϴ�.
 			<%}%>
 			</table>
 			</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="javascript:goReply()">[�亯]</a>
			<a href="javascript:goModify()">[����]</a> 
			<a href="javascript:goDelete()">[����]</a> 
			<a href="javascript:goList()">[���]</a>
			</td>
		</tr>
	</table>
</c:if>

<script type="text/javascript">
	function goReply() {
		document.move.action = "writeForm.jsp";
		document.move.submit();
	}
	function goModify() {
		document.move.action = "updateForm.jsp";
		document.move.submit();
	}
	function goDelete() {
		document.move.action = "deleteForm.jsp";
		document.move.submit();
	}
	function goList() {
		document.move.action = "list.jsp";
		document.move.submit();
	}
	function viewLarge(img) {
		
		img1= new Image(); 
		img1.src=(img); 

		if((img1.width!=0)&&(img1.height!=0)){ 
			W=img1.width; 
			H=img1.height; 
			O="width="+W+",height="+H+",scrollbars=yes"; 
			imgWin=window.open("","",O); 
			imgWin.document.write("<html><head><title>�̹����󼼺���</title></head>");
			imgWin.document.write("<body topmargin=0 leftmargin=0>");
			imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='Ŭ���Ͻø� â�� �����ϴ�.'>");
			imgWin.document.close(); 
		}
	}
</script>
<form name="move" method="post">
	<input type="hidden" name="id" value="${theme.id }"> 
	<input type="hidden" name="parentId" value="${theme.id }"> 
	<input type="hidden" name="groupId" value="${theme.groupId }"> 
	<input type="hidden" name="page" value="${param.page}">

	<c:forEach var="searchCond" items="${paramValues.search_cond }">
		<c:if test="${searchCond=='title' }">
			<input type="hidden" name="search_cond" value="title">
		</c:if>
		<c:if test="${searchCond=='name' }">
			<input type="hidden" name="search_cond\" value="name">
		</c:if>
	</c:forEach>
	<c:if test="${!empty param.search_key }">
		<input type="hidden" name="search_key" value="${param.search_key }">
	</c:if>
</form>