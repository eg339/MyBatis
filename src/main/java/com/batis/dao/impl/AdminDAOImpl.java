package com.batis.dao.impl;

import org.springframework.stereotype.Repository;

import com.batis.dao.AdminDAO;
import com.batis.po.Admin;

@Repository("adminDAO")
public class AdminDAOImpl extends BaseDAOImpl<Admin, String> implements AdminDAO {

	// @Override
	// public void addAdmin(Admin admin) {
	//
	// }
	//
	// @Override
	// public Admin get(long i) {
	// return null;
	// }
	//
	// @Override
	// public List<Admin> findByParams(Map<String, Object> params) {
	// // return
	// this.getSqlSession().selectList("com.wr.push.dao.AdminDAO.findByParams",
	// params);
	// RowBounds rb = new RowBounds(0, 10);
	// return
	// this.getSqlSession().selectList("com.wr.push.dao.AdminDAO.findByParams",
	// params, rb);
	// }
	//
	// @Override
	// public void updateAdmin(Admin admin) {
	//
	// }
	//
	// @Override
	// public void deleteByID(int id) {
	//
	// }

}
