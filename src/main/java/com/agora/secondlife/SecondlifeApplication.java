package com.agora.secondlife;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
public class SecondlifeApplication {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(SecondlifeApplication.class);

        Map<String, Object> props = new HashMap<>();
        String port = System.getenv("PORT");
        if (port != null) {
            props.put("server.port", port);
        } else {
            props.put("server.port", "8080");
        }
        app.setDefaultProperties(props);

        app.run(args);
    }
}
