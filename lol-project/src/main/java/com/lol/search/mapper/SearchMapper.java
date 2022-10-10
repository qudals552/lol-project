package com.lol.search.mapper;

import java.util.Map;

public interface SearchMapper {
	public int selectSummonerCount(Map<String, Object> summonerMap) throws Exception;
	public int insertSummoner(Map<String, Object> summonerMap) throws Exception;
	public int updateSummoner(Map<String, Object> summonerMap) throws Exception;
	public int deleteSummoner(Map<String, Object> summonerMap) throws Exception;
}
