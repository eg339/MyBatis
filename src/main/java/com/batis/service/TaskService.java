/**
 * 
 */
package com.batis.service;

import java.util.Collection;

import org.springframework.scheduling.config.Task;

/**
 * @author zqx
 *
 */
public interface TaskService {
	
	Collection<Task> findTask();

}
