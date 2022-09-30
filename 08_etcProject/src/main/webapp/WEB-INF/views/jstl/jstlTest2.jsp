<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>c:if</h1>
	<hr>
	<c:if test="${num % 2 eq 0 }"><!-- test라는 조건식에에 true가나오면 실행 -->
		<h3>짝수</h3>
	</c:if>
	
	<c:if test="${num % 2 eq 1 }">
		<h3>홀수</h3>
	</c:if>
</body>
</html>