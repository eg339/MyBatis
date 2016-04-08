/**
 * 
 */
package com.batis.po;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 标签管理
 * 
 * @author zqx
 *
 */
@Alias("tagInfo")
public class TagInfo {
	/* 主键 */
	private String id;
	/* 标签名称 */
	private String name;
	/* 商圈集合 */
	private String businessDistricts;
	/* 年龄段集合 */
	private String ageRanges;
	/* 性别集合 */
	private String genderRanges;
	/* 套餐档位集合 */
	private String phonePlanRanges;
	/* 终端类型集合 */
	private String meTypeRanges;
	/* 标签描述 */
	private String description;
	/* 创建时间 */
	private Date createTime;
	/* 最后更新时间 */
	private Date lastUpdTime;

	public TagInfo() {
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

	public String getAgeRanges() {
		return ageRanges;
	}

	public void setAgeRanges(String ageRanges) {
		this.ageRanges = ageRanges;
	}

	public String getGenderRanges() {
		return genderRanges;
	}

	public void setGenderRanges(String genderRanges) {
		this.genderRanges = genderRanges;
	}

	public String getPhonePlanRanges() {
		return phonePlanRanges;
	}

	public void setPhonePlanRanges(String phonePlanRanges) {
		this.phonePlanRanges = phonePlanRanges;
	}

	public String getMeTypeRanges() {
		return meTypeRanges;
	}

	public void setMeTypeRanges(String meTypeRanges) {
		this.meTypeRanges = meTypeRanges;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastUpdTime() {
		return lastUpdTime;
	}

	public void setLastUpdTime(Date lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}

}
