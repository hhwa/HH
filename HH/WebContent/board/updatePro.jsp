<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import ="java.sql.Timestamp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="article" class="board.BoardDataBean">
<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
String pageNum=request.getParameter("pageNum");
BoardDBBean dbPro=BoardDBBean.getInstance();
int check=dbPro.updateArticle(article);

if(check==1){
%>
<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum %>">
<%}else{ %>
<script type="text/javascript">
<!--
 alert("��й�ȣ�� ���� �ʽ��ϴ�.");
 history.go(-1);
 -->
</script>
<%} %>
