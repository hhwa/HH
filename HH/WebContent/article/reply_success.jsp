<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>답변글 작성</title>
</head>
<body>
답변글을 등록했습니다.
<br>
<a href="list.jsp?p=${param.p }">목록보기</a>
<a href="read.jsp?articleId=${postedArticle.id }&p=${param.p}">게시글 읽기</a>
</body>
</html>