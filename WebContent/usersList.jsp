<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="UTF-8" import="java.util.*,shop.MongodbBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String[] uid = new String[100];
	String[] username = new String[100];
	String[] userpassword = new String[100];
	String[] useremail = new String[100];
	String[] useraddress = new String[100];
	String[] userphonenumber= new String[100];
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
		boolean flag = false;
		try {
			//connect mongodb
			MongoClient mongoClient = new MongoClient("localhost", 27017);

			@SuppressWarnings("deprecation")
			DB db = mongoClient.getDB("library");
			DBCollection coll = db.getCollection("userInfo");

			DBCursor cursor = coll.find(); //select and find information

			int i = 1;

			while (cursor.hasNext()) { //search all
				DBObject show = cursor.next();
				System.out.println(show);
				@SuppressWarnings("rawtypes")
				Map show1 = show.toMap(); //trans map
				    uid[count]= (String) show1.get("uid");
					username[count] = (String) show1.get("username");
					userpassword[count] = (String) show1.get("password");
					useremail[count] = (String) show1.get("email");
					useraddress[count] = (String) show1.get("address");
					userphonenumber[count] = (String) show1.get("phone_number");
					count++;
				     i++;
			}

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
	%>
	<%
				if (count <= 0) {
			%>
			<center>
				<font color="red" size="20">There is no user </Font>
			</center>
			<%
				} else {
			%>
	<div class="panel1">
		<div class="head">
			<center>
				<h1>User list</h1>
			</center>
		</div>
		<table border="1" align="center">
			<tr>
				<th width="20%" align="center">Uid</th>
				<th width="20%" align="center">Name</th>
				<th width="20%" align="center">Password</th>
				<th width="20%" align="center">Email</th>
				<th width="20%" align="center">Address</th>
				<th width="20%" align="center">PhoneNum</th>
				<th width="60%" align="center">Operation</th>
				
			</tr>
			<%
				for (int i = 0; i < count; i++) {
			%>
			<tr>
				<td height="20%" align="center"><%=uid[i]%></td>
				<td height="20%" align="center"><%=username[i]%></td>
				<td height="20%" align="center"><%=userpassword[i]%></td>
				<td height="20%" align="center"><%=useremail[i]%></td>
				<td height="20%" align="center"><%=useraddress[i]%></td>
				<td height="20%" align="center"><%=userphonenumber[i]%></td>
				<td height="60%" align="center"><a
					href="viewPerson.jsp?uid=<%=uid[i]%>&action=view">view</a>
					<a
					href="deletePerson.jsp?uid=<%=uid[i]%>&action=delete">delete</a> 
					</td>
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