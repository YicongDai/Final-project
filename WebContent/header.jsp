<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
<meta charset="ISO-8859-1">
<title>Header page</title>
<script>
	function exit() {
		window.open('../Test/login.jsp', '_top')
	}
</script>
<style>
.welcome {
	float: right;
}

body {
	margin: 0;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
	position: fixed;
	top: 60%;
	width: 100%;
}
li :not(.right){
	float: left;;
}



li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
li a:hover:not(.active){
background-color: #111;}




.active {
	background-color: #4CAF50;
}

.right {
	float: right;
}
</style>

</head>
<body>
	<center>
		<h1>Online Second-hand Trading Platform</h1>
	</center>
	<ul>
		<li><a class="active" href="main_shop.jsp" target="main">Home page</a></li>
		<li><a href="person.jsp?uid=<%=login.getUid()%>" target="main">Profile</a></li>
		<li><a href="add.jsp" target="main">Sell item</a></li>
		<li><a href="myGoods.jsp?uid=<%=login.getUid()%>" target="main">My good</a></li>
		<li><a href="cart.jsp" target="main">Shopping cart</a></li>
		<li><a href="mySave.jsp" target="main">My save</a></li>
		
        
		<li><a class="right" onclick="exit()">Logout</a></li>
		<li><a class="right" href="aboutUs.jsp" target="main" >About us</a></li>
		<li><a class="right" href="contactUs.jsp" target="main">Contact us</a></li>
	</ul>
</body>
</html>