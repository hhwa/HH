<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/style.css" type="text/css" rel="stylesheet"/>
<title>�Խñ� ���</title>
</head>
<body><br>
<div id="wrap">
		<div id="header">
		<c:if test="${listModel.totalPageCount >0 }">
			<tr>
				<td colspan="5" align="center">${listModel.startRow } - ${listModel.endRow }  
					[${listModel.requestPage} / ${listModel.totalPageCount}]</td>
			</tr>
		</c:if>
		</div>
		<br>
		
		<table border="1" cellpadding="0" cellspacing="0">
		<tr>
			<th width="50" >�� ��ȣ</th>
			<th width="300">���ϸ�</th>
			<th width="50">����ũ��</th>
			<th width="130">�ٿ�ε�Ƚ��</th>
			<th width="50">�ٿ�ε�</th>
			<th width="30">����</th>
		</tr>

		<c:choose>
			<c:when test="${listModel.hasPdsItem == false }">
				<tr>
					<td colspan="5">�Խñ��� �����ϴ�.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="pdsItem" items="${listModel.pdsItemList }">
					<tr>
						<td>${pdsItem.id }</td>
						<td> ${pdsItem.fileName}</td>
						<td>${pdsItem.fileSize }</td>
						<td>${pdsItem.downloadCount }</td>
						<td><a href="download.jsp?id=${pdsItem.id }">�ٿ�ޱ�</a></td>
						<td><a href="delete.jsp?id=${pdsItem.id }">����</a>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<div align="center">
			<c:if test="${beginPage>10 }">
				<a href="<c:url value="list.jsp?p=${beginPage-1 }"/>">����</a>
			</c:if> 
			<c:forEach var="pno" begin="${beginPage }" end="${endPage }">
				<a href="<c:url value="list.jsp?p=${pno }"/>">[${pno }]</a>
			</c:forEach> 
			<c:if test="${endPage <listModel.totalPageCount }">
				<a href="<c:url value="list.jsp?p=${endPage +1 }"/>">����</a>
			</c:if>
		</div>
		<br>
		
		<form action="uploadForm.jsp" method="post">
		<div id="footer">
			<input type="submit" value="���� ���ε�"/>
			</div>
		</form>
</div>
</body>
</html>