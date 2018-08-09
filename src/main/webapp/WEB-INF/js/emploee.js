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