<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="log.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	String pageNum = request.getParameter("pageNum");
	String searchMem=request.getParameter("searchMem");
	int selectMem=0;
	if (pageNum == null) {
		pageNum = "1";
	}
	if(searchMem == null)
	{
		searchMem = "";
	}
	else
	{
		selectMem = Integer.parseInt(request.getParameter("selectMem"));
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage * pageSize) - (pageSize - 1);
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	List memberList = null;
	LogonDBBean logPro=LogonDBBean.getInstance();
	if(searchMem.equals("")||searchMem==null){
		count=logPro.getMemberCount();	
	}else{
		count=logPro.getMemberCount(selectMem,searchMem);
	}
	
	if (count > 0) {
		if(searchMem.equals("")||searchMem==null){
			memberList = logPro.getMembers(startRow , endRow);	
		}else{
			memberList = logPro.getMembers(startRow , endRow, selectMem, searchMem);
		}
	}
	number = count - (currentPage - 1) * pageSize;
	//6 - (2 - 1) * 5 = 1
%>

<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>ȸ�����(ȸ�� �� : <%=count%>)
		
		</b>
		<table width="1200">
			<tr>
			<td align="right" bgcolor="<%=value_c %>"><a href="../logon/main.jsp">��������</a>
			</td>
		</table>

		<%
			if (count == 0) {
		%>
		<table width="1200" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">ȸ���� �����ϴ�.</td>
			</tr>
		</table>
		<%
			} else {
		%>
		<table border="1" width="1200" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="150">��ȣ</td>
				<td align="center" width="200">ID</td>
				<td align="center" width="200">�̸�</td>
				<td align="center" width="300">�ֹι�ȣ</td>
				<td align="center" width="200">�̸���</td>
				<td align="center" width="100">�����ȣ</td>
				<td align="center" width="450">�ּ�</td>
				<td align="center" width="200">������</td>
				<td align="center" width="200">��й�ȣ</td>
				<td align="center" width="200">����/����</td>
			</tr>
			<%
				for (int i = 0; i < memberList.size(); i++) {
						LogonDataBean member = (LogonDataBean) memberList.get(i);
			%>
			<tr height="30" align="center">
				<td align="center" width="150"><%=number--%></td>
				<td width="200"><%=member.getId() %></td>
				<td width="200"><%=member.getName() %></td>
				<td width="300"><%=member.getJumin1() %> - <%=member.getJumin2() %></td>
				<td width="200"><%=member.getEmail() %></td>
				<td width="100"><%=member.getZipcode() %></td>
				<td width="450"><%=member.getAddress() %></td>
				<td width="200"><%=member.getReg_date() %></td>
				<td width="200"><%=member.getPasswd() %></td>
				<td width="200"><a href="../logon/modify.jsp">����/����</a></td>
					</tr>
		
		<%
				}
			}
		%>
		<br>
		</table>
		<br>
		<form action="memberList.jsp" method="post">
			<select name="selectMem" style="height: 25px">
				<option value="0" selected>ID</option>
				<option value="1">�̸�</option>
			</select> 
			<input type="text" name="searchMem"> 
			<input type="submit" value="�˻�">
		</form>
		<br>
		<%
			if (count > 0) {
				//��ü �������� ���� ����
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = (int) (currentPage / 5) * 5 + 1;
				int pageBlock = 5;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 5) {
		%>
		<a href="list.jsp?pageNum=<%=startPage - 5%>">[����]</a>
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
					if (endPage < pageCount) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + 5%>">[����]</a>
		<%
			}
				}
			}
			
		%>
	</center>
</body>
</html>