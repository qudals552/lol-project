package com.lol.common.util;

import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CommonJsonUtil {
	/**
     * Map을 json으로 변환한다.
     *
     * @param map Map<String, Object>
     * @return String
     */
    public static String getJsonStringFromMap(Map<String, Object> map) throws Exception {
        String json = "";

    	try {
        	ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

        return json;
    }

    /**
     * json을 Map으로 변환한다.
     *
     * @param json String
     * @return Map<String, Object>
     */
    public static Map<String, Object> getMapFromJsonString(String json) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();

    	try {
        	ObjectMapper mapper = new ObjectMapper();
        	map = mapper.readValue(json, new TypeReference<Map<String, Object>>(){});
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

        return map;
    }
}
