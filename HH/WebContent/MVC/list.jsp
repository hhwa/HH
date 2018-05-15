<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/KH10/css1/style.css" rel="stylesheet" type="text/css"> 
<title>�Խ���</title>
</head>
<body>
<div id="header"> �� ��� ( ��ü �� : ${count})</div>

<div id="wrap">
<table>
	<tr>
		<td width="750" align="right">
			<a href="/KH10/MVC/list.do">�۸��</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/KH10/MVC/writeForm.do">�۾���</a>
			&nbsp;
		</td>
	</tr>
</table>

<c:if test="${count==0}">
<table>
	<tr>
		<td width="750">�Խ��ǿ� ����� ���� �����ϴ�</td>
	</tr>
</table>
</c:if>

<c:if test="${count > 0 }">
<table>
	<tr height="30">
		<th width="50">��ȣ</th>
		<th width="250">��    ��</th>
		<th width="100">�ۼ���</th>
		<th width="150">�ۼ���</th>
		<th width="50">��  ȸ</th>
		<th width="100">IP</th>
	</tr>
	
	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<td align="center" width="50">
		<c:out value="${number}"/>
		<c:set var="number" value="${number-1 }"/>
		</td>
		<td width="250">
		<c:if test="${article.re_level > 0 }">
			<img src="images/level.gif" width="${5*article.re_level }" height="16">
			<img src="images/re.gif">
		</c:if>
		<c:if test="${article.re_level == 0 }">
			<img src="images/level.gif" width="${5*article.re_level }" height="16">
		</c:if>
		
		<a href="/KH10/MVC/content.do?num=${article.num }&pageNum=${currentPage}">${article.subject }</a>
		<c:if test="${article.readcount >= 20 }">
			<img src="images/hot.gif" border="0" height="16">
		</c:if>
		</td>
		<td align="center" width="100">
			<a href="mailto:${article.email }">${article.writer }</a>
		</td>
		<td align="center" width="150">${article.reg_date }</td>
		<td align="center" width="50">${article.readcount }</td>
		<td align="center" width="100">${article.ip }</td>
	</tr>
	</c:forEach>
</table>
</c:if>
</div>
<br>

<div id="footer">

	<form action="/KH10/MVC/list.do" method="post">
		<select name="select" style="height: 25px">
				<option value="0" selected>�ۼ���</option>
				<option value="1">����</option>
		</select> 
		<input type="text" name="search" style="height: 20px"> 
		<input type="submit" name="btn" value="�˻�">
	</form>
	<br>
	<c:if test="${count > 0 }">
		<c:set var="pageCount" value="${count / pageSize + (count%pageSize == 0 ? 0 : 1 ) }"/>
		<c:set var="pageBlock" value="${10 }"/>
		<fmt:parseNumber var="result" value="${currentPage / 10  }" integerOnly="true"/>
		<c:set var="startPage" value="${rusult*10 +1 }"/>
		<c:set var="endPage" value="${startPage + pageBlock-1 }"/>
		<c:if test="${endPage > pageCount }">
			<c:set var="endPage" value="${pageCount }"/>
		</c:if>
		<c:if test="${startPage > 10 }">
			<c:if test="${search==null }">
				<a href="/KH10/MVC/list.do?pageNum=${startPage -10 }">[����]</a>
			</c:if>
			<c:if test="${search!=null }">
				<a href="/KH10/MVC/list.do?pageNum=${startPage -10 }&search=${search}&select=${select}">[����]</a>
			</c:if>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == currentPage }">
				<c:if test="${search==null }">
					<b><a href="/KH10/MVC/list.do?pageNum=${i }">[${i }]</a></b>
				</c:if>
				<c:if test="${search!=null }">
					<b><a href="/KH10/MVC/list.do?pageNum=${i }&search=${search}&select=${select}">[${i }]</a></b>
				</c:if>
			</c:if>
			<c:if test="${i != currentPage }">
				<c:if test="${search==null }">
					<a href="/KH10/MVC/list.do?pageNum=${i }">[${i }]</a>
				</c:if>
				<c:if test="${search!=null }">
					<a href="/KH10/MVC/list.do?pageNum=${i }&search=${search}&select=${select}">[${i }]</a>
				</c:if>
			</c:if>
			
		</c:forEach>
		<c:if test="${endPage < pageCount }">
			<c:if test="${search==null }">
				<a href="/KH10/MVC/list.do?pageNum=${startPage + 10 }">[����]</a>
			</c:if>
			<c:if test="${search!=null }">
				<a href="/KH10/MVC/list.do?pageNum=${startPage + 10 }&search=${search}&select=${select}">[����]</a>
			</c:if>
		</c:if>
	</c:if>
</div>

</body>
</html>