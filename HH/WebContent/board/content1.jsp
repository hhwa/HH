<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function writeSave() {
		if (document.comment.passwd.value == "") {
			alert("��й�ȣ�� �Է����ּ���");
			document.comment.passwd.focus();
			return false;
		}
	}
</script>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int cPageSize = 5;
	String cPageNum = request.getParameter("cPageNum");
	if (cPageNum == null) {
		cPageNum = "1";
	}
	int cCurrentPage = Integer.parseInt(cPageNum);
	int cStartRow = (cCurrentPage * cPageSize) - (cPageSize - 1);
	int cEndRow = cCurrentPage * cPageSize;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		CommentDBBean cdb = CommentDBBean.getInstance();
		ArrayList comments = cdb.getComments(article.getNum(), cStartRow, cEndRow);
		int count = cdb.getCommentCount(article.getNum());

		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
</head>
<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�۳��� ����</b>
	
	<br>
	<form>
		<table width="500" border="1" cellspacing="0" cellpadding="0"
			bgcolor="<%=bodyback_c%>" align="center">
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c%>">�۹�ȣ</td>
				<td align="center" width="125" align="center"><%=article.getNum()%></td>
				<td align="center" width="125" bgcolor="<%=value_c%>">��ȸ��</td>
				<td align="center" width="125" align="center"><%=article.getReadcount()%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c%>">�ۼ���</td>
				<td align="center" width="125" ><%=article.getWriter()%></td>
				<td align="center" width="125" bgcolor="<%=value_c%>">�ۼ���</td>
				<td align="center" width="125" ><%=sdf.format(article.getReg_date())%></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c%>">������</td>
				<td align="center" width="375" align="center" colspan="3"><%=article.getSubject()%></td>
			</tr>
			<tr>
				<td align="center" width="125" bgcolor="<%=value_c%>">�۳���</td>
				<td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<input type="button" value="�ۼ���" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="�ۻ���" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="�亯����" 	onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="button" value="�۸��" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
			</form>
			<form method="post" action="contentPro.jsp" name="comment" 	onsubmit="return writeSave()">
				<tr bgcolor=<%=value_c%> align="center">
					<td>��� �ۼ�</td>
					<td colspan=2><textarea name="commentt" rows="6" cols="40"></textarea>
						<input type="hidden" name="content_num" value="<%=article.getNum()%>"> 
						<input type="hidden" name="pageNum" value="<%=pageNum%>"> 
						<input type="hidden" name="comment_num" value="<%=count + 1%>"></td>
					<td align="center">�ۼ���<br> <%=session.getAttribute("memId") %>
						<input type="hidden" name="commenter" value="<%=session.getAttribute("memId")%>"><br> ��й�ȣ<br> 
						<input type="password" name="passwd" size="10">
						<p>
							<input type="submit" value="��۴ޱ�">
						</p>
					</td>
				</tr>
			</form>
		</table>
		<%
			if (count > 0) {
		%>
		<p>
		<table width="500" border="0" cellspacing="0" cellpadding="0"
			bgcolor="<%=bodyback_c%>" align="center">
			<tr>
				<td>��� �� : <%=count%>
				</td>
			</tr>
			<%
				for (int i = 0; i < comments.size(); i++) {
							CommentDataBean dbc = (CommentDataBean) comments.get(i);
			%>
			<tr>
				<td align="left" size="250" bgcolor="<%=value_c%>">
									<%
						int wid = 0;
						if (dbc.getCm_re_level() > 0) { //�亯�� 
							wid = 5 * (dbc.getCm_re_level());
					%> 
					<img src="images/level.gif" width="<%=wid%>" height="16">
					<img src="images/re.gif"> <%
 	} else {
 %> 				<img src="images/level.gif" width="<%=wid%>" height="16"> <%
 	}
						boolean recomment=false;
 %>
				&nbsp;<b><%=dbc.getCommenter()%>&nbsp;��</b>(<%=sdf.format(dbc.getReg_date())%>
				</td>
				<td align="right" size="250" bgcolor=<%=value_c%>>����IP:<%=dbc.getIp()%>	&nbsp;
				<%--content1.jsp?num=<%=num %>&pageNum=<%=pageNum %> --%>
				<a href="javascript:click();" value="<%=i %>">[���]</a>
				<script type="text/javascript">
					function click(){
						recomment = true;
						return true;
					}
				</script>
				<% if(recomment==true){%>
					<form method="post" action="contentPro.jsp" name="comment" 	onsubmit="return writeSave()">
						<tr bgcolor=<%=value_c%> align="center">
						<td>��� �ۼ�</td>
						<td colspan=2><textarea name="commentt" rows="6" cols="40"></textarea>
							<input type="hidden" name="content_num" value="<%=article.getNum()%>"> 
							<input type="hidden" name="pageNum" value="<%=pageNum%>"> 
							<input type="hidden" name="comment_num" value="<%=count + 1%>"></td>
							<td align="center">�ۼ���<br> <%=session.getAttribute("memId") %>
							<input type="hidden" name="commenter" value="<%=session.getAttribute("memId")%>"><br> ��й�ȣ<br> 
							<input type="password" name="passwd" size="10">
							<p>
							<input type="submit" value="��۴ޱ�">
						</p>
					</td>
				</tr>
			</form>
			<%} %>

					<a href="delCommentForm.jsp?ctn=<%=dbc.getContent_num()%>&cmn=<%=dbc.getComment_num()%>&pageNum=<%=pageNum%>">[����]</a>&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2"><%=dbc.getCommentt()%>
				</td>
				<%
					}
			}
		
				%>
			</tr>
		</table>
		<table width="500" border="0" cellspacing="0" cellpadding="0"
			bgcolor="<%=bodyback_c%>" align="center">
			<tr>
				<%
					if (count > 0) {
						int cPageCount = count / cPageSize + (count % cPageSize == 0 ? 0 : 1);
						int cPageBlock = 3;
						int cStartPage = 0;
						if(cCurrentPage%cPageBlock==0){
							cStartPage =(int) (cCurrentPage / cPageBlock) * cPageBlock - 2;
						}else{
							cStartPage =(int) (cCurrentPage / cPageBlock) * cPageBlock + 1;
						}
						int cEndPage = cStartPage + cPageBlock - 1;
						if (cEndPage > cPageCount)
							cEndPage = cPageCount;

						if (cStartPage > cPageBlock) {
				%>
				<a href="content1.jsp?num=<%=num%>&pageNum=<%=pageNum%>&cPageNum=<%=cStartPage - cPageBlock%>">[����]</a>
				<%
					}
								for (int i = cStartPage; i <= cEndPage; i++) {
									if(cCurrentPage==i){
				%>
				<b><a href="content1.jsp?num=<%=num%>&pageNum=<%=pageNum%>&cPageNum=<%=i%>">[<%=i%>]</a></b>
				<%}else{%>
				<a href="content1.jsp?num=<%=num%>&pageNum=<%=pageNum%>&cPageNum=<%=i%>">[<%=i%>]</a>
				<%				
					}
				}
									if (cEndPage < cPageCount) {
				%>
				<a href="content1.jsp?num=<%=num%>&pageNum=<%=pageNum%>&cPageNum=<%=cStartPage + cPageBlock%>">[����]</a>
				<%
					}
				%>

				
			</tr>
		</table>
		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</center>
</body>
</html>
