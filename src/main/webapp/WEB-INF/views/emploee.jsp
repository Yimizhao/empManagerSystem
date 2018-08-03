<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>员工管理</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH }/js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${APP_PATH }/bootstrap/js/bootstrap.js"></script>
<script src="${APP_PATH }/js/emploee.js"></script>
<!-- Bootstrap -->
<link href="${APP_PATH }/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${APP_PATH }/css/emploee.css" rel="stylesheet">
</head>
<body class="BodyCSS">
	<form id="empFrom">
		<div class="container">
			<div class="row">
				<div class="page-header col-md-12 headerCss">
					<h1>员工管理系统</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<span>员工ID</span><input type="text" id="empIdFrom" name="empIdFrom"><span>~</span><input
						id="empIdTo" name="empIdTo">
				</div>
				<div class="col-md-4">
					<input type="button" id="select" value="检索" onclick="nameSpace.select();">
				</div>
			</div>
		</div>
	</form>
</body>
</html>