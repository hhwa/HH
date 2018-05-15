<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 수정</title>
</head>
<body>
글을 수정했습니다.
<br>
<a href="list.jsp?p=${param.p }">목록보기</a>
<a href="read.jsp?articleId=${updatedArticle.id }&p=${param.p}">게시글 읽기</a>
</body>
</html>