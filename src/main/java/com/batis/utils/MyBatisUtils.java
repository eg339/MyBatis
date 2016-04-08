package com.batis.utils;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtils {
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
}
