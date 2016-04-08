package com.batis.service;

import java.util.List;

import com.batis.dao.BaseDAO;

/**
 * BaseService接口
 * 
 * @author eg366
 *
 */
public interface BaseService<T, PK> {

	BaseDAO<T, PK> getDAO();
	
	/**
	 * 根据PK查询对象
	 */
	T get(PK id);

	/**
	 * 保存对象
	 */
	void save(T obj);

	/**
	 * 更新对象
	 */
	void update(T obj);

	/**
	 * 根据PK删除对象
	 */
	void delete(PK pk);

	/**
	 * 批量删除对象
	 */
	void batchDel(List<PK> pks);

}
