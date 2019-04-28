<%@ page language="java"
	import="java.util.*,shop.LoginBean,shop.MongodbBean,shop.UserBean"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String uid=request.getParameter("uid");
	String username=UserBean.getUserName(uid);
	String password=UserBean.getPassWord(uid);
	String email=UserBean.getEmail(uid);
	String address=UserBean.getAddress(uid);
	String phoneNum=UserBean.getPhoneNum(uid);
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<base href="<%=basePath%>">

<title>Personal information</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/login.css">
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
</head>


<body>

	<div class="content">
		<div class="head">
			<h1>Personal information</h1>
		</div>

		<!--  panel   -->
		<div class="panel">
			<form action="editPerson.jsp" method="post">

				<!--  name and price    -->
				<div class="group">
					<label>Name</label> <input type="text" name="username"
						value="<%=username%>">
				</div>
				<div class="group">
					<label>Password</label> <input type="text" name="password"
						value="<%=password%>">
				</div>
				<div class="group">
					<label>Email</label> <input type="text" name="email"
						value="<%=email%>">
				</div>
				<div class="group">
					<label>Address</label> <input type="text" name="address"
						value="<%=address%>">
				</div>
				<div class="group">
					<label>Phone number</label> <input type="text" name="phoneNum"
						value="<%=phoneNum%>">
				</div>
				
				<div class="login">
					<button id="submit" type="submit" name="edit">Submit</button>

				</div>
				
			</form>
		</div>

	</div>
</body>
</html>