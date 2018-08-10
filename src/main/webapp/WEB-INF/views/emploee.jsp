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
					<span>员工ID</span><input type="text" id="empIdFrom" name="empFrom"
						value="${empFrom }"><span>~</span><input id="empIdTo"
						name="empTo" value="${empTo }">
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
						<thead class="theadCss" id="empThead">
							<tr>
								<th>No</th>
								<th><input type="checkbox" id="allCheck"
									onclick="nameSpace.selectCheckAll(this)"></th>
								<th>员工ID</th>
								<th>员工姓名</th>
								<th>性别</th>
								<th>邮箱</th>
								<th>部门</th>
							</tr>
						</thead>
						<tbody id="empBody">
							<c:forEach items="${ emps}" var="emp">
								<tr>
									<td>${ emp.no}</td>
									<td><input type="checkbox" id="rowCheck"
										onclick="nameSpace.selectCheck(this)"></td>
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
				<div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
					页,总 ${pageInfo.total } 条记录</div>
				<div class="col-md-6">
					<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="javascript:void(0)"
							onclick="nameSpace.toPage(this)" id="1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="javascript:void(0)"
								onclick="nameSpace.toPage(this)" id="${pageInfo.pageNum -1 }"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_Num }</a></li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="javascript:void(0)"
									onclick="nameSpace.toPage(this)" id="${page_Num }">${page_Num }</a></li>
							</c:if>

						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="javascript:void(0)"
								onclick="nameSpace.toPage(this)" id="${pageInfo.pageNum + 1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="javascript:void(0)"
							onclick="nameSpace.toPage(this)" id="${pageInfo.pages}">末页</a></li>
					</ul>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<button type="button" class="btn btn-danger btn-primary btn-lg"
						aria-label="Left Align" onclick="nameSpace.deleteItems()"
						id="deleteBtn" disabled="true">
						<span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>
					</button>
					<button type="button" class="btn btn-info btn-primary btn-lg"
						aria-label="Left Align" id="updataBtn" disabled="true"
						onclick="nameSpace.updataItems()">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true">修改</span>
					</button>
				</div>
			</div>
		</div>
		<input type="text" name="pn" id="pnHiden" style="display: none;">
		<input type="text" name="deleteList" id="deleteHiden"
			style="display: none;"> <input type="hidden" id="pageContext"
			value="${APP_PATH }">
	</form>
	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工修改</h4>
				</div>
				<div class="modal-body">
					<form id="updataForm" method="post" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">员工ID</label>
							<div class="col-sm-10">
								<input type="text" name="empId" class="form-control"
									id="empID_update_static" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">员工姓名</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_update_input">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" name="email" class="form-control"
									id="email_update_input" placeholder="email@atguigu.com">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="dId" id="depSelectId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn"
						onclick="nameSpace.updataEmp()">更新</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>