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
<title>게시글 목록</title>
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
			<th width="50" >글 번호</th>
			<th width="300">파일명</th>
			<th width="50">파일크기</th>
			<th width="130">다운로드횟수</th>
			<th width="50">다운로드</th>
			<th width="30">삭제</th>
		</tr>

		<c:choose>
			<c:when test="${listModel.hasPdsItem == false }">
				<tr>
					<td colspan="5">게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="pdsItem" items="${listModel.pdsItemList }">
					<tr>
						<td>${pdsItem.id }</td>
						<td> ${pdsItem.fileName}</td>
						<td>${pdsItem.fileSize }</td>
						<td>${pdsItem.downloadCount }</td>
						<td><a href="download.jsp?id=${pdsItem.id }">다운받기</a></td>
						<td><a href="delete.jsp?id=${pdsItem.id }">삭제</a>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		<div align="center">
			<c:if test="${beginPage>10 }">
				<a href="<c:url value="list.jsp?p=${beginPage-1 }"/>">이전</a>
			</c:if> 
			<c:forEach var="pno" begin="${beginPage }" end="${endPage }">
				<a href="<c:url value="list.jsp?p=${pno }"/>">[${pno }]</a>
			</c:forEach> 
			<c:if test="${endPage <listModel.totalPageCount }">
				<a href="<c:url value="list.jsp?p=${endPage +1 }"/>">다음</a>
			</c:if>
		</div>
		<br>
		
		<form action="uploadForm.jsp" method="post">
		<div id="footer">
			<input type="submit" value="파일 업로드"/>
			</div>
		</form>
</div>
</body>
</html>