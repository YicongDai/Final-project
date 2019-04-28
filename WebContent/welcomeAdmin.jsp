<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="login" scope="session" class="shop.LoginBean" />
<title>Online second-hand trade platform</title>
<link href="css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/common/jquery.js"></script>
<script type="text/javascript" src="js/common/common.js"></script>
<script>
	function exit() {
		window.open('../Test/login.jsp', '_top')
	}
</script>
</head>
<body>
<div id="FrameTop" class="frame-top">
    	<div class="topdata">
            <div id="SysIcon"></div>
            <h1 class="systitle">BackgroundManagement</h1>
          <div class="siteinfo">
           	<p>Welcome, admin!</p>
                <div class="toprightmenu">
                    <a onclick="exit()">logout</a>
                </div>
          </div>
      </div>
    </div>
    
    <!-- left-->
    <div class="frame-left">
 		<ul class="leftmenu">
        	<li>
            	<a class="dropmenu">Good management</a>
                 <ul class="submenu">
                	<li><a target="mainFrame" href="list.jsp?action=view">View goods info</a></li>
                    <li><a target="mainFrame" href="list.jsp?action=delete">Delete Goods info</a></li>
                </ul>
            </li>
            <li>
            	<a class="dropmenu">User management</a>
                 <ul class="submenu">
                	<li><a target="mainFrame" href="usersList.jsp?action=view">View user Info</a></li>
                    <li><a target="mainFrame" href="usersList.jsp?action=delete">Delete user Info</a></li>
                </ul>
            </li>
            
        </ul>
</div>
    <!-- content-->
    <div class="frame-main">
    	<iframe id="MainFrame" scrolling="auto" frameborder="no" name="mainFrame" src="list.jsp">
        </iframe>
	</div>
</body>
</html>
