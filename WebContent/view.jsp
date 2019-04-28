<%@ page language="java"
	import="java.util.*,shop.GoodBean,shop.MongodbBean,shop.ImageBean"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String sid = request.getParameter("sid");
	String goodname = MongodbBean.getName(sid);
	String goodprice = MongodbBean.getPrice(sid);
	String goodseller = MongodbBean.getSeller(sid);
	String gooddes = MongodbBean.getDes(sid);
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
<style type="text/css">
IMG {
	float: left;
}
</style>
<body style="overflow-x: hidden; overflow-y: hidden">

	<div class="content">
		<div class="head">
			<h1>View goods</h1>
		</div>
		<IMG src="<%=ImageBean.getImage(sid + goodname)%>" width=280 height=300
			align=left border=0>

		<!--  panel   -->
		<div class="panel">

			<!--  name and price    -->
			<div class="group">
				<label>Name</label><input type="text" name="goodname"
					value="<%=goodname%>" disabled>
			</div>
			<div class="group">
				<label>Price</label> <input type="text" name="goodprice"
					value="<%=goodprice%>" disabled>
			</div>
			<div class="group">
				<label>Seller</label> <input type="text" name="goodseller"
					value="<%=goodseller%>" disabled>
			</div>
			<div class="group">
				<label>Description</label> <input type="text" name=gooddes
					value="<%=gooddes%>" disabled>
			</div>




		</div>

	</div>


</body>
</html>