<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="color.jsp"%>
<%@ page import="util.CookieBox"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메인화면</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>
<body onLoad="focusIt();" bgcolor="<%=bodyback_c%>">
<%
	CookieBox cookiebox = new CookieBox(request);

	String id = "";
	String id_rem = "";
	if(id_rem != null){
		id=cookiebox.getValue("id");
		id_rem=cookiebox.getValue("id_rem");
	}
	try {
		if (session.getAttribute("memId") == null) {
%>
<script type="text/javascript">
<!--
	function focusIt() {
		document.inform.id.focus();
	}
	function checkIt() {
		var inputForm = eval("document.inform");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요..");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.passwd.value) {
			alert("비밀번호를 입력하세요..");
			inputForm.passwd.focus();
			return false;
		}
	}
	function search(){
		url="searchForm.jsp";
		window.open(url,"searchid","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=200");
	}
//-->
</script>

	<table width="400" cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="200" bgcolor="<%=bodyback_c%>" height="20">&nbsp;</td>

			<form name="inform" method="post" action="../logon/loginPro.jsp"
				onSubmit="return checkIt();">
				<td bgcolor="<%=title_c%>" width="100" align="right">아이디</td>
				<td width="100" bgcolor="<%=value_c%>">
				<%if(id!=null){%>
				<input type="text" name="id" size="15" maxlength="10" value="<%=id%>">
				<% }else {%>
				<input type="text" name="id" size="15" maxlength="10">
				<%} %>
				</td>
				<td rowspan="2" width="100" bgcolor="<%=title_c%>">
					<input type="submit" value="로그인" style="height:45px; width:100px;">
				</td>
				
		</tr>
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="200">
				<a href="../board/list.jsp">게시판</a>
			</td>
			<td bgcolor="<%=title_c%>" width="100" align="right">패스워드</td>
			<td width="100" bgcolor="<%=value_c%>"><input type="password"
				name="passwd" size="15" maxlength="10"></td>
			
		</tr>
		<tr>
			<td colspan="3" bgcolor="<%=title_c%>" align="center">
			<input type="button" value="ID/PW찾기" onclick="search()">
			 <input	type="button" value="회원가입"
				onclick="javascript:window.location='inputForm2.jsp'"> <%
 	if (id_rem!=null) {
 %> <input type="checkbox" id="id_rem" name="id_rem" value="id_rem"
				checked>ID저장 <%
 	} else {
 %> <input type="checkbox" id="id_rem" name="id_rem" value="id_rem">ID저장
				<%
 	}
 %></td>
		</tr>
		</form>
	</table>
	<%
		} else {
		
	%>
	<table width="500" cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="300" bgcolor="<%=bodyback_c%>" height="20">ㅎ</td>

			<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>님이
				방문하셨습니다.
				<form method="post" action="../logon/logout.jsp">
					<input type="submit" value="로그아웃"> <input type="button"
						value="회원정보변경" onclick="javascript:window.location='modify.jsp'">
				</form></td>
		</tr>
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300">
				<a href="../board/list.jsp">게시판</a>
				<br>
				<% if(((String)session.getAttribute("memId")).equals("admin")){
					%><a href="../logon/memberList.jsp">회원리스트</a>
				<% }%>
			</td>
		</tr>
	</table>
	<br>
	<%
		}
		} catch (NullPointerException e) {
		}
	%>
</body>
</html>