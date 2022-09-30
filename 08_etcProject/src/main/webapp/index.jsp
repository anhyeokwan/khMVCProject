<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="WEB-INF/views/common/header.jsp"/>

	<h1>index페이지</h1>
	
	<a href="/test1.do">서블릿호출1</a>
	
	<hr>
	
	<h3><a href="/jspForward.do?name=안형관">jsp:forward</a></h3>
	
	<hr>
	
	<h3>EL(Expression Language)</h3>
	<h3><a href="/elTest.do">1. EL Test1(기본변수)</a></h3>
	<h3><a href="/elTest2.do">2. EL Test2(VO)</a></h3>
	<h3><a href="/elTest3.do">3. EL Test3(list, array)</a></h3>
	<h3><a href="/elTest4.do">4. EL Test4(내장객체)</a></h3>
	<h3><a href="/elTest5.do">5. EL Test4(연산)</a></h3>
	
	<hr>
	
	<h2>JSTL(JSP Standard Tag Library)</h2>
	<h3><a href="/jstlTest1.do">1. JSTL 기본사용법</a></h3>
	<h3><a href="/jstlTest2.do">2. JSTL if</a></h3>
	<h3><a href="/jstlTest3.do">3. JSTL choose</a></h3>
	<h3><a href="/jstlTest4.do">4. JSTL forEach</a></h3>

</body>
</html>