<%@ page language="java" import="java.util.*,com.mongodb.*,shop.UserBean"  contentType="text/html;charset=gb2312" import="shop.MongodbBean" 
pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String[] goodname = new String[100];
String[] goodprice =  new String[100];
String[] goodseller =  new String[100];
String[] goodid =  new String[100];
String[] goodcatalog=  new String[100];
String[] gooddescription=  new String[100];
int count=0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <jsp:useBean id="login" scope="session" class="shop.LoginBean"/>
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
     <%
         response.setContentType("text/html;charset=utf-8");  
         request.setCharacterEncoding("utf-8");            
         String username=UserBean.getUserName(login.getUid());
         boolean flag = false;
         try{   
             //connect mongodb
             MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
             
             @SuppressWarnings("deprecation")
             DB db = mongoClient.getDB( "library" );  
             DBCollection coll = db.getCollection("good_temp");  
           
            
             DBCursor cursor = coll.find();  //select and find information
             
             int i=1; 
             while (cursor.hasNext()) {     //search all
   
                 DBObject show = cursor.next();              
                 System.out.println(show); 
                 @SuppressWarnings("rawtypes")
                 Map show1 = show.toMap();  //trans map
                 String toname = (String)show1.get("saveName");  
                 if(toname.equalsIgnoreCase(username) ){  
                     
                     goodname[count] =(String)show1.get("sname");
                     goodprice[count] = (String)show1.get("sprice");
                     goodseller[count] =(String)show1.get("seller");
                     goodid[count] = (String)show1.get("sid");
                     goodcatalog[count]= (String)show1.get("catalog");
                     gooddescription[count]= (String)show1.get("description");
                      count++;
                  
                 }
                  
                 i++;
             }
             
             
           }catch(Exception e){
              System.err.println( e.getClass().getName() + ": " + e.getMessage() );
          }
           
      %>
   <div class="content">
   <div class="panel1">
    <% 
    System.out.print(goodid[0]);
 if(goodid[0]==null)
 {
 %>
  <font color="red" size="20">There is nothing saved</Font>
 <% 
 }
 else
 { 
 %>  
 <h2>My saved</h2>
     <table border="1" align="center">
    <tr>
     <td width="17%" align="center">Name</td>
     <td width="17%" align="center">Price</td>    
     <td width="17%" align="center">Catalog</td>  
      <td width="17%" align="center">Seller</td>  
      <td width="20%" align="center">Description</td>  
      <td width="70%" align="center">Operation</td>
    </tr>     
 <%

 for(int i=0;i<count;i++)
{  
 
 %>
    <tr>
      <td height="17%" align="center"><%= goodname[i] %></td>
      <td height="17%" align="center"><%= goodprice[i] %></td>   
       <td height="17%" align="center"><%= goodcatalog[i] %></td> 
       <td height="17%" align="center"><%= goodseller[i] %></td> 
        <td height="20%" align="center"><%= gooddescription[i] %></td>    
      <td height="70%" align="center"> <a href="view.jsp?sid=<%= goodid[i] %>&action=view">view</a>
      <a href="saved.jsp?sid=<%= goodid[i] %>&action=unsave">unsave</a>
       <a href="buy.jsp?sid=<%= goodid[i] %>&action=buy">buy</a></td>
    </tr>        
 <%
    }
 %>    
     </table>
     <br>
     <br>

			<%
				}
			%>


			<br>
    <div class="register">
     <button onclick="window.location.href='main_shop.jsp'">Continue shopping</button>
    </div>
 </div>
 </div>
  </body>
</html>