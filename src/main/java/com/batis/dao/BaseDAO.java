/**
 * 
 */
package com.batis.dao;

import java.util.List;
import java.util.Map;

import com.batis.vo.QueryCriteria;

/**
 * @author zqx
 *
 */
public interface BaseDAO<T, PK> {
	/**
	 * 根据主键查询对象
	 */
	T get(PK pk);

	/**
	 * 保存对象
	 */
	void save(T obj);

	/**
	 * 更新对象
	 */
	void update(T obj);

	/**
	 * 根据主键删除对象
	 */
	void delete(PK pk);

	/**
	 * 根据ID的集合批量删除
	 */
	void batchDel(List<PK> pks);

	/**
	 * 分页查询总条数
	 */
	int pagingCount(Map<String, Object> params);

	/**
	 * 普通分页查询列表
	 */
	List<?> pagingList(Map<String, Object> params, int begin, int count);

	/**
	 * 带排序功能的分页查询列表
	 */
	List<?> pagingList(QueryCriteria criteria, int begin, int count);

	/**
	 * 根据参数更新
	 */
	void update(String sqlID, Map<String, Object> params);

	/**
	 * 查询数据总条数
	 */
	Integer findCount(String sqlID, Map<String, Object> params);

	List<?> findList(Map<String, Object> params);

	/**
	 * 根据查询条件查询分页列表数据
	 */
	List<?> findListByParams(String sqlID, Map<String, Object> params, int begin, int count);

	/**
	 * 根据查询对象查询分页列表数据
	 */
	List<?> findListByCriteria(String sqlID, QueryCriteria criteria, int begin, int count);

	/**
	 * 根据查询条件查询列表数据
	 */
	List<?> findListByParams(String sqlID, Map<String, Object> params);

	/**
	 * 根据查询对象查询列表数据
	 */
	List<?> findListByCriteria(String sqlID, QueryCriteria criteria);

	// /**
	// * 新增实体
	// *
	// * @param entity
	// * @return 影响记录条数
	// */
	// public abstract int insert(T entity);
	//
	// /**
	// * 修改符合条件的记录
	// * <p>
	// * 此方法特别适合于一次性把多条记录的某些字段值设置为新值（定值）的情况，比如修改符合条件的记录的状态字段
	// * </p>
	// * <p>
	// * 此方法的另一个用途是把一条记录的个别字段的值修改为新值（定值），此时要把条件设置为该记录的主键
	// * </p>
	// *
	// * @param param
	// * 用于产生SQL的参数值，包括WHERE条件、目标字段和新值等
	// * @return 修改的记录个数，用于判断修改是否成功
	// */
	// public abstract int updateParam(Map param);
	//
	// /**
	// * 删除符合条件的记录
	// * <p>
	// * <strong>此方法一定要慎用，如果条件设置不当，可能会删除有用的记录！</strong>
	// * </p>
	// *
	// * @param param
	// * 用于产生SQL的参数值，包括WHERE条件（其他参数内容不起作用）
	// * @return
	// */
	// public abstract int deleteParam(Map param);
	//
	// /**
	// * 清空表，比delete具有更高的效率，而且是从数据库中物理删除（delete是逻辑删除，被删除的记录依然占有空间）
	// * <p>
	// * <strong>此方法一定要慎用！</strong>
	// * </p>
	// *
	// * @return
	// */
	// public abstract int truncate();
	//
	// /**
	// * 查询整表总记录数
	// *
	// * @return 整表总记录数
	// */
	// public abstract int count();
	//
	// /**
	// * 查询符合条件的记录数
	// *
	// * @param param
	// * 查询条件参数，包括WHERE条件（其他参数内容不起作用）。此参数设置为null，则相当于count()
	// * @return
	// */
	// public abstract int count(Object param);
	//
	// /**
	// * 取全部记录
	// *
	// * @return 全部记录实体对象的List
	// */
	// public abstract List<T> select();
	//
	// /**
	// * 按条件查询记录
	// *
	// * @param param
	// * 查询条件参数，包括WHERE条件、分页条件、排序条件
	// * @return 符合条件记录的实体对象的List
	// */
	// public abstract List<T> selectParam(Map param);
	//
	// /**
	// * 按条件查询记录，并处理成分页结果
	// *
	// * @param param
	// * 查询条件参数，包括WHERE条件、分页条件、排序条件
	// * @return PaginationResult对象，包括（符合条件的）总记录数、页实体对象List等
	// */
	// public abstract PagingResult<T> selectPagination(PageEntity param);
	//
	// /**
	// * 批量插入
	// *
	// * @param list
	// */
	// public abstract int insertBatch(final List<T> list);
	//
	// /**
	// * 批量修改
	// *
	// * @param list
	// */
	// public abstract int updateBatch(final List<T> list);
	//
	// /**
	// * 批量删除
	// *
	// * @param list
	// */
	// public abstract int deleteBatch(final List<PK> list);

}
