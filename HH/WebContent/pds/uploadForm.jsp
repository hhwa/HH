<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>파일 등록</title>
</head>
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
파일 : <input type="file" name="file"/><br>
설명 : <input type="text" name="description"/> <br>
<input type="submit" value="업로드"/>
</form>
</body>
</html>