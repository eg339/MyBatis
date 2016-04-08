/**
 * 
 */
package com.batis.quartz;

import java.util.HashMap;
import java.util.Map;

import com.batis.task.ScheduleJob;

/**
 * @author zqx
 *
 */
public class Quartz {
	/** 计划任务map */
	private static Map<String, ScheduleJob> jobMap = new HashMap<String, ScheduleJob>();
	static {
		for (int i = 0; i < 5; i++) {
			ScheduleJob job = new ScheduleJob();
			job.setJobId("10001" + i);
			job.setJobName("data_import" + i);
			job.setJobGroup("dataWork");
			job.setJobStatus("1");
			job.setCronExpression("0/5 * * * * ?");
			job.setDescription("数据导入任务");
			addJob(job);
		}
	}
	/**
	 * 添加任务
	 * @param scheduleJob
	 */
	public static void addJob(ScheduleJob scheduleJob) {
		jobMap.put(scheduleJob.getJobGroup() + "_" + scheduleJob.getJobName(), scheduleJob);
	}
}
