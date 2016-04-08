package com.batis.po;

import java.util.Date;

import org.apache.ibatis.type.Alias;

/**
 * 管理员对象
 * 
 * @author zqx
 *
 */
@Alias("admin")
public class Admin {

	private String id;
	/* 登录名称 */
	private String loginName;
	private String password;
	/* 用户名称 */
	private String userName;
	private String status;
	private Date createTime;
	private Date lastLoginTime;

	public Admin() {
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

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", loginName=" + loginName + ", password=" + password + ", userName=" + userName
				+ ", status=" + status + ", createDate=" + createTime + ", lastLoginDate=" + lastLoginTime + "]";
	}

}
