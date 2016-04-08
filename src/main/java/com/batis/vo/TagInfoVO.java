/**
 * 
 */
package com.batis.vo;

/**
 * 标签管理
 * 
 * @author zqx
 *
 */
public class TagInfoVO extends BaseGridVO {
	/* 主键 */
	private String id;
	/* 标签名称 */
	private String name;
	/* 商圈集合 */
	private String businessDistricts;
	/* 年龄段集合 */
	private String[] ageRanges;
	/*数据库保存的年龄码集合字符串*/
	private String ageRangesCode;
	/*年龄描述集合字符串*/
	private String ageRangesVal;
	/* 性别集合 */
	private String[] genderRanges;
	/*数据库保存的性别码集合字符串*/
	private String genderRangesCode;
	/*性别描述集合字符串*/
	private String genderRangesVal;
	/* 套餐档位集合 */
	private String[] phonePlanRanges;
	/*数据库保存的套餐码集合字符串*/
	private String phonePlanRangesCode;
	/*套餐档位描述集合字符串*/
	private String phonePlanRangesVal;
	/* 终端类型集合 */
	private String[] meTypeRanges;
	/*数据库保存的终端类型码集合字符串*/
	private String meTypeRangesCode;
	/*终端类型描述集合字符串*/
	private String meTypeRangesVal;
	/* 标签描述 */
	private String description;
	/* 创建时间 */
	private String createTime;
	/* 最后更新时间 */
	private String lastUpdTime;

	public TagInfoVO() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBusinessDistricts() {
		return businessDistricts;
	}

	public void setBusinessDistricts(String businessDistricts) {
		this.businessDistricts = businessDistricts;
	}

	public String[] getAgeRanges() {
		return ageRanges;
	}

	public void setAgeRanges(String[] ageRanges) {
		this.ageRanges = ageRanges;
	}

	public String getAgeRangesVal() {
		return ageRangesVal;
	}

	public void setAgeRangesVal(String ageRangesVal) {
		this.ageRangesVal = ageRangesVal;
	}

	public String[] getGenderRanges() {
		return genderRanges;
	}

	public void setGenderRanges(String[] genderRanges) {
		this.genderRanges = genderRanges;
	}

	public String getGenderRangesVal() {
		return genderRangesVal;
	}

	public void setGenderRangesVal(String genderRangesVal) {
		this.genderRangesVal = genderRangesVal;
	}

	public String[] getPhonePlanRanges() {
		return phonePlanRanges;
	}

	public void setPhonePlanRanges(String[] phonePlanRanges) {
		this.phonePlanRanges = phonePlanRanges;
	}

	public String getPhonePlanRangesVal() {
		return phonePlanRangesVal;
	}

	public void setPhonePlanRangesVal(String phonePlanRangesVal) {
		this.phonePlanRangesVal = phonePlanRangesVal;
	}

	public String[] getMeTypeRanges() {
		return meTypeRanges;
	}

	public void setMeTypeRanges(String[] meTypeRanges) {
		this.meTypeRanges = meTypeRanges;
	}

	public String getMeTypeRangesVal() {
		return meTypeRangesVal;
	}

	public void setMeTypeRangesVal(String meTypeRangesVal) {
		this.meTypeRangesVal = meTypeRangesVal;
	}

	public String getAgeRangesCode() {
		return ageRangesCode;
	}

	public void setAgeRangesCode(String ageRangesCode) {
		this.ageRangesCode = ageRangesCode;
	}

	public String getGenderRangesCode() {
		return genderRangesCode;
	}

	public void setGenderRangesCode(String genderRangesCode) {
		this.genderRangesCode = genderRangesCode;
	}

	public String getPhonePlanRangesCode() {
		return phonePlanRangesCode;
	}

	public void setPhonePlanRangesCode(String phonePlanRangesCode) {
		this.phonePlanRangesCode = phonePlanRangesCode;
	}

	public String getMeTypeRangesCode() {
		return meTypeRangesCode;
	}

	public void setMeTypeRangesCode(String meTypeRangesCode) {
		this.meTypeRangesCode = meTypeRangesCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getLastUpdTime() {
		return lastUpdTime;
	}

	public void setLastUpdTime(String lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}

}
