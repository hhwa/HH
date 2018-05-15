<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="log.LogonDBBean"%>
<%@ include file="color.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="log.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	String id = (String) session.getAttribute("memId");
	member.setId(id);

	LogonDBBean manager = LogonDBBean.getInstance();
	manager.updateMember(member);
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<table width="270" cellpadding="5" cellspacing="0" align="center"
		border="0">
		<tr bgcolor="<%=title_c%>">
			<td height="39" align="center"><font size="+1"><b>회원
						정보가 수정되었습니다.</b></font></td>
		</tr>
		<tr>
			<td bgcolor="<%=value_c%>" align="center">
				<form>
					<input type="button" value="메인으로"
						onclick="javascript:window.location='main.jsp'">
				</form> 5초 후에 메인으로 이동합니다.
				<meta http-equiv="Refresh" content="5;url=main.jsp">
			</td>
	</table>

</body>
</html>