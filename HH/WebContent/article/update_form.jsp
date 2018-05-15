<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.service.ReadArticleService" %>
<%@ page import="board.model.Article" %>
<%@ page import="board.service.ArticleNotFoundException" %>
<%
	String viewPage=null;
	try{
		int articleId=Integer.parseInt(request.getParameter("articleId"));
		Article article = ReadArticleService.getInstance().getArticle(articleId);
		viewPage = "update_form_view.jsp";
		request.setAttribute("article", article);
	}catch(ArticleNotFoundException ex){
		viewPage="article_not_found.jsp";
	}
%>    
<jsp:forward page="<%=viewPage %>"/>