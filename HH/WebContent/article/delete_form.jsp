<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제하기</title>
</head>
<body>

<form action="delete.jsp" method="post">
<input type="hidden" name="articleId" value="${param.articleId }"/>
글암호: <input type="password" name="password" /> <br>
<input type="submit" value="삭제"/>
</form>
</body>
</html>