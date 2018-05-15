<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
		if(article.getWriter().equals((String)session.getAttribute("memId")) || session.getAttribute("memId").equals("admin")) {
%>
<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글 수정</b>
	</center>
	<br>
	<form method="post" name="writeform"
		action="updatePro.jsp?pageNum=<%=pageNum%>"
		onsubmit="return writeSave()">
		<table width="400" border="1" cellspacing="0" cellpadding="0"
			bgcolor="<%=bodyback_c%>" align="center">
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">이 름</td>
				<td align="left" width="330"><%=article.getWriter()%>
					<input type="hidden" name="num" value="<%=article.getNum()%>"></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="30" name="email" value="<%=article.getEmail()%>"></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
				<td align="left" width="330"><textarea name="content" rows="13"
						cols="40"><%=article.getContent()%></textarea></td>
			</tr>
			<tr>
				<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
				<td align="left" width="330"><input type="password" size="8"
					maxlength="12" name="passwd"></td>
			</tr>
			<tr>
				<td colspan=2 bgcolor="<%=value_c%>" align="center"><input
					type="submit" value="글수정"> <input type="reset"
					value="다시작성"> <input type="button" value="목록보기"
					onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
<%}else{ %>
	<script type="text/javascript">
		alert("권한이 없습니다. 본인이 작성한 글이 아닙니다.");
		history.go(-1);
	</script>
	<%} %>	
	<%
		} catch (Exception e) {
		}
	%>

</body>
</html>
