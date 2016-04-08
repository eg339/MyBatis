/**
 * 
 */
package com.batis.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.batis.dao.BaseDAO;
import com.batis.vo.QueryCriteria;

/**
 * @author zqx
 *
 */
public class BaseDAOImpl<T, PK extends Serializable> extends SqlSessionDaoSupport implements BaseDAO<T, PK> {
	private static final String BASE_MAPPER_PATH = "com.batis.mapping.";
	private static final String SQLID_GET = "get";
	private static final String SQLID_SAVE = "save";
	private static final String SQLID_UPDATE = "update";
	private static final String SQLID_DELETE = "delete";
	private static final String SQLID_BATCH_DELETE = "batchDel";
	private static final String SQLID_FIND_LIST = "findList";
	private static final String SQLID_PAGING_LIST = "pagingList";
	private static final String SQLID_PAGING_COUNT = "pagingCount";

	/* 持久化对象名称 */
	private String persistentObjectName;

	public BaseDAOImpl() {
		Class<?> clazz = this.getPersistentObject();
		this.persistentObjectName = clazz.getSimpleName();
	}

	/**
	 * 获取持久化对象Class信息
	 */
	private Class<?> getPersistentObject() {
		ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] actualTypes = parameterizedType.getActualTypeArguments();
		return (Class<?>) actualTypes[0];
	}

	/**
	 * 构建映射文件中SQL语句的唯一标识
	 */
	private String buildMappingStatement(String sqlID) {
		return BASE_MAPPER_PATH + this.persistentObjectName + "." + sqlID;
	}

	@Override
	public T get(PK pk) {
		return this.getSqlSession().selectOne(buildMappingStatement(SQLID_GET), pk);
	}

	@Override
	public void save(T obj) {
		this.getSqlSession().insert(buildMappingStatement(SQLID_SAVE), obj);
	}

	@Override
	public void update(T obj) {
		this.getSqlSession().update(buildMappingStatement(SQLID_UPDATE), obj);
	}

	@Override
	public void delete(PK pk) {
		this.getSqlSession().delete(buildMappingStatement(SQLID_DELETE), pk);
	}

	@Override
	public void batchDel(List<PK> pks) {
		this.getSqlSession().delete(buildMappingStatement(SQLID_BATCH_DELETE), pks);
	}
	
	@Override
	public int pagingCount(Map<String, Object> params) {
		return this.findCount(SQLID_PAGING_COUNT, params);
	}

	@Override
	public List<?> pagingList(Map<String, Object> params, int begin, int count) {
		return this.findListByParams(SQLID_PAGING_LIST, params, begin, count);
	}

	@Override
	public List<?> pagingList(QueryCriteria criteria, int begin, int count) {
		return this.findListByCriteria(SQLID_PAGING_LIST, criteria, begin, count);
	}

	@Override
	public Integer findCount(String sqlID, Map<String, Object> params) {
		Number count = this.getSqlSession().selectOne(buildMappingStatement(sqlID), params);
		return count.intValue();
	}

	@Override
	public List<?> findListByParams(String sqlID, Map<String, Object> params, int begin, int count) {
		RowBounds rowBounds = new RowBounds(begin, count);
		return this.getSqlSession().selectList(buildMappingStatement(sqlID), params, rowBounds);
	}
	
	@Override
	public List<?> findListByParams(String sqlID,Map<String, Object> params){
		return this.getSqlSession().selectList(sqlID, params);
	}

	@Override
	public List<?> findListByCriteria(String sqlID, QueryCriteria criteria, int begin, int count) {
		RowBounds rowBounds = new RowBounds(begin, count);
		return this.getSqlSession().selectList(buildMappingStatement(sqlID), criteria, rowBounds);
	}
	@Override
	public List<?> findListByCriteria(String sqlID, QueryCriteria criteria) {
		return this.getSqlSession().selectList(buildMappingStatement(sqlID), criteria);
	}

	/**
	 * 日志打印
	 * 
	 * @param sqlId
	 * @param param
	 */
	public void printLog(String sqlId, Object param) {
		Configuration configuration = getSqlSession().getConfiguration();
		// sqlId为配置文件中的sqlid
		MappedStatement mappedStatement = configuration.getMappedStatement(sqlId);
		// param为传入到sql语句中的参数
		BoundSql boundSql = mappedStatement.getBoundSql(param);
		// 得到sql语句
		String sql = boundSql.getSql().trim();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println("info-sql: " + sdf.format(new Date()) + "  " + sql);
	}

	@Override
	public List<?> findList(Map<String, Object> params) {
		return this.getSqlSession().selectList(buildMappingStatement(SQLID_FIND_LIST), params);
	}
	
	@Override
	public void update(String sqlID, Map<String, Object> params) {
		this.getSqlSession().update(buildMappingStatement(sqlID), params);
	}


}
