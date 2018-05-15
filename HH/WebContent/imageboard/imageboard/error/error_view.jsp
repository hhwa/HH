<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>에러 발생</title>
</head>
<body>

에러가 발생하였습니다. <br><br>
에러 메세지 : <%=exception.getMessage() %>
<p>
<%
	Throwable rootCause = null;
	if(exception instanceof ServletException){
		rootCause = ((ServletException)exception).getRootCause();
	}else{
		rootCause=exception.getCause();
	}
	if(rootCause != null){
		rootCause.printStackTrace();
		
		do{
%>
예외 추적 : <%= rootCause.getMessage()%><br>
<%
			rootCause = rootCause.getCause();
		} while(rootCause != null);
	}
%>
</body>
</html>