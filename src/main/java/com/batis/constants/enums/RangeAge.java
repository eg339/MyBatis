package com.batis.constants.enums;

import com.batis.utils.StringUtils;

/**
 * 年龄段
 * 
 * @author eg366
 *
 */
public enum RangeAge {

	_5_TO_10("01", 5, 10, "5-10"), _10_TO_20("02", 10, 20, "10-20"), _20_TO_30("03", 20, 30, "20-30"), _30_TO_40("04",
			30, 40, "30-40"), _40_TO_50("05", 40, 50, "40-50"), _60_TO_UPPER("06", 50, 100, "50以上");

	public String code;
	public int min;
	public int max;
	public String desc;

	private RangeAge(String code, int min, int max, String desc) {
		this.code = code;
		this.min = min;
		this.max = max;
		this.desc = desc;
	}

	/**
	 * 根据根据编码集合获取描述集合
	 */
	public static String getDescsByCodes(String ageRanges) {
		String descs = "";
		for (RangeAge rangeAge : values()) {
			if (ageRanges.contains(rangeAge.code)) {
				if (StringUtils.isNotEmpty(descs))
					descs += "," + rangeAge.desc;
				else
					descs += rangeAge.desc;
			}
		}
		return descs;
	}
	/**
	 * 根据编码获取
	 */
	public static RangeAge getByCode(String code) {
		for (RangeAge status : values()) {
			if (status.code.equals(code))
				return status;
		}
		return null;
	}
}
