package com.soap;

import com.soap.client.SoapClient;
import com.soap.wsdl.AddResponse;
import com.soap.wsdl.DivideResponse;
import com.soap.wsdl.MultiplyResponse;
import com.soap.wsdl.SubtractResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringBootSoapApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpringBootSoapApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(SpringBootSoapApplication.class, args);
	}

	@Bean
	CommandLineRunner init(SoapClient soapClient){
		return args -> {

			AddResponse addResponse = soapClient.getAddResponse(2, 2);
			SubtractResponse subtractResponse = soapClient.getSubtractResponse(2,2);
			MultiplyResponse multiplyResponse = soapClient.getMultiplyResponse(2,2);
			DivideResponse divideResponse = soapClient.getDivideResponse(2,2);

			LOGGER.info("El resultado de la suma de los numeros {} y {} es: {}", 2, 2, addResponse.getAddResult());
			LOGGER.info("El resultado de la resta de los numeros {} y {} es: {}", 2, 2, subtractResponse.getSubtractResult());
			LOGGER.info("El resultado de la multiplicación de los numeros {} y {} es: {}", 2, 2, multiplyResponse.getMultiplyResult());
			LOGGER.info("El resultado de la división de los numeros {} y {} es: {}", 2, 2, divideResponse.getDivideResult());

		};
	}

}