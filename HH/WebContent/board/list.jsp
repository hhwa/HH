<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<br>
<%@ include file="../logon/main.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  int pageSize = 5;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");

	int select = 0;
	if (pageNum == null) {
		pageNum = "1";
	}
	if(search == null)
	{
		search = "";
	}
	else
	{
		select = Integer.parseInt(request.getParameter("select"));
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage * pageSize) - (pageSize - 1);
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	List articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();
	if(search.equals("")||search==null){
		count = dbPro.getArticleCount();
	}else{
		count = dbPro.getArticleCount(select,search);
	}
	CommentDBBean cdb = CommentDBBean.getInstance();
	if (count > 0) {
		if(search.equals("")||search==null){
			articleList = dbPro.getArticles(startRow, endRow);
		}else{
			articleList = dbPro.getArticles(startRow, endRow,select,search);
		}
	}
	
	number = count - (currentPage - 1) * pageSize;
	String memId = (String) session.getAttribute("memId");
	//6 - (2 - 1) * 5 = 1
%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<br>
<br>
<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>글목록(전체 글 : <%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a href="#"
					onclick="login('<%=memId%>','writeForm.jsp');">글쓰기</a></td>
		</table>

		<%
			if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회 수</td>
				<td align="center" width="100">IP주소</td>
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = (BoardDataBean) articleList.get(i);
						int num = article.getNum();
						int readcount = article.getReadcount();
						int com_count = cdb.getCommentCount(article.getNum());
			%>
			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
					<%
						int wid = 0;
								if (article.getRe_level() > 0) { //답변글 
									wid = 5 * (article.getRe_level());
					%> 
					<img src="images/level.gif" width="<%=wid%>" height="16">
					<img src="images/re.gif"> <%
 	} else {
 %> 				<img src="images/level.gif" width="<%=wid%>" height="16"> <%
 	}
 					String url = "content1.jsp?num=" + num + "&pageNum=" + currentPage ;
 %>
  <script type="text/javascript">
		function login(memid, urll) {

			if (memid == "null") {
				alert("로그인을 해주세요");
				location.href = "../logon/loginForm.jsp";
			} else {
				location.href = urll;
			}

		}
	</script> <%
 	if (com_count > 0) {
 %> <a href="javascript:login('<%=memId%>','<%=url%>');"><%=article.getSubject()%>[<%=com_count%>]</a>
<%	} else {%> 
	<a href="javascript:login('<%=memId%>','<%=url%>');"><%=article.getSubject()%></a>
<%	}
	if (article.getReadcount() >= 20) {
%> <img src="images/hot.gif" border="0" height="16"> 
<% 	} %>
				</td>
				<td align="center" width="100"><a
					href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
				}
			%>

			<%
				}
			%>
		</table>
		<br>
		<form action="list.jsp" method="post">
			<select name="select" style="height: 25px">
				<option value="0" selected>제목</option>
				<option value="1">작성자</option>
			</select> <input type="text" name="search"> <input type="submit"
				value="검색">
		</form>
		<br>
		<%
			if (count > 0) {
				//전체 페이지의 수를 연산
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int pageBlock = 3;
				int startPage = 0;
				if(currentPage%pageBlock==0){
					startPage =(int) (currentPage / pageBlock) * pageBlock - 2;
				}else{
					startPage =(int) (currentPage / pageBlock) * pageBlock + 1;
				}
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > pageBlock) {
		%>
		<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
					if (i == Integer.parseInt(pageNum)) {
		%>
		<b><a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a></b>
		<%
			} else {
		%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				}
					if (endPage < pageCount) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
			
				}
			}
		%>
	</center>

</body>
</html>