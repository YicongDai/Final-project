<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="UTF-8"
	import="java.util.*,shop.MongodbBean,shop.ImageBean,shop.UserBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String text_change = "wait to add";
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
		String Name = (String) request.getParameter("goodname"); //get username
		String Price = (String) request.getParameter("goodprice"); //get password1
		String Des = (String) request.getParameter("description");
		String Catalog = (String) request.getParameter("catalog");
		
		String doc = (String) request.getParameter("doc");
  String username= UserBean.getUserName(login.getUid());
  if(!doc.contains(".jpg")){
	  response.sendRedirect("main_shop.jsp?error=1");
  }
  else{
	  try {
			//connect mongodb
			MongoClient mongoClient = new MongoClient("localhost", 27017);

			@SuppressWarnings("deprecation")
			DB db = mongoClient.getDB("library");
			DBCollection coll = db.getCollection("good");

			DBObject good = new BasicDBObject();//define a Bson to store username and password

			String[] a = MongodbBean.getGood_sid();
			 UUID uuid = UUID.randomUUID(); 
             String Sid = UUID.randomUUID().toString();
			for (int i = 0; i < a.length; i++) {
				if (Sid.equals(a[i])) {
					Sid = Sid + 1;
				}
			}

			good.put("sid", Sid);
			good.put("sname", Name);
			good.put("sprice", Price);
			good.put("seller", username);
			ImageBean.saveImage(Sid+Name, doc);
			good.put("catalog", Catalog);
			good.put("description", Des);

			coll.insert(good); //insert info                         
			response.sendRedirect("main_shop.jsp?action=succeed"); //when user register successfully, direct to register_success.jsp

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
  }
		
	%>


</body>
</html>