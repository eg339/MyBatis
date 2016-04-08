package com.batis.service.impl;

import java.util.List;

import com.batis.service.BaseService;

/**
 * BaseService实现
 * 
 * @author eg366
 */
public abstract class BaseServiceImpl<T, PK> implements BaseService<T, PK> {

	@Override
	public T get(PK pk) {
		return this.getDAO().get(pk);
	}

	@Override
	public void save(T obj) {
		this.getDAO().save(obj);
	}

	@Override
	public void update(T obj) {
		this.getDAO().update(obj);
	}

	@Override
	public void delete(PK pk) {
		this.getDAO().delete(pk);
	}

	@Override
	public void batchDel(List<PK> list) {
		this.getDAO().batchDel(list);
	}

}
