<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="log.*"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.passwd.value){
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
		if(userinput.passwd.value!=userinput.passwd2.value){
			alert("��й�ȣ�� �ٸ��ϴ�. �ٽ� �Է����ּ���");
			userinput.passwd.focus();
			userinput.passwd.getElementById("passwd").value="";
			return false;
		}
	}
	function zipCheck(){
		url="ZipCheck.jsp?check=y";
		window.open(url,"post","toolbar=no,width=500,height=300,dirctories=no,status=yes,scrollbars=yes,menubar=no");
	}
</script>
</head>
<%
	String id=(String)session.getAttribute("memId");

	LogonDBBean manager=LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(id);
	
	try{
%>
<body bgcolor="<%=bodyback_c %>">
	<form method="post" action="modifyPro.jsp" name="userinput"
		onsubmit="return checkIt()">
		<table width="600" border="1" cellpadding="3" cellspacing="0"
			align="center">
			<tr>
				<td colspan="2" height="39" bgcolor="<%=title_c %>" align="center">
					<font size="+1"><b>ȸ�� ��������</b></font>
				</td>
			</tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>���̵� �Է�</b></td>
				<td width="400" bgcolor="<%=value_c%>"></td>
			</tr>
			<tr>
				<td width="200">����� ID</td>
				<td width="400"><%=c.getId()%></td>
			</tr>

			<tr>
				<td width="200">��й�ȣ</td>
				<td width="400"><input type="password" name="passwd" size="10"
					maxlength="10"></td>
			</tr>
			<tr>
				<td width="200">��й�ȣȮ��</td>
				<td width="400"><input type="password" name="passwd2" size="10"
					maxlength="10"></td>
			</tr>
			<tr>
				<td width="200" bgcolor="<%=value_c%>"><b>�������� �Է�</b></td>
				<td width="400" bgcolor="<%=value_c%>"></td>
			</tr>
			<tr>
				<td width="200">����� �̸�</td>
				<td width="400"><%=c.getName()%></td>
			</tr>
			<tr>
				<td width="200">�ֹε�Ϲ�ȣ</td>
				<td width="400"><%=c.getJumin1()%>-<%=c.getJumin2()%></td>
			</tr>
			<tr>
				<td width="200">E-Mail</td>
				<td width="400">
					<%if(c.getEmail()==null){%> <input type="text" name="email" size="40"
					maxlength="30"> <%}else{%> <input type="text" name="email"
					size="40" maxlength="30" value="<%=c.getEmail()%>"> <%}%>
				</td>
			</tr>
			<tr>
				<td width="200">Blog</td>
				<td width="400">
					<%if(c.getBlog()==null){%> <input type="text" name="blog" size="60"
					maxlength="50"> <%}else{%> <input type="text" name="blog"
					size="60" maxlength="50" value="<%=c.getBlog()%>"> <%}%>
				</td>
			</tr>
			<tr>
				<td width="200">�����ȣ</td>
				<td width="400">
				<%if(c.getZipcode()==null) {%><input type="text" name="zipcode" size="7">
				<%}else{ %><input type="text" name="zipcode" size="7" value="<%=c.getZipcode()%>">
				<%} %><input type="button" value="�����ȣã��" onclick="zipCheck()">
				�����ȣ�� �˻��ϼ���</td>
				</tr>
			<tr>
				<td width="200">�ּ�</td>
				<td width="400">
				<%if(c.getAddress()==null){ %><input type="text" name="address" size="70">
				<%}else{ %><input type="text" name="address" size="70" value="<%=c.getAddress() %>">
				<%} %>
				�ּҸ� �����ּ���</td>
				</tr>
			<tr>
				<td colspan="2" align="center" bgcolor="<%=value_c%>"><input
					type="submit" name="modify" value="��   ��"> <input
					type="button" value="��  ��"
					onclick="javascript:window.location='main.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
<%}catch(Exception e){}%>
</html>
