<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>배열사용하는 방법</h2>
	<p>${numArr[0] }</p>
	<p>${numArr[1] }</p>
	
	<h2>리스트사용하는 방법</h2>
	<p>${numList[0] }</p>
	<p>${numList[1] }</p>
	<!-- 배열과 리스트는 값을 꺼내는 방법이 동일하다. -->
	
	<p>${memberList[0].name }</p>
	<p>${memberList[0].age }</p>
	<p>${memberList[0].addr }</p>
	<p>${memberList[1].name }</p>
	<p>${memberList[1].age }</p>
	<p>${memberList[1].addr }</p>
</body>
</html>