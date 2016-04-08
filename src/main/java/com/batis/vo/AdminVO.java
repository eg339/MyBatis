/**
 * 
 */
package com.batis.vo;

import java.io.Serializable;

/**
 * @author zqx
 *
 */
public class AdminVO extends BaseGridVO implements Serializable {

	private static final long serialVersionUID = 3279961465794098689L;

	private String id;
	/* 用户名称 */
	private String userName;
	/* 登录名称 */
	private String loginName;
	private String password;
	private String createTime;
	private String lastLoginTime;
	private String status;
	private String statusStr;

	public AdminVO() {
		super();
	}

	public AdminVO(String userName, String loginName) {
		super();
		this.userName = userName;
		this.loginName = loginName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
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
}
