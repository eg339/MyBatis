package com.batis.utils;

import java.util.List;

import com.batis.vo.BaseGridVO;

public class JqGrid {

	private int page; // 当前面
	private int rp; // 初始化的每页记录大小
	private int rpOptions; // 动态改变的每页记录大小
	private int total; // 总页数
	private String sortname; // 排序的字段名称
	private String sortorder; // 排序的方式
	private List rows; // 包含实际数据的数组 记录，数据行
	private int records;// 查询出的记录数

	// 初始化参数 魏雅军 2013-01-10
	public int init(int count) {
		int rpage = 1;
		int startNum = (getPage() - 1) * getRp();
		// 计算 开始记录数
		if (count <= startNum) {
			rpage = count / getRp();
			if (rpage < 1) {
				rpage = 1;
			}
			// setPage(rpage);
			// if (count % getRp()>0){
			// setTotal(rpage+1);
			// }else{
			// setTotal(rpage);
			// }

			startNum = (rpage - 1) * getRp();
		}
		// System.out.println("JQGRID RP参数:"+String.valueOf(getRp()));
		// System.out.println("JQGRID 记录总数:"+String.valueOf(count));
		// 计算总页数
		int total = 0;
		total = count / getRp();
		if (count % getRp() > 0) {
			total = total + 1;
		}
		// System.out.println("JQGRID 总页数:"+String.valueOf(total));
		setTotal(total);
		if (startNum < 0) {
			startNum = 0;
		}
		setRecords(count);
		try {
			if (getRecords() < 0) {
				setRecords(0);
			}
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			setRecords(0);
		}
		// setTotal(10);
		return startNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRp() {
		return rp;
	}

	public void setRp(int rp) {
		this.rp = rp;
	}

	public int getRpOptions() {
		return rpOptions;
	}

	public void setRpOptions(int rpOptions) {
		this.rpOptions = rpOptions;
	}

	public int getTotal() {
		return records;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getSortname() {
		return sortname;
	}

	public void setSortname(String sortname) {
		this.sortname = sortname;
	}

	public String getSortorder() {
		return sortorder;
	}

	public void setSortorder(String sortorder) {
		this.sortorder = sortorder;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		for (int i = 0; i < rows.size(); i++) {
			if(!(rows.get(i) instanceof BaseGridVO))
				break;
			BaseGridVO girdVO  = (BaseGridVO) rows.get(i);
			int seqNum = (this.page - 1) * this.rp + i + 1;
			girdVO.setSeqNum(seqNum);
		}
		this.rows = rows;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

}
