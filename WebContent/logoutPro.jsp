<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title></title>
</head>
<body>
<h3>�α׾ƿ� �մϴ�.</h3>
<%
    session.invalidate(); // ���� ����
    response.sendRedirect("index.html");
%>
</body>
</html>