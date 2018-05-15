<%@page import="pds.model.PdsItemListModel"%>
<%@page import="pds.service.ListPdsItemService"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNumberString = request.getParameter("p");
	int pageNumber = 1;
	if(pageNumberString != null && pageNumberString.length()>0){
		pageNumber = Integer.parseInt(pageNumberString);
	}
	ListPdsItemService listService = ListPdsItemService.getInstance();
	PdsItemListModel pdsItemListModel = listService.getPdsItemList(pageNumber);
	request.setAttribute("listModel", pdsItemListModel);
	
	if(pdsItemListModel.getTotalPageCount() > 0){
		int beginPageNumber = (pdsItemListModel.getRequestPage() - 1)/10*10+1;
		int endPageNumber = beginPageNumber + 9;
		if(endPageNumber>pdsItemListModel.getTotalPageCount()){
			endPageNumber = pdsItemListModel.getTotalPageCount();
		}
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
		
	}
%>
<jsp:forward page="list_view.jsp"/>
