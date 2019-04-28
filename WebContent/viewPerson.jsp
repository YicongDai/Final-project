<%@ page language="java"
	import="java.util.*,shop.UserBean,shop.MongodbBean,shop.ImageBean"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String uid = request.getParameter("uid");
	String username = UserBean.getUserName(uid);
	String password = UserBean.getPassWord(uid);
	String email = UserBean.getEmail(uid);
	String address = UserBean.getAddress(uid);
	String phoneNum = UserBean.getPhoneNum(uid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>View page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/login.css">


</head>


<body style="overflow-x: hidden; overflow-y: hidden">

	<div class="content">
		<div class="head">
			<h1>View user</h1>
		</div>

		<!--  panel   -->
		<div class="panel">

			<!--  name and price    -->
			<div class="group">
				<label>Name</label><input type="text" name="username"
					value="<%=username%>" disabled>
			</div>
			<div class="group">
				<label>Password</label> <input type="text" name="password"
					value="<%=password%>" disabled>
			</div>
			<div class="group">
				<label>Email</label> <input type="text" name="Email"
					value="<%=email%>" disabled>
			</div>
			<div class="group">
				<label>Address</label> <input type="text" name="Address"
					value="<%=address%>" disabled>
			</div>
			<div class="group">
				<label>Phone number</label> <input type="text" name="phoneNum"
					value="<%=phoneNum%>" disabled>
			</div>




		</div>

	</div>


</body>
</html>