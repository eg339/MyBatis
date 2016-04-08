package com.batis.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.batis.constants.Constants;
import com.batis.utils.JqGrid;
import com.batis.utils.StringUtils;
import com.batis.vo.AdminVO;
import com.batis.vo.OperatorVO;

/**
 * base controller
 * 
 * @author eg366
 * 
 */
@Controller
public class BaseController {
	protected HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	}

	/**
	 * 输出json流到客户端 用于ajax交易
	 * 
	 * @param data
	 *            输出的数据对象
	 * @throws IOException
	 */
	public void print(String data, HttpServletResponse response) {
		try {
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取客户端分页信息 获取JqGrid对象
	 * 
	 * @return
	 */
	protected JqGrid getJqGridFromRequest() {
		JqGrid fg = new JqGrid();
		fg.setPage(StringUtils.isEmpty(getParameter("page")) ? 0 : Integer.parseInt(getParameter("page")));
		fg.setRp(StringUtils.isEmpty(getParameter("rows")) ? 0 : Integer.parseInt(getParameter("rows")));
		fg.setSortname(StringUtils.isEmpty(getParameter("sidx")) ? null : getParameter("sidx"));
		fg.setSortorder(StringUtils.isEmpty(getParameter("sord")) ? null : getParameter("sord"));
		return fg;
	}

	/**
	 * 获取request域的数据
	 * 
	 * @param par
	 * @return
	 */
	protected String getParameter(String par) {
		String val = getRequest().getParameter(par);
		if (StringUtils.isBlank(val) || StringUtils.equalsIgnoreCase(val, "null") || StringUtils.endsWithIgnoreCase(val, "undefined"))
			return null;
		return StringUtils.trim(val);
	}

	/**
	 * 从session中获取数据
	 */
	protected Object getSessionByParam(String param) {
		HttpSession session = getRequest().getSession(true);
		return session == null ? null : session.getAttribute(param);
	}

	/**
	 * 从session中获取数据toString
	 */
	protected String getSessionStrByParam(String param) {
		Object object = this.getSessionByParam(param);
		return object == null ? "" : object.toString();
	}

	/**
	 * 保存管理员session
	 * 
	 * @param vo
	 */
	protected void saveAdminOperator(AdminVO vo) {
		HttpSession session = getRequest().getSession(true);
		session.setAttribute(Constants.ADMIN_SESSION_ID, vo);
	}

	/**
	 * 管理员登出
	 */
	protected void loginOutAdmin() {
		HttpSession session = getRequest().getSession(true);
		session.removeAttribute(Constants.ADMIN_SESSION_ID);
	}
	
	/**
	 * 获取session中保存的登录用户对象
	 * @return
	 */
	protected OperatorVO getOperatorVO() {
		return (OperatorVO) SecurityUtils.getSubject().getPrincipal();
	}

	/**
	 * 获取管理员session
	 */
	protected AdminVO getAdminOperator() {
		return (AdminVO) getRequest().getSession(true).getAttribute(Constants.ADMIN_SESSION_ID);
	}

	/**
	 * 根据传入的虚拟路径获取物理路径
	 */
	protected String getPhysicalPath(String path) {
		// path = getRequest().getServletPath();
		String realPath = getRequest().getSession().getServletContext().getRealPath(path);
		return new File(realPath).getPath();
	}

	/**
	 * 根据页码、显示数量计算 数据开始startNum
	 * 
	 * @param pageIndex
	 *            0开始
	 * @param pageSize
	 * @return 0开始
	 */
	protected int getStartNum(int pageIndex, int pageSize) {
		if (pageIndex == 1)
			return 0;
		return (pageIndex - 1) * pageSize;
	}
}
