<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>shopping page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>
<frameset rows="18%,75%,7%" noresize="noresize" cols="*"
	frameborder="no" border="0" framespacing="0">
	<frame src="header.jsp">
	<frameset cols="11%,89%" border="0">
		<frame src="left.jsp" name="mainFrame" id="mainFrame"
			title="mainFrame" />
		<frame src="main_shop.jsp" name="main">
	</frameset>


	<frame src="bottom.jsp">
</frameset>


<body>

</body>
</html>