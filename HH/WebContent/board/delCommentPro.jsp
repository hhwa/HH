<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	int content_num = Integer.parseInt(request.getParameter("content_num"));
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));

	String pageNum = request.getParameter("p_num");
	String passwd = request.getParameter("passwd");

	CommentDBBean cmtPro = CommentDBBean.getInstance();
	int check = cmtPro.deleteComment(content_num, passwd, comment_num);
	System.out.print(check);
	if (check == 1) {
%>
<meta http-equiv=Refresh
	content="0;url=content1.jsp?num=<%=content_num%>&pageNum=<%=pageNum%>">
<%
	} else {
%>
<script type="text/javascript">
<!--
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
	//-->
</script>
<%
	}
%>
