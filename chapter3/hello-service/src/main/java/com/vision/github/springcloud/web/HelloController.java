package com.vision.github.springcloud.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** @author ganminghui */
@RestController @Slf4j public class HelloController {
    @Autowired(required = false) private DiscoveryClient client;

    @RequestMapping("/hello") public String hello(){ return "hello world"; }

    @RequestMapping("/index") public String index(){
        ServiceInstance instance = client.getLocalServiceInstance();
        log.info("/hello, host: {}, service_id:{}",instance.getHost(),instance.getServiceId());
        return "index";
    }
}