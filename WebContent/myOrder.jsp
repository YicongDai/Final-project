<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
<head>

<title>Order</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">

<%
if("buy".equals(request.getParameter("action"))){ %>

<script type="text/javascript">
    alert("Thank you for your purchase");
    
</script>

<%}else{%>

<% }%>
</head>
<style>

.register {
    text-align: center;
    margin-top: 20px;
}
.register button {
    background-color: #466BAF;
    width: 180px;
}

.register button:hover {
    background-color: white;
    color: #466BAF;
    border: 1px solid #466BAF;
}

</style>
<body>
       <div class="register">
				<button onclick="window.location.href='main_shop.jsp'">Continue
					shopping</button>
		</div>
</body>
</html>