package com.batis.constants.enums;

import com.batis.utils.StringUtils;

/**
 * 电话套餐档位范围
 * 
 * @author eg366
 *
 */
public enum RangePhonePlan {
	_46_TO_66("01", 46, 66, "46-66"), _96_TO_156("02", 96, 156, "96-156"), _186_TO_256("03", 186, 256, "186-256"), _286_TO_UPPER(
			"04", 286, 1000, "286以上");

	public String code;
	public int min;
	public int max;
	public String desc;

	private RangePhonePlan(String code, int min, int max, String desc) {
		this.code = code;
		this.min = min;
		this.max = max;
		this.desc = desc;
	}

	/**
	 * 根据档位码集合获取档位描述集合
	 */
	public static String getDescsByCodes(String phonePlanRanges) {
		String descs = "";
		if (StringUtils.isNotEmpty(phonePlanRanges))
			for (RangePhonePlan rangePhonePlan : values()) {
				if (phonePlanRanges.contains(rangePhonePlan.code)) {
					if (StringUtils.isNotEmpty(descs))
						descs += "," + rangePhonePlan.desc;
					else
						descs += rangePhonePlan.desc;
				}
			}
		return descs;
	}

	public static RangePhonePlan getByCode(String code) {
		for (RangePhonePlan status : values()) {
			if (status.code.equals(code))
				return status;
		}
		return null;
	}
}
