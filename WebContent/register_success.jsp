<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register successfully page</title>
</head>
<link rel="stylesheet" type="text/css" href="styles.css">
<style type="text/css">
/*p,input,button{
            text-align: center;
        }*/
div {
	text-align: center;
}

button {
	background: #222 url(overlay.png) repeat-x;
	display: inline-block;
	padding: 5px 10px 6px;
	color: #fff;
	text-decoration: none;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.6);
	-webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.6);
	text-shadow: 0 -1px 1px rgba(0, 0, 0, 0.25);
	border-bottom: 1px solid rgba(0, 0, 0, 0.25);
	position: relative;
	cursor: pointer
}
</style>
<body>
	<p>
	<p>
	<div>
		<font color="red" size="18"> You have register
			successfully!Please back to login!</font> <br>
		<button onclick="window.location.href='login.jsp'">Back to
			login</button>
	</div>

</body>
</html>