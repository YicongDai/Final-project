<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312" import="shop.MongodbBean"
	pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="cart" scope="session" class="shop.ShopCartBean" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Shopping cart</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<link rel="stylesheet" type="text/css" href="css/login.css">



</head>

<body>
	<div class="content">
		<div class="panel1">
			<%
				if (cart.isEmpty()) {
			%>
			<center>
				<font color="red" size="20">There is nothing in the cart</Font>
			</center>
			<%
				} else {
			%>
			<h2>Shopping cart</h2>
			<table border="1">
				<tr>
					<td width="27%" align="center">Name</td>
					<td width="27%" align="center">Price</td>
					<td width="27%" align="center">Seller</td>
					<td width="27%" align="center">Quantity</td>
					<td width="27%" align="center">Operation</td>
				</tr>
				<%
					String[][] ssa = cart.getCart();
						for (int i = 0; i < ssa.length; i++) {
				%>
				<tr>
					<td height="30%" align="center"><%=ssa[i][1]%></td>
					<td height="30%" align="center"><%=ssa[i][2]%></td>
					<td height="30%" align="center"><%=ssa[i][3]%></td>
					<td>
						<form action="buy.jsp" method="post">
							<input type="text" name="count" value="<%=ssa[i][4]%>">
							<input type="hidden" name="sid" value="<%=ssa[i][0]%>">
							<input type="hidden" name="action" value="gc">
						</form>
					</td>
					<td><a href="view.jsp?sid=<%=ssa[i][0]%>&action=view">view</a>
						<a href="buy.jsp?sid=<%=ssa[i][0]%>&action=del">del</a></td>
				</tr>
				
			</table>
			<br> <br> The total price：<%=Math.round(cart.getTotal() * 100) / 100.0%>
			<div class="register">
			<button onclick="window.location.href='myOrder.jsp?sid=<%=ssa[i][0]%>&action=buy'">pay</button>
			
			</div>
			<%
					}
				%>
			<%
				}
			%>


			<br>
			<div class="register">
				<button onclick="window.location.href='main_shop.jsp'">Continue
					shopping</button>
			</div>
		</div>
	</div>
</body>
</html>