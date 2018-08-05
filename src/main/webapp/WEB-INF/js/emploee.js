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
		// var empIdFrom = $("#empIdFrom").val();
		var pageContext = $("#pageContext").val();
		var newUrl = pageContext + "/getEmp";
		$("#empForm").attr('action', newUrl);
		$("#empForm").submit();
		
	} catch (err) {

	}

};