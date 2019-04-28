<%@ page language="java" import="java.util.*,com.mongodb.*"
	pageEncoding="UTF-8"
	import="java.util.*,shop.MongodbBean,shop.ImageBean,shop.GoodBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String text_change = "wait to edit";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
<base href="<%=basePath%>">

<title>My JSP 'delete_action.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<%
         response.setContentType("text/html;charset=utf-8");  
         request.setCharacterEncoding("utf-8");            
         String Uid=(String)request.getParameter("uid");
    
 
         try{   
             //connect mongodb
             MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
       
             @SuppressWarnings("deprecation")
             DB db = mongoClient.getDB( "library" );  
             DBCollection coll = db.getCollection("userInfo");  
            
            // DBObject good = new BasicDBObject();//define a Bson to store username and password
             DBCursor cursor = coll.find();
             int i=1; 
             while (cursor.hasNext()) {     //search all
                
                 DBObject show = cursor.next();              
                 System.out.println(show); 
                 @SuppressWarnings("rawtypes")
                 Map show1 = show.toMap();  //trans map
                 String toUid = (String)show1.get("uid");  // get username value
                 if(toUid.equals(Uid)){  
                	 DBObject deleteCondition=new BasicDBObject();
                	 deleteCondition.put("uid", Uid);
                	 coll.remove(deleteCondition);
                     
                 }
               
                  
                 i++;
             }
           
            	  response.sendRedirect("usersList.jsp");
            
                                  
             //when user register successfully, direct to register_success.jsp
                                                  
          }catch(Exception e){
             System.err.println( e.getClass().getName() + ": " + e.getMessage() );
         }    
     %>


</body>
</html>