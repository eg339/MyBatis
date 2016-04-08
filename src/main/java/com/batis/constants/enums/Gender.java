package com.batis.constants.enums;

import com.batis.utils.StringUtils;

/**
 * 性别
 * 
 * @author eg366
 *
 */
public enum Gender {

	MALE("00", "男"), FEMALE("01", "女");

	public String code;
	public String desc;

	private Gender(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public static Gender getByCode(String code) {
		for (Gender status : values()) {
			if (status.code.equals(code))
				return status;
		}
		return null;
	}

	/**
	 * 根据性别码集合获取性别描述集合
	 */
	public static String getDescsByCodes(String genderRanges) {
		String descs = "";
		for (Gender gender : values()) {
			if (genderRanges.contains(gender.code)) {
				if (StringUtils.isNotEmpty(descs))
					descs += "," + gender.desc;
				else
					descs += gender.desc;
			}
		}
		return descs;
	}
}
