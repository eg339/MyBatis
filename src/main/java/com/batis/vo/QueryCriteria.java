/**
 * 
 */
package com.batis.vo;

import java.util.Map;

/**
 * 查询对象
 * 
 * @author zqx
 *
 */
public class QueryCriteria {
	/* 查询条件集合 */
	private Map<String, Object> queryParam;
	/* 排序字段 */
	private String sort;
	/* 排序规则 */
	private String order;

	public QueryCriteria(Map<String, Object> queryParam) {
		super();
		this.queryParam = queryParam;
	}

	public QueryCriteria(Map<String, Object> queryParam, String sort, String order) {
		super();
		this.queryParam = queryParam;
		this.sort = sort;
		this.order = order;
	}

	public Map<String, Object> getQueryParam() {
		return queryParam;
	}

	public void setQueryParam(Map<String, Object> queryParam) {
		this.queryParam = queryParam;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}
