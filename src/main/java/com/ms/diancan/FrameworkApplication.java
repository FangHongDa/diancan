package com.ms.diancan;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FrameworkApplication {

    /**
     * logger
     */
    private static final Logger logger = LoggerFactory.getLogger(FrameworkApplication.class);


    public static void main(String[] args) {

        SpringApplication.run(FrameworkApplication.class, args);

        logger.info("> > > > >framework is starting...< < < < <");
    }
}
