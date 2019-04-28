<%@ page language="java"
	import="java.util.*,shop.GoodBean,shop.MongodbBean"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String sid = request.getParameter("sid");
	String goodname = MongodbBean.getName(sid);
	String goodprice = MongodbBean.getPrice(sid);
	String gooddescription = MongodbBean.getDes(sid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="good" scope="session" class="shop.GoodBean" />
<base href="<%=basePath%>">

<title>Edit page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/login.css">


</head>
<style>
.select {
	display: inline-block;
	width: 250px;
	position: relative;
	vertical-align: middle;
	padding: 0;
	overflow: hidden;
	background-color: #fff;
	color: #555;
	border: 1px solid #aaa;
	text-shadow: none;
	border-radius: 4px;
	transition: box-shadow 0.25s ease;
	z-index: 2;
}

.select:hover {
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.15);
}

.select:before {
	content: "";
	position: absolute;
	width: 0;
	height: 0;
	border: 10px solid transparent;
	border-top-color: #ccc;
	top: 14px;
	right: 10px;
	cursor: pointer;
	z-index: -2;
}

.select select {
	cursor: pointer;
	padding: 10px;
	width: 100%;
	border: none;
	background: transparent;
	background-image: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.select select:focus {
	outline: none;
}

textarea {
	vertical-align: top;
}
</style>
<body>

	<div class="content">
		<div class="head">
			<h1>Edit goods</h1>
		</div>

		<!--  panel   -->
		<div class="panel">
			<form action="edit_action.jsp?sid=<%=sid%>" method="post">

				<!--  name and price    -->
				<div class="group">
					<label>Name</label><input type="text" name="goodname"
						value="<%=goodname%>">
				</div>
				<div class="group">
					<label>Price</label> <input type="text" name="goodprice"
						value="<%=goodprice%>">
				</div>
				<div class="group">
					<label>Catalog</label>
					<div class="select">
						<select name="catalog">
							<option value="Electronics">Electronics</option>
							<option value="Entertainment">Entertainment</option>
							<option value="Book" selected>Book</option>
							<option value="Bicycle">Bicycle</option>
							<option value="Sports">Sports</option>
							<option value="Sports">Toys</option>
							<option value="Others">Others</option>
						</select>
					</div>
				</div>
				<div class="group">
					<label for="description">Description</label>
					<textarea name="description" cols="30" rows="10"><%=gooddescription%></textarea>
				</div>
				<div class="login">
					<button type="submit" name="edit">Submit</button>

				</div>
			</form>
		</div>

	</div>
</body>
</html>