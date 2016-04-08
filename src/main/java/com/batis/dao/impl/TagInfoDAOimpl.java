/**
 * 
 */
package com.batis.dao.impl;

import org.springframework.stereotype.Repository;

import com.batis.dao.TagInfoDAO;
import com.batis.po.TagInfo;

/**
 * 标签管理DAO实现
 * 
 * @author zqx
 *
 */
@Repository("tagInfoDAO")
public class TagInfoDAOimpl extends BaseDAOImpl<TagInfo, String> implements TagInfoDAO {

}
