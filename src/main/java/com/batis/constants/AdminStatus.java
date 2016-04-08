package com.batis.constants;

/**
 * admin状态enum
 * 
 * @author eg366
 */
public enum AdminStatus {

	NORMAL("0", "正常"), DISABLE("1", "禁用");

	public String code;
	public String desc;

	private AdminStatus(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	@Override
	public String toString() {
		return desc;
	}

	public static String get(String code) {
		if ("0".equals(code))
			return "正常";
		else if ("1".equals(code))
			return "禁用";
		return "-";
	}
}
