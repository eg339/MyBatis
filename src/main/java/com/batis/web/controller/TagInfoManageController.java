/**
 * 
 */
package com.batis.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.batis.service.TagInfoService;
import com.batis.utils.JqGrid;
import com.batis.utils.StringUtils;
import com.batis.vo.TagInfoVO;

/**
 * 标签信息管理Controller
 * 
 * @author zqx
 *
 */
@Controller
@RequestMapping("/admin/tagInfoManage")
public class TagInfoManageController extends BaseController {

	@Autowired
	private TagInfoService tagInfoService;

//	@Autowired
//	private BusinessDistrictService businessDistrictService;

	@RequestMapping("/list.htm")
	public String list() {
		return "admin.tagInfoManage.list.def";
	}

	/**
	 * 标签列表查询
	 */
	@ResponseBody
	@RequestMapping("/query.htm")
	public JqGrid query(String name) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (StringUtils.isNotEmpty(name))
			params.put("name", name);
		JqGrid jqGrid = getJqGridFromRequest();
		int recordNum = jqGrid.getRp();
		int count = this.tagInfoService.getCountByParams(params);
		int startNum = jqGrid.init(count);
		List<TagInfoVO> list = this.tagInfoService.listGrid(params, startNum, recordNum);
		jqGrid.setRows(list);
		jqGrid.setRecords(count);
		return jqGrid;
	}

//	/**
//	 * 加载商圈信息
//	 */
//	@ResponseBody
//	@RequestMapping("/loadBusinessDistricts.htm")
//	public List<Map<String, String>> loadBusinessDistricts() {
//		List<BusinessDistrict> list = this.businessDistrictService.getAllBusiness();
//		List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();
//		for (BusinessDistrict business : list) {
//			Map<String, String> data = new HashMap<String, String>();
//			data.put("id", String.valueOf(business.getId()));
//			data.put("name", business.getName());
//			listMap.add(data);
//		}
//		return listMap;
//	}

	/**
	 * 添加标签
	 */
	@ResponseBody
	@RequestMapping("/add.htm")
	public JSONObject add(TagInfoVO vo) {
		JSONObject json = new JSONObject();
		try {
			this.tagInfoService.addTag(vo);
			json.element("status", "succ");
		} catch (Exception e) {
			json.element("status", "fail");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 根据ID获取标签信息
	 */
	@ResponseBody
	@RequestMapping("/getTagInfo.htm")
	public TagInfoVO getTagInfo(String id) {
		TagInfoVO vo = this.tagInfoService.getTagInfo(id);
		return vo;
	}

	/**
	 * 编辑标签
	 */
	@ResponseBody
	@RequestMapping("/edit.htm")
	public JSONObject edit(TagInfoVO vo) {
		JSONObject json = new JSONObject();
		try {
			this.tagInfoService.editTag(vo);
			json.element("status", "succ");
		} catch (Exception e) {
			json.element("status", "fail");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 删除标签
	 */
	@ResponseBody
	@RequestMapping("/delete.htm")
	public JSONObject delete(String id) {
		JSONObject jsonObject = new JSONObject();
		try {
			this.tagInfoService.delete(id);
			jsonObject.element("status", "succ");
		} catch (Exception e) {
			jsonObject.element("status", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}

}
