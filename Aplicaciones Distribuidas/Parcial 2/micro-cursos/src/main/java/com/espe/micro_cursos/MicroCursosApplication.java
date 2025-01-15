package com.espe.micro_cursos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;


@EnableFeignClients
@SpringBootApplication
public class MicroCursosApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroCursosApplication.class, args);
	}

}
