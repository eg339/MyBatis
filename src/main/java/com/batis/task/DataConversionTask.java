/**
 * 
 */
package com.batis.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 任务类
 * @author zqx
 *
 */
public class DataConversionTask {
	/* 日志对象 */
	private static final Logger LOGGER = LoggerFactory.getLogger(DataConversionTask.class);

	public void run() {
		if (LOGGER.isInfoEnabled()) {
			LOGGER.info("数据转换任务线程开始执行");
		}
	}
}
