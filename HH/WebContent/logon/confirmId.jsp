<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="log.LogonDBBean"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">

<%
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.confirmId(id);
%>
<script type="text/javascript">
function setId(){
	opener.document.userinput.id.value="<%=id%>";
	self.close();
}

</script>
</head>

<body bgcolor="<%=bodyback_c%>" >
	<%
		if (check == 1) {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr bgcolor="<%=title_c%>">
			<td height="39">�Է��Ͻ� <%=id%>�� �̹� ������� ���̵��Դϴ�.
			</td>
		</tr>
	</table>
	<form name="checkForm" method="post" action="confirmId.jsp">
		<table width="270" border="0" cellspacing="0" cellpaing="5">
			<tr>
				<td bgcolor="<%=value_c%>" align="center">�ٸ� ���̵� �����ϼ���.
					<p>
						<input type="text" size="10" maxlength="12" name="id"> <input
							type="submit" value="ID�ߺ�Ȯ��">
				</td>
		</table>
	</form>

	<%
		} else {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr bgcolor="<%=title_c%>">
			<td align="center">
				<p>
					�Է��Ͻ�
					<%=id%>�� ����ϽǼ� �ִ� ID �Դϴ�.
				</p> <input type="button" value="�ݱ�" onclick="setId()">
			</td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>