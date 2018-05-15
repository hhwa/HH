<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title><tiles:getAsString name="title"/></title>
</head>
<body>

<table width="100%" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="2">
	
	<tiles:insertAttribute name="header" />
	</td>
</tr>
</table>
<table>
<tr>
	<td width="100" valign="top"><tiles:insertAttribute name="menu"/></td>
	<td width="500" valign="top"><tiles:insertAttribute name="body"/></td>
</tr>
<tr>
	<td colspan="2">
	<tiles:insertAttribute name="footer"/>
	</td>
</tr>	
</table>
</body>
</html>