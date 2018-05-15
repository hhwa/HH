<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="board.service.WriteArticleService" %>
<%@ page import ="board.model.Article" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("euc-kr");
%>    
<jsp:useBean id="writingRequest" class="board.model.WritingRequest">
<jsp:setProperty name="writingRequest" property="*"/>
</jsp:useBean>
<%
Article postedArticle=WriteArticleService.getInstance().write(writingRequest);
request.setAttribute("postedArticle", postedArticle);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 작성</title>
</head>
<body>
게시글을 등록했습니다.
<br>
<a href="<c:url value='list.jsp'/>">목록보기</a>
<a href="<c:url value='read.jsp?articleId=${postedArticle.id }'/>">게시글 읽기</a>
</body>
</html>