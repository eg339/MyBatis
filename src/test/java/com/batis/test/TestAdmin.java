package com.batis.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.batis.po.Admin;
import com.batis.service.AdminService;
import com.batis.utils.DateUtils;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:configs/spring-mybatis.xml" })
public class TestAdmin implements BaseTest {

	// private ClassPathXmlApplicationContext context;
	@Autowired
	private AdminService adminService;

	// @Before
	// public void init() {
	// PropertyPlaceholderConfigurer cfg = new PropertyPlaceholderConfigurer();
	// cfg.setLocation(new FileSystemResource("configs/test.properties"));
	// context = new
	// ClassPathXmlApplicationContext("configs/spring-mybatis.xml");
	// adminService = (AdminServer) context.getBean("adminService");
	// }
	//
	// @After
	// public void destroy() {
	// if (context != null)
	// context.close();
	// }

	@Test
	public void save() {
		Admin admin = new Admin();
		// admin.setId(3);
		admin.setLoginName("11");
		admin.setUserName("22");
		admin.setPassword("33");
		admin.setStatus("4");
		admin.setCreateTime(new Date());
		adminService.save(admin);

		System.out.println(admin.getId());
	}

	@Test
	public void update() {
		Admin admin = adminService.get("39");
		admin.setLoginName("abcd");
		this.adminService.update(admin);
	}

	@Test
	public void delete() {
		this.adminService.delete("54");
	}

	@Test
	public void get() {
		Admin admin = adminService.get("1");
		System.out.println(admin);
	}

	/**
	 * 分页查询
	 */
	@Test
	public void pagingQuery() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginName", "zhangshu");
		params.put("userName", "%张%");
		adminService.listGrid(params, 0, 10);
		adminService.getCountByParams(params);
	}

	@Test
	public void findByParams() {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("loginName", "zhangshu");
		params.put("userName", "%张%");
		List<Admin> list = (List<Admin>) this.adminService.findList(params);
		System.out.println(DateUtils.formatFull14StyleByDate(list.get(0).getCreateTime()));
		System.out.println(list.size());
	}

	@Test
	public void transaction() {
	}
}
