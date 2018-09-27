package com.wangjin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动微服务
 *
 * @author wangjin
 *
 * @version 0.0.1
 *
 * @date 2018-03-26
 *
 */
@SpringBootApplication
@MapperScan("com.wangjin.mapper.**")
public class MyApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyApplication.class, args);
		System.out.println("项目已启动...");
	}
}


