<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="UTF-8" import="java.util.*,shop.MongodbBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String[] goodname = new String[100];
	String[] goodprice = new String[100];
	String[] goodid = new String[100];
	String[] goodseller = new String[100];
	String[] gooddes = new String[100];
	int count = 0;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Catalog page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
	<%
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String kw = (String) request.getParameter("kw"); //get good
		boolean flag = false;
		try {
			//connect mongodb
			MongoClient mongoClient = new MongoClient("localhost", 27017);

			@SuppressWarnings("deprecation")
			DB db = mongoClient.getDB("library");
			DBCollection coll = db.getCollection("good");

			DBCursor cursor = coll.find(); //select and find information

			int i = 1;

			while (cursor.hasNext()) { //search all
				DBObject show = cursor.next();
				System.out.println(show);
				@SuppressWarnings("rawtypes")
				Map show1 = show.toMap(); //trans map
				String tocalalog = (String) show1.get("catalog");
				if (kw.equalsIgnoreCase(tocalalog)) {
					goodname[count] = (String) show1.get("sname");
					goodprice[count] = (String) show1.get("sprice");
					goodid[count] = (String) show1.get("sid");
					goodseller[count] = (String) show1.get("seller");
					gooddes[count] = (String) show1.get("description");
					count++;
				}

				i++;
			}

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
	%>
	<div class="panel1">
		<div class="head">
			<center>
				<h1><%=kw%></h1>
			</center>
		</div>
		<%
			if (goodid[0] == null) {
		%>
		<center>
			<font color="red" size="20">No items in this category are
				currently being sold </Font>
		</center>
		<%
			} else {
		%>
		<table border="1" align="center">
			<tr>
				<th width="20%" align="center">Sname</th>
				<th width="20%" align="center">Sprice</th>
				<th width="20%" align="center">Seller</th>
				<th width="50%" align="center">Description</th>
				<th width="60%" align="center">Operation</th>
			</tr>
			<%
				for (int i = 0; i < count; i++) {
			%>
			<tr>
				<td height="20%" align="center"><%=goodname[i]%></td>
				<td height="20%" align="center"><%=goodprice[i]%></td>
				<td height="20%" align="center"><%=goodseller[i]%></td>
				<td height="50%" align="center"><%=gooddes[i]%></td>
				<td height="60%" align="center"><a
					href="buy.jsp?sid=<%=goodid[i]%>&action=buy">buy</a> <a
					href="view.jsp?sid=<%=goodid[i]%>&action=view">view</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>
	</div>


</body>
</html>