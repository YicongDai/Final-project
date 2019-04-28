<%@ page contentType="text/html;charset=GBK"
	import="java.util.*,shop.MongodbBean,shop.LoginBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String kw = request.getParameter("kw");
	String cp = request.getParameter("cp");//cp page
	//int page_number = DBBean.getTotalPage();
	//int currpage = page_number;
	int currpage = (cp == null || cp == "") ? 1 : Integer.parseInt(cp);
	String[][] ss = MongodbBean.getGoodList(currpage);
	int n = MongodbBean.getlength(ss);
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
<head>
<base href="<%=basePath%>">

<title>Shopping page</title>



<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/login.css">



<%
if("1".equals(request.getParameter("error"))){ %>

<script type="text/javascript">
    alert("The format of image should be .jpg!");
</script>

<%}else{%>

<% }%>
</head>
<body style="overflow-x: hidden; overflow-y: hidden">

    
	<div class="content">

		<div class="panel1">
		
			<%
				if (n <= 0) {
			%>
			<center>
				<font color="red" size="20">There are nothing on sale </Font>
			</center>
			<%
				} else {
			%>
			 <h2>Good list</h2>
			<table border="1" align="center">
				<tr>
					 <th width="17%" align="center">Sid</th>
					<th width="17%" align="center">Name</th>
					<th width="17%" align="center">Price</th>
					<th width="17%" align="center">Catalog</th>
					<th width="17%" align="center">Seller</th>
					<th width="50%" align="center">Description</th>
				    <th width="70%" align="center">Operation</th>
			     
				</tr>
				<%
					for (int i = 0; i < n; i++) {
				%>
				<tr>
				    <td height="17%" align="center"><%=ss[i][0]%></td>
					<td height="17%" align="center"><%=ss[i][1]%></td>
					<td height="17%" align="center"><%=ss[i][2]%></td>
					<td height="17%" align="center"><%=ss[i][3]%></td>
					<td height="17%" align="center"><%=ss[i][4]%></td>
					<td height="50%" align="center"><%=ss[i][5]%></td>
					<td height="70%" align="center"><a
						href="view.jsp?sid=<%=ss[i][0]%>&action=view">view</a>
					    <a href="delete_action.jsp?sid=<%=ss[i][0]%>&action=delete&user=admin">delete</a></td>
				</tr>
				<%
					}
				%>
			</table>

			<%
				int tp = MongodbBean.getTotalPage();

					if (currpage != 1 && tp > 0) {
			%>

			<a href="list.jsp?cp=<%=currpage - 1%>">Previous</a>

			<%
				}

					if (currpage != tp && tp > 0) {
			%>
			<a href="list.jsp?cp=<%=currpage + 1%>">Next</a>
			<%
				}
			%>

			<form action="list.jsp" name="myform">
				<select name="cp" onchange="document.myform.submit()">
					<%
						for (int i = 1; i <= tp; i++) {
					%>
					<option value="<%=i%>" <%=(i == currpage) ? "selected" : ""%>><%=i%></option>
					<%
						}
					%>
				</select>
			</form>
			<%
				}
			%>
		</div>

	</div>
</body>

</html>