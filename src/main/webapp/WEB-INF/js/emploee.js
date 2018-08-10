/**
 * 
 */
var AIR = new Object();
AIR.emploee = new Object();
nameSpace = AIR.emploee;
AIR.emploee.select = function() {

	var METHODNAME = "AIR.emploee.select";
	var label = 0;
	try {
		nameSpace.formSubmit("/getEmp");

	} catch (err) {
		alert(err);
	}

};
AIR.emploee.toPage = function(item) {

	var METHODNAME = "AIR.emploee.toPage";
	var label = 0;
	try {
		document.getElementById("pnHiden").value = item.id;
		nameSpace.formSubmit("/getEmp");

	} catch (err) {
		alert(err);
	}
};
AIR.emploee.selectCheckAll = function(item) {

	var METHODNAME = "AIR.emploee.selectCheckAll";
	var label = 0;
	try {
		var tableObj = document.getElementById("empBody")
		if (tableObj === null) {
			return;
		}

		var rowItems = tableObj.getElementsByTagName("tr");

		for (var i = 0; i < rowItems.length; i++) {

			if (!rowItems[i].children[1].children[0].disabled) {
				rowItems[i].children[1].children[0].checked = item.checked;
			}
		}
		if (item.checked) {
			document.getElementById("deleteBtn").disabled = false;
		} else {
			document.getElementById("deleteBtn").disabled = true;

		}
	} catch (err) {
		alert(err);
	}
};
AIR.emploee.selectCheck = function(item) {

	var METHODNAME = "AIR.emploee.selectCheck";
	var label = 0;
	try {
		document.getElementById("allCheck").checked = false;
		var checkCount = 0;
		document.getElementById("updataBtn").disabled = true;
		document.getElementById("deleteBtn").disabled = true;
		var tableObj = document.getElementById("empBody")

		var rowItems = tableObj.getElementsByTagName("tr");
		for (var i = 0; i < rowItems.length; i++) {

			if (rowItems[i].children[1].children[0].checked) {
				document.getElementById("deleteBtn").disabled = false;
				document.getElementById("updataBtn").disabled = false;
				checkCount++;
			}
			if (checkCount > 1) {
				document.getElementById("updataBtn").disabled = true;
				break;
			}
		}
	} catch (err) {
		alert(err);
	}
};

AIR.emploee.deleteItems = function() {

	var METHODNAME = "AIR.emploee.deleteItems";
	var label = 0;
	try {
		var tableObj = document.getElementById("empBody")
		if (tableObj === null) {
			return;
		}

		var rowItems = tableObj.getElementsByTagName("tr");
		var deleteList = "";
		for (var i = 0; i < rowItems.length; i++) {

			if (rowItems[i].children[1].children[0].checked) {
				deleteList = deleteList + ","
						+ rowItems[i].children[2].textContent;
			}
		}

		if (deleteList === "") {
			return;
		}
		document.getElementById("deleteHiden").value = deleteList;
		document.getElementById("pnHiden").value = "1";
		nameSpace.formSubmit("/deleteEmp");
	} catch (err) {
		alert(err);

	}
};
AIR.emploee.updataItems = function() {

	var METHODNAME = "AIR.emploee.UpdataItems";
	var label = 0;
	try {
		var tableObj = document.getElementById("empBody");

		var rowItems = tableObj.getElementsByTagName("tr");
		var empid;
		var empName;
		var gender;
		var email;
		var deptName;
		for (var i = 0; i < rowItems.length; i++) {

			if (rowItems[i].children[1].children[0].checked) {
				empid = rowItems[i].children[2].textContent;
				empName = rowItems[i].children[3].textContent;
				gender = rowItems[i].children[4].textContent;
				email = rowItems[i].children[5].textContent;
				deptName = rowItems[i].children[6].textContent;
				break;
			}

		}

		document.getElementById("empID_update_static").value = empid;
		document.getElementById("empName_update_input").value = empName;
		document.getElementById("email_update_input").value = email;
		if (gender === "男") {
			document.getElementById("gender1_update_input").checked = true;
		} else {
			document.getElementById("gender2_update_input").checked = true;
		}
		// 获取部门信息
		var pageContext = $("#pageContext").val();
		$.ajax({
			type : 'GET',
			url : pageContext + "/getDep",
			dataType : 'json',
			success : function(result) {
				$("#depSelectId option").remove();
				for (var i = 0; i < result.length; i++) {
					var depInfo = result[i];
					if (deptName === depInfo.deptName) {
						
						$("#depSelectId").append("<option value='" + depInfo.deptId + "' selected = selected" + ">" + depInfo.deptName + "</option>");
					} else {
						$("#depSelectId").append("<option value='" + depInfo.deptId + "'>" + depInfo.deptName + "</option>");
					}

				}

			}
		})
		$('#empUpdateModal').modal('show');
	} catch (err) {
		alert(METHODNAME + err);

	}
};

AIR.emploee.formSubmit = function(item) {

	var METHODNAME = "AIR.emploee.formSubmit";
	var label = 0;
	try {
		var pageContext = $("#pageContext").val();
		var newUrl = pageContext + item;
		$("#empForm").removeAttr("action");
		$("#empForm").attr('action', newUrl);
		$("#empForm").submit();
	} catch (err) {
		alert(err);
	}
};
AIR.emploee.updataEmp = function() {
	
	var METHODNAME = "AIR.emploee.updataEmp";
	var label = 0;
	try {
		var pageContext = $("#pageContext").val();
		var newUrl = pageContext + "/updataEmp";
		$("#updataForm").removeAttr("action");
		$("#updataForm").attr('action', newUrl);
		$("#updataForm").submit();
	} catch (err) {
		alert(METHODNAME + err);
	}
};