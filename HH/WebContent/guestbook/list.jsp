<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="model.*" %>    
<%@ page import="service.GetMessageListService" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<%
	String pageNumberStr=request.getParameter("page");
	int pageNumber=1;
	if(pageNumberStr != null){
		pageNumber=Integer.parseInt(pageNumberStr);
	}
	GetMessageListService messageListService=GetMessageListService.getInstance();
	MessageListView viewData=messageListService.getMessageList(pageNumber);
%>
<div id="wrap">
	<div class="commentWrap">
		<div class="commentWrite">
			<form action="writeMessage.jsp" method="post">
				<p class="writer">
					�ۼ��� <input type="text" name="guestName" />
					��й�ȣ <input type="password" name="password" />
				</p>
				<div class="commentCon">
					<textarea name="message"></textarea>
					<span><input type="submit" value="Ȯ��" /></span>
				</div>
			</form>
		</div>

<%
	if (viewData.isEmpty()) {	
%>
��ϵ� �޽����� �����ϴ�.
<%
	} else {	/* �޽��� �ִ� ��� ó������ */
%>
		<div class="commentList">
			<ul>
			<%
				for (Message message : viewData.getMessageList()) {
			%>
				<li>
					<span class="no">�޽�����ȣ <%= message.getId() %></span>
					<span class="writer"><%= message.getGuestName() %></span>
					<p><%= message.getMessage() %>&nbsp;<span class="delBtn"><a href="confirmDeletion.jsp?messageId=<%=message.getId()%>">X</a></span></p>		
				</li>
			<%
				}
			%>
			</ul>
		</div>
	</div>
	<div class="paging">
		<ul>
		<%if (viewData.getMessageTotalCount() > 0) {
				//��ü �������� ���� ����
				int pageCount = viewData.getPageTotalCount();
				int pageBlock = 3;
				int startPage = 0;
				if(viewData.getCurrentPageNumber()%pageBlock==0){
					startPage =(int) (viewData.getCurrentPageNumber() / pageBlock) * pageBlock - 2;
				}else{
					startPage =(int) (viewData.getCurrentPageNumber() / pageBlock) * pageBlock + 1;
				}
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > pageBlock) {%>
		<li><a href="list.jsp?page=<%=viewData.getCurrentPageNumber()-1 %>">[����]</a>
		&nbsp;&nbsp;&nbsp;
		<%} %>
	<%
		for (int i = startPage; i <= endPage; i++) {
			if(viewData.getCurrentPageNumber()==i){
	%>	
		<li><b><a href="list.jsp?page=<%= i %>">[<%=i %>]</a></b></li>
	<%}else{%>
		<li><a href="list.jsp?page=<%= i %>">[<%=i %>]</a></li>
	<%
			}
		}
		if(endPage < pageCount){
	%>
		&nbsp;&nbsp;&nbsp;
		<li><a href="list.jsp?page=<%=viewData.getCurrentPageNumber()+1 %>">[����]</a>
	<%}
		}%>
		</ul>
	</div>

<%
	}
%>
</div>
</body>
</html>