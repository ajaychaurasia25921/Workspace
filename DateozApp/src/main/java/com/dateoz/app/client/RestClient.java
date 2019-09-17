package com.dateoz.app.client;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.Iterator;

public class RestClient {
    public static void getDataFromJIRA(){
        RestTemplate restTemplate = new RestTemplate();
        String json = restTemplate.getForObject("http://192.168.5.89:8082/rest/api/2/search?&os_username=mantanz&os_password=cxps123",String.class);
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode jsonNode= mapper.readTree(json).get("issue");
            Iterator<JsonNode> iterator= jsonNode.iterator();
            while(iterator.hasNext()){
                JsonNode childNode = iterator.next();
                System.out.println(childNode.findPath("fields").textValue());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
