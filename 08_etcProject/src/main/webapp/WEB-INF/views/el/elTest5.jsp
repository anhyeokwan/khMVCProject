<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 연산</h1>
	<ul>
		<li>${num1 }</li>
		<li>${num2 }</li>
		<li>${str }</li>
		<li>${str1 }</li>
	</ul>
	<hr>
	
	<table border="1">
		<tr>
			<th>표현식</th>
			<th>결과</th>
		</tr>
		
		<tr>
			<td>\${num1 } + \${num2 }</td>
			<td>${num1 } + ${num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } + ${num2 }</td>
			<td>${num1 + num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } - ${num2 }</td>
			<td>${num1 - num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } * ${num2 }</td>
			<td>${num1 * num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } % ${num2 }</td>
			<td>${num1 % num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } > ${num2 }</td>
			<td>${num1 gt num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } < ${num2 }</td>
			<td>${num1 lt num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } >= ${num2 }</td>
			<td>${num1 ge num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } <= ${num2 }</td>
			<td>${num1 le num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } == ${num2 }</td>
			<td>${num1 eq num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } != ${num2 }</td>
			<td>${num1 ne num2 }</td>
		</tr>
		
		<tr>
			<td>${num1 } != ${num2 }</td>
			<td>${num1 ne num2 }</td>
		</tr>
		
		<tr>
			<td>${str } == "abc"</td>
			<td>${str eq "abc" }</td>
		</tr>
		
		<tr>
			<td>${str } == null </td>
			<td>${empty str }</td>
		</tr>
		
		<tr>
			<td>${str } != null </td>
			<td>${not empty str }</td>
		</tr>
	</table>
	
	<%--
	
		 >   -> gt(greater) 
		 <   -> lt(little)
		 >=	 -> ge(grater or equal)
		 <=  -> le(lettle or equal)
		 ==  -> eq(equal)
		 !=  -> ne(not equal)
	--%>
</body>
</html>





















