package com.batis.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.batis.dao.AdminDAO;
import com.batis.dao.BaseDAO;
import com.batis.po.Admin;
import com.batis.service.AdminService;
import com.batis.vo.AdminVO;
import com.batis.vo.QueryCriteria;

/**
 * 管理员用户Service实现
 * 
 * @author zqx
 *
 */
@Service("adminService")
public class AdminServiceImpl extends BaseServiceImpl<Admin, String> implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public BaseDAO<Admin, String> getDAO() {
		return adminDAO;
	}

	private List<AdminVO> buildVOList(List<Admin> poList) {
		List<AdminVO> voList = new ArrayList<AdminVO>();
		for (Admin po : poList) {
			AdminVO vo = new AdminVO();
			BeanUtils.copyProperties(po, vo);
			voList.add(vo);
		}
		return voList;
	}

	@Override
	public int getCountByParams(Map<String, Object> params) {
		return this.adminDAO.pagingCount(params);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<AdminVO> listGrid(Map<String, Object> params, int startNum, int recordNum) {
		List<Admin> poList = (List<Admin>) this.adminDAO.pagingList(new QueryCriteria(params, "createDate", "desc"),
				startNum, recordNum);
		return buildVOList(poList);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Admin> findList(Map<String, Object> params) {
		return (List<Admin>) this.adminDAO.findListByParams("findList", params);
	}

	/**
	 * 添加管理员
	 */
	@Override
	public void add(AdminVO vo) {
		Admin admin = new Admin();
		admin.setLoginName(vo.getLoginName());
		admin.setUserName(vo.getUserName());
		admin.setPassword(vo.getPassword());
		admin.setCreateTime(new Date());
		admin.setLastLoginTime(new Date());
		this.adminDAO.save(admin);

	}

	/**
	 * 编辑管理员
	 */
	@Override
	public void edit(AdminVO vo) {
		Admin admin = this.adminDAO.get(vo.getId());
		admin.setUserName(vo.getUserName());
		admin.setPassword(vo.getPassword());
		admin.setStatus(vo.getStatus());
		admin.setLoginName(vo.getLastLoginTime());
		this.adminDAO.update(admin);
	}

}
