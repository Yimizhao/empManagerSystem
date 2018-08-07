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
	<form id="empForm" method="post">
		<div class="container">
			<div class="row">
				<div class="page-header col-md-12 headerCss">
					<h1>员工管理系统</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<span>员工ID</span><input type="text" id="empIdFrom" name="empFrom"><span>~</span><input
						id="empIdTo" name="empTo">
				</div>
				<div class="col-md-4">
					<input type="button" id="select" class="btn btn-success" value="检索"
						onclick="nameSpace.select();">
				</div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered table-hover">
						<thead class="theadCss">
							<tr>
								<th>No</th>
								<th><input type="checkbox" id="allCheck"></th>
								<th>员工ID</th>
								<th>员工姓名</th>
								<th>性别</th>
								<th>邮箱</th>
								<th>部门</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ emps}" var="emp">
								<tr>
									<td>${ emp.no}</td>
									<td><input type="checkbox" id="rowCheck"></td>
									<td>${ emp.empId}</td>
									<td>${ emp.empName}</td>
									<td>${ emp.gender}</td>
									<td>${ emp.email}</td>
									<td>${ emp.deptName}</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<!--分页文字信息  -->
				<div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages } 页,总
					${pageInfo.total } 条记录</div>
				<div class="col-md-6">
					<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH }/getEmp?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="${APP_PATH }/getEmp?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_Num }</a></li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="${APP_PATH }/getEmp?pn=${page_Num }">${page_Num }</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="${APP_PATH }/getEmp?pn=${pageInfo.pageNum+1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="${APP_PATH }/getEmp?pn=${pageInfo.pages}">末页</a></li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
		<input type="hidden" id="pageContext" value="${APP_PATH }">
	</form>
</body>
</html>