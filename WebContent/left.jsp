<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: White;
}

li {
	line-height: 20px;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 8px 16px;
	text-decoration: none;
	background-color: #466BAF;
}

li a:hover {
	background-color: #111;
}
</style>
</head>
<body>

	<ul>
		<li><a href="catalog.jsp?kw=Electronics" target="main">Electronics</a></li>
		<li><a href="catalog.jsp?kw=Entertainment" target="main">Entertainment</a></li>
		<li><a href="catalog.jsp?kw=Book" target="main">Book</a></li>
		<li><a href="catalog.jsp?kw=Bicycle" target="main">Bicycle</a></li>
		<li><a href="catalog.jsp?kw=Sports" target="main">Sports</a></li>
		<li><a href="catalog.jsp?kw=Toys" target="main">Toys</a></li>
		<li><a href="catalog.jsp?kw=Others" target="main">Others</a></li>
	</ul>



</body>
</html>