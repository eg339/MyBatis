package com.batis.constants.enums;

import com.batis.utils.StringUtils;

/**
 * 终端类型
 * 
 * @author eg366
 *
 */
public enum METype {

	NORMAL("00", "普通终端"), SPECIAL("01", "特殊终端");

	public String code;
	public String desc;

	private METype(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public static METype getByCode(String code) {
		for (METype status : values()) {
			if (status.code.equals(code))
				return status;
		}
		return null;
	}

	/**
	 * 根据终端类型码集合获取终端类型描述集合
	 */
	public static String getDescsByCodes(String meTypeRanges) {
		String descs = "";
		for (METype meType : values()) {
			if (meTypeRanges.contains(meType.code)) {
				if (StringUtils.isNotEmpty(descs))
					descs += "," + meType.desc;
				else
					descs += meType.desc;
			}
		}
		return descs;
	}
}
