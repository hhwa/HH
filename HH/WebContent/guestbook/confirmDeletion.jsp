<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�ۻ���</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="wrap">
	<form action="deleteMessage.jsp" method="post">
		<input type="hidden" name="messageId" value="<%= request.getParameter("messageId") %>" />
		<div id="content">
			<div class="delForm">
				<p>��й�ȣ�� �Է����ּ���.</p>
				<dl>
					<dt>��й�ȣ</dt>
					<dd><input type="text" name="password" /></dd>
				</dl>
			</div>
		</div>
		<div id="footer" class="deleteBtn">
			<input type="submit" value="�ۻ���" />
		</div>
	</form>
</div>
</body>
</html>