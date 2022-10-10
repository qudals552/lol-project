package com.lol.search.service;

import java.util.Map;

import com.lol.common.dto.Summoner;
import com.lol.common.response.CommonResponse;

public interface SearchService {
	public void saveSummonerData(Map<String, Object> summonerMap) throws Exception;
}