package com.batis.service;

import java.util.List;
import java.util.Map;

import com.batis.po.Admin;
import com.batis.vo.AdminVO;

/**
 * 管理员用户Service接口
 * 
 * @author eg366
 *
 */
public interface AdminService extends BaseService<Admin, String> {

	int getCountByParams(Map<String, Object> params);

	List<AdminVO> listGrid(Map<String, Object> params, int startNum, int recordNum);

	List<Admin> findList(Map<String, Object> params);

	/**
	 * 添加管理员
	 */
	void add(AdminVO vo);

	/**
	 * 编辑管理员
	 */
	void edit(AdminVO vo);

}
