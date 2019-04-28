<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="UTF-8"
	import="java.util.*,shop.MongodbBean,shop.ImageBean,shop.UserBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String text_change = "wait to add";
	String sid = request.getParameter("sid");
	String goodname = MongodbBean.getName(sid);
	String goodprice = MongodbBean.getPrice(sid);
	String goodseller = MongodbBean.getSeller(sid);
	String gooddes = MongodbBean.getDes(sid);
	String goodcatalog = MongodbBean.getCatalog(sid);
	String flag = request.getParameter("action");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />

<base href="<%=basePath%>">

<title>My JSP 'add_action.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="description" content="This is my page">
<body>
	<%
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		 String username=UserBean.getUserName(login.getUid());
		try {
			//connect mongodb
			MongoClient mongoClient = new MongoClient("localhost", 27017);

			@SuppressWarnings("deprecation")
			DB db = mongoClient.getDB("library");
			DBCollection coll = db.getCollection("good_temp");
			if (flag.equals("save")) {
				DBObject good = new BasicDBObject();//define a Bson to store username and password

				String[] a = MongodbBean.getGood_sid();

				good.put("sid", sid);
				good.put("sname", goodname);
				good.put("sprice", goodprice);
				good.put("catalog", goodcatalog);
				good.put("seller", goodseller);
				good.put("description", gooddes);
				good.put("saveName", username);

				coll.insert(good); //insert info                         
				response.sendRedirect("main_shop.jsp"); //when user register successfully, direct to register_success.jsp
			} else {
				DBObject deleteCondition = new BasicDBObject();
				deleteCondition.put("sid", sid);
				coll.remove(deleteCondition);
				response.sendRedirect("mySave.jsp");
			}

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
	%>


</body>
</html>