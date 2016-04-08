/**
 * 
 */
package com.batis.service;

import java.util.List;
import java.util.Map;

import com.batis.po.TagInfo;
import com.batis.vo.TagInfoVO;

/**
 * 标签信息Service接口
 * 
 * @author zqx
 *
 */
public interface TagInfoService extends BaseService<TagInfo, String> {

	int getCountByParams(Map<String, Object> params);

	List<TagInfoVO> listGrid(Map<String, Object> params, int startNum, int recordNum);

	/**
	 * 添加标签信息
	 */
	void addTag(TagInfoVO vo);

	/**
	 * 根据ID查询标签信息
	 */
	TagInfoVO getTagInfo(String id);

	/**
	 * 编辑标签信息
	 */
	void editTag(TagInfoVO vo);

}
