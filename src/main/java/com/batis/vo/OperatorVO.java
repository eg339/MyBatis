package com.batis.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 操作员VO对象
 * 
 * @author eg366
 *
 */
public class OperatorVO implements Serializable {

	private static final long serialVersionUID = -337376914731758080L;

	/* 01-管理员;02-普通用户 */
	private String userType;
	/* 普通用户角色; 01- 卡测试人员;02- 卡应用测试人员;03-研究院测试用户 */
	private String userRole;
	private Integer id;
	/* 用户名称 */
	private String userName;
	/* 登录名称 */
	private String loginName;
	private String password;
	private String createDate;
	private String lastLoginDate;
	private String status;
	private String statusStr;
	private String headPicPath;
	/**
	 * 一个帐号对应多种角色
	 * */
	private List<Integer> roles;

	public OperatorVO() {
		super();
	}

	public OperatorVO(String userType, Integer id) {
		super();
		this.userType = userType;
		this.id = id;
	}

	public OperatorVO(String userName, String loginName, String password, String createDate, String status) {
		super();
		this.userName = userName;
		this.loginName = loginName;
		this.password = password;
		this.createDate = createDate;
		this.status = status;
	}

	public OperatorVO(String userName, String loginName) {
		super();
		this.userName = userName;
		this.loginName = loginName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusStr() {
		return statusStr;
	}

	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}

	public String getHeadPicPath() {
		return headPicPath;
	}

	public void setHeadPicPath(String headPicPath) {
		this.headPicPath = headPicPath;
	}

	public List<Integer> getRoles() {
		return roles;
	}

	public void setRoles(List<Integer> roles) {
		this.roles = roles;
	}

}
