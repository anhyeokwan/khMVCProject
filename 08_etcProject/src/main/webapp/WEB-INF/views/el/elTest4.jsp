<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request data</h1>
	<p>${m.name }</p>
	<p>${m.age }</p>
	<p>${m.addr }</p>
	<!-- session과 request의 키이름이 같을 경우 request는 requestScope를 안붙혀도 됨 -->
	
	<h1>session data</h1>
	<p>${sessionScope.m.name }</p>
	<p>${sessionScope.m.age }</p>
	<p>${sessionScope.m.addr }</p>
</body>
</html>