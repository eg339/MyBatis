/**
 * 
 */
package com.batis.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.batis.service.AdminService;
import com.batis.utils.JqGrid;
import com.batis.vo.AdminVO;

/**
 * @author zqx
 *
 */

@Controller
@RequestMapping("/admin/operator")
public class AdminOperatorController extends BaseController {
	@Autowired
	private AdminService adminService;

	/**
	 * 管理员管理列表页
	 * 
	 * @return
	 */

	@RequestMapping("/list.htm")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("admin.operator.list.def");

		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getById.htm")
	public void getById(int id){
//		Admin admin = this.adminService.getAdminById(id);
//		System.out.println(admin);
	}
	
	/**
	 * 管理员列表查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "/query.htm")
	@ResponseBody
	public JqGrid query(String userName, String loginName) {
		/* 查询条件 */
		Map<String, Object> params = new HashMap<String, Object>();
		if (StringUtils.isNotEmpty(userName))
			params.put("userName", userName);
		if (StringUtils.isNotEmpty(loginName))
			params.put("loginName", loginName);

		JqGrid jqGrid = getJqGridFromRequest();
		/* 查询用户总数量 */
		int recordNum = jqGrid.getRp();
		int count = adminService.getCountByParams(params);
		int startNum = jqGrid.init(count);
		List<AdminVO> result = adminService.listGrid(params, startNum, recordNum);
		jqGrid.setRows(result);
		jqGrid.setRecords(count);
		return jqGrid;
	}
	
	/**
	 * 添加标签
	 */
	@ResponseBody
	@RequestMapping("/add.htm")
	public JSONObject add(AdminVO vo) {
		JSONObject json = new JSONObject();
		try {
			this.adminService.add(vo);
			json.element("status", "succ");
		} catch (Exception e) {
			json.element("status", "fail");
			e.printStackTrace();
		}
		return json;
	}

	
	/**
	 * 编辑标签
	 */
	@ResponseBody
	@RequestMapping("/edit.htm")
	public JSONObject edit(AdminVO vo) {
		JSONObject json = new JSONObject();
		try {
			this.adminService.edit(vo);
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
			this.adminService.delete(id);
			jsonObject.element("status", "succ");
		} catch (Exception e) {
			jsonObject.element("status", "fail");
			e.printStackTrace();
		}
		return jsonObject;
	}

}
