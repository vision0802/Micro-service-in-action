package com.vision.github.springcloud.chapter2.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/** @author ganminghui */
@RestController public class HelloController {
    @RequestMapping("/hello")public String index(){ return "hello world"; }
}