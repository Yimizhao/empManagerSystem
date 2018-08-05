package com.ems.Utils;

import org.apache.commons.lang3.StringUtils;

public class IntegerUtils {

	public static Integer toInteger(String s) {
		return StringUtils.isBlank(s) ? 0 : Integer.valueOf(s);
	}

}
