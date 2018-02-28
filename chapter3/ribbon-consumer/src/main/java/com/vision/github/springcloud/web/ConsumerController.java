package com.vision.github.springcloud.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/** @author ganminghui */
@RestController public class ConsumerController {
    @Autowired private RestTemplate restTemplate;

    @RequestMapping("/ribbon-consumer")public String helloConsumer(){
        return restTemplate.getForEntity("http://HELLO-SERVICE/hello",String.class).getBody();
    }
}
