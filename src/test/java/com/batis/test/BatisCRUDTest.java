/**
 * 
 */
package com.batis.test;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.batis.po.Admin;

/**
 * 测试类
 * 
 * @author zqx
 *
 */
public class BatisCRUDTest {
	public static void main(String[] args) throws IOException {
//		insert();
		getByID(1);
		//update();
//		delete();
	}

	/**
	 * 获取SqlSession
	 * 
	 */
	public static SqlSession getSqlSession(String resource) throws IOException {
		// mybatis配置文件，如果把src/main/resources加入到classpath，并且配置文件放到src/main/resources目录下，则参数为mybatis-config.xml
		resource = "mybatis-config.xml";
		// 使用MyBatis提供的Resources类加载mybatis的配置文件（也加载关联的映射文件）
		Reader reader = Resources.getResourceAsReader(resource);
		// 构建sqlSession的工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		// 构建能执行映射文件中sql语句的sqlSession
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}

	/**
	 * 根据ID查询管理员
	 */
	public static Admin getByID(int id) throws IOException {
		// mybatis配置文件，如果把src/main/resources加入到classpath，并且配置文件放到src/main/resources目录下，则参数为mybatis-config.xml
		String resource = "mybatis-config.xml";
		//获取SqlSession
		SqlSession sqlSession = getSqlSession(resource);
		/*
		 * 映射sql的标识字符串，data.mapping.adminMapper.getAdmin中的data.mapping.
		 * adminMapper是adminMapper文件中的mapper标签的namespace属性的值
		 * getAdmin是select标签的id属性值，通过select标签的id属性值就可以找到要执行的SQL
		 */
		String statement = "data.mapping.adminMapper.getAdminByID";
		Admin admin = sqlSession.selectOne(statement, id);
		System.out.println(admin);
		return admin;
	}

	/**
	 * 添加管理员
	 * 
	 */
	public static void insert() throws IOException {
		// mybatis配置文件，如果把src/main/resources加入到classpath，并且配置文件放到src/main/resources目录下，则参数为mybatis-config.xml
		String resource = "mybatis-config.xml";
		//获取SqlSession
		SqlSession sqlSession = getSqlSession(resource);
		/*
		 * 映射sql的标识字符串，data.mapping.adminMapper.getAdmin中的data.mapping.
		 * adminMapper是adminMapper文件中的mapper标签的namespace属性的值
		 * getAdmin是select标签的id属性值，通过select标签的id属性值就可以找到要执行的SQL
		 */
		String statement = "data.mapping.adminMapper.addAdmin";
		Admin admin = new Admin();
		admin.setLoginName("zhangshu");
		admin.setUserName("zhangshu");
		admin.setPassword("zhangshu");
		admin.setStatus("1");
		int row = sqlSession.insert(statement, admin);
		// 手动提交事务
		sqlSession.commit();
		// 使用sqlSession执行完SQL语句之后需要关闭SqlSession
		sqlSession.close();
		System.out.println(row);
	}

	/**
	 * 更新管理员
	 */
	public static void update() throws IOException {
		// mybatis配置文件，如果把src/main/resources加入到classpath，并且配置文件放到src/main/resources目录下，则参数为mybatis-config.xml
		String resource = "mybatis-config.xml";
		//获取SqlSession
		SqlSession sqlSession = getSqlSession(resource);
		/*
		 * 映射sql的标识字符串，data.mapping.adminMapper.getAdmin中的data.mapping.
		 * adminMapper是adminMapper文件中的mapper标签的namespace属性的值
		 * getAdmin是select标签的id属性值，通过select标签的id属性值就可以找到要执行的SQL
		 */
		String statement = "data.mapping.adminMapper.updateAdmin";
		Admin admin = getByID(100);
		admin.setLoginName("zhangqingxiang");
		admin.setUserName("zhangqingxiang");
		int result = sqlSession.update(statement, admin);
		sqlSession.commit();
		sqlSession.close();
		System.out.println(result);
	}

	/**
	 * 删除管理员
	 */
	public static void delete() throws IOException {
		// mybatis配置文件，如果把src/main/resources加入到classpath，并且配置文件放到src/main/resources目录下，则参数为mybatis-config.xml
		String resource = "mybatis-config.xml";
		//获取SqlSession
		SqlSession sqlSession = getSqlSession(resource);
		/*
		 * 映射sql的标识字符串，data.mapping.adminMapper.getAdmin中的data.mapping.
		 * adminMapper是adminMapper文件中的mapper标签的namespace属性的值
		 * getAdmin是select标签的id属性值，通过select标签的id属性值就可以找到要执行的SQL
		 */
		String statement = "data.mapping.adminMapper.deleteAdmin";
		int result = sqlSession.delete(statement, 100);
		sqlSession.commit();
		sqlSession.close();
		System.out.println(result);
	}
}
