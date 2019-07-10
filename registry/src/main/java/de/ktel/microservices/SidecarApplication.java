package de.ktel.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.ms-source-generic.EnableMSSourceGeneric;

/**
 * Created on 15.01.16.
 *
 * @author David Steiman, K-TEL Communications GmbH
 */
@SpringBootApplication
@EnableMSSourceGeneric
public class MSSourceGenericApplication {
    public static void main(String[] args) {
        SpringApplication.run(MSSourceGenericApplication.class, args);
    }
}
