/**
 * 
 */
package com.batis.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batis.constants.enums.Gender;
import com.batis.constants.enums.METype;
import com.batis.constants.enums.RangeAge;
import com.batis.constants.enums.RangePhonePlan;
import com.batis.dao.BaseDAO;
import com.batis.dao.TagInfoDAO;
import com.batis.po.TagInfo;
import com.batis.service.TagInfoService;
import com.batis.utils.DateUtils;
import com.batis.utils.StringUtils;
import com.batis.vo.QueryCriteria;
import com.batis.vo.TagInfoVO;

/**
 * 标签信息Service实现
 * 
 * @author zqx
 *
 */
@Service("tagInfoService")
public class TagInfoServiceImpl extends BaseServiceImpl<TagInfo, String> implements TagInfoService {
	@Autowired
	private TagInfoDAO tagInfoDAO;
//	@Autowired
//	private BusinessDistrictDAO businessDistrictDAO;

	@Override
	public BaseDAO<TagInfo, String> getDAO() {
		return this.tagInfoDAO;
	}

	@Override
	public int getCountByParams(Map<String, Object> params) {
		return this.tagInfoDAO.pagingCount(params);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TagInfoVO> listGrid(Map<String, Object> params, int startNum, int recordNum) {
		List<TagInfo> list = (List<TagInfo>) this.tagInfoDAO.pagingList(
				new QueryCriteria(params, "lastUpdTime", "desc"), startNum, recordNum);
		List<TagInfoVO> voList = baildVOList(list);
		return voList;
	}

	/**
	 * 构建VOList集合
	 */
	private List<TagInfoVO> baildVOList(List<TagInfo> list) {
		List<TagInfoVO> voList = new ArrayList<TagInfoVO>();
		for (TagInfo tag : list) {
			TagInfoVO vo = new TagInfoVO();
			BeanUtils.copyProperties(tag, vo);
			/* 根据枚举类格式化范围字段 */
			vo.setAgeRangesVal(RangeAge.getDescsByCodes(tag.getAgeRanges()));
			vo.setGenderRangesVal(Gender.getDescsByCodes(tag.getGenderRanges()));
			vo.setPhonePlanRangesVal(RangePhonePlan.getDescsByCodes(tag.getPhonePlanRanges()));
			vo.setMeTypeRangesVal(METype.getDescsByCodes(tag.getMeTypeRanges()));
			/* 活跃商圈范围 */
//			vo.setBusinessDistricts(this.businessDistrictDAO.getBusinessNamesByIDs(vo.getBusinessDistricts()));
			vo.setCreateTime(DateUtils.formatFull14StyleByDate(tag.getCreateTime()));
			vo.setLastUpdTime(DateUtils.formatFull14StyleByDate(tag.getLastUpdTime()));
			voList.add(vo);
		}
		return voList;
	}

	/**
	 * 添加标签信息
	 */
	@Override
	public void addTag(TagInfoVO vo) {
		TagInfo tagInfo = new TagInfo();
		tagInfo.setName(vo.getName());
		tagInfo.setBusinessDistricts(vo.getBusinessDistricts());
		/* join方法把字符数据转成字符串，用逗号分隔 */
		tagInfo.setAgeRanges(StringUtils.join(vo.getAgeRanges(), ","));
		tagInfo.setGenderRanges(StringUtils.join(vo.getGenderRanges(), ","));
		tagInfo.setPhonePlanRanges(StringUtils.join(vo.getPhonePlanRanges(), ","));
		tagInfo.setMeTypeRanges(StringUtils.join(vo.getMeTypeRanges(), ","));
		tagInfo.setDescription(vo.getDescription());
		tagInfo.setCreateTime(new Date());
		tagInfo.setLastUpdTime(new Date());
		this.tagInfoDAO.save(tagInfo);
	}

	/**
	 * 根据标签ID查询标签信息
	 */
	@Override
	public TagInfoVO getTagInfo(String id) {
		TagInfo tag = this.tagInfoDAO.get(id);
		TagInfoVO vo = new TagInfoVO();
		vo.setId(tag.getId());
		vo.setName(tag.getName());
		vo.setBusinessDistricts(tag.getBusinessDistricts());
		vo.setAgeRangesCode(tag.getAgeRanges());
		vo.setGenderRangesCode(tag.getGenderRanges());
		vo.setPhonePlanRangesCode(tag.getPhonePlanRanges());
		vo.setMeTypeRangesCode(tag.getMeTypeRanges());
		vo.setDescription(tag.getDescription());
		return vo;
	}

	/**
	 * 编辑标签信息
	 */
	@Override
	public void editTag(TagInfoVO vo) {
		TagInfo tag = this.tagInfoDAO.get(vo.getId());
		tag.setName(vo.getName());
		tag.setBusinessDistricts(vo.getBusinessDistricts());
		tag.setAgeRanges(StringUtils.join(vo.getAgeRanges(),","));
		tag.setGenderRanges(StringUtils.join(vo.getGenderRanges(),","));
		tag.setPhonePlanRanges(StringUtils.join(vo.getPhonePlanRanges(), ","));
		tag.setMeTypeRanges(StringUtils.join(vo.getMeTypeRanges(), ","));
		tag.setDescription(vo.getDescription());
		tag.setLastUpdTime(new Date());
		this.tagInfoDAO.update(tag);
	}
}
