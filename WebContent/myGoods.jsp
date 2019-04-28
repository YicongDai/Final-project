<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="gb2312"
	import="java.util.*,shop.MongodbBean,shop.GoodBean,shop.UserBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String[] goodname = new String[100];
	String[] goodprice = new String[100];
	String[] goodid = new String[100];
	String[] goodcatalog = new String[100];
	String[] gooddescription = new String[100];
	int count = 0;
	String uid=request.getParameter("uid");
	String username=UserBean.getUserName(uid);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
<base href="<%=basePath%>">

<title>My good list</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/login.css">
<%
if("1".equals(request.getParameter("errorMeassge"))){ %>

<script type="text/javascript">
    alert("The price should be number£¡");
</script>

<%}else{%>

<% }%>
</head>

<body>
	<%
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
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
				String toname = (String) show1.get("seller");
				if (toname.equalsIgnoreCase(username)) {

					goodname[count] = (String) show1.get("sname");
					goodprice[count] = (String) show1.get("sprice");
					goodid[count] = (String) show1.get("sid");
					goodcatalog[count] = (String) show1.get("catalog");
					gooddescription[count] = (String) show1.get("description");
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
				<h1><%=username%> Goods List
				</h1>
			</center>
		</div>
		<%
			if (goodid[0] == null) {
		%>
		<center>
			<font color="red" size="20">You don't have anything on sale </Font>
		</center>
		<center>
			<a href="add.jsp">Add something</a>
		</center>
		<%
			} else {
		%>
		<table border="1" align="center">
			<tr>
				<!--  <th width="30%" align="center">Sid</th> -->

				<th width="25%" align="center">Name</th>
				<th width="25%" align="center">Price</th>
				<th width="25%" align="center">Catalog</th>
				<th width="50%" align="center">Description</th>
				<th width="60%" align="center">Operation</th>
			</tr>
			<%
				for (int i = 0; i < count; i++) {
			%>
			<tr>
				<!--  <td height="30%" align="center"><%=goodid[i]%></td> -->
				<td height="25%" align="center"><%=goodname[i]%></td>
				<td height="25%" align="center"><%=goodprice[i]%></td>
				<td height="25%" align="center"><%=goodcatalog[i]%></td>
				<td height="50%" align="center"><%=gooddescription[i]%></td>
				<td height="60%" align="center">
				    <a href="view.jsp?sid=<%=goodid[i]%>&action=view">view</a>
					<a href="edit.jsp?sid=<%=goodid[i]%>&action=edit">edit</a> 
					<a href="delete_action.jsp?sid=<%=goodid[i]%>&action=delete&user=user"
					onclick="if(confirm('Are you sure to delete it ?')==false)return false;">delete</a>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</div>
	<center>
		<a href="main_shop.jsp">Back to main shop</a>
	</center>
	<%
		}
	%>
</body>
</html>