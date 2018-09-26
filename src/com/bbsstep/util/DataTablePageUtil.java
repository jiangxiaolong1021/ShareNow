package com.bbsstep.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.WebRequest;

public class DataTablePageUtil<T> {

	private int draw; // 第几次请求?
	private int start = 0;// 起止位置'0'
	private int length = 10; // 数据长度'10'
	private List<T> data;  //要显示的数据
	private int recordsTotal; // 数据总记录数
	private int recordsFiltered; // 过滤数据?

	private Map<String, Object> condition = new HashMap<String, Object>(); // 查询条件
	private String search;

	protected static final Logger logger = LoggerFactory.getLogger(DataTablePageUtil.class);

	public DataTablePageUtil() {

	}

	public DataTablePageUtil(WebRequest request) {
		logger.debug("查询条件:" + request.getParameter("search[value]"));
		if (StringUtils.isNotBlank(request.getParameter("search[value]"))) {
			// 查询条件
			this.setSearch(request.getParameter("search[value]"));
		}
		this.setDraw(Integer.parseInt(request.getParameter("draw")));
		this.setStart(Integer.parseInt(request.getParameter("start")));
		this.setLength(Integer.parseInt(request.getParameter("length")));
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Map<String, Object> getCondition() {
		return condition;
	}

	public void setCondition(Map<String, Object> condition) {
		this.condition = condition;
	}

	public int getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(int recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public int getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
}
