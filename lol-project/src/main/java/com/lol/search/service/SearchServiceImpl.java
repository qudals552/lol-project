package com.lol.search.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.lol.common.util.CommonFunction;
import com.lol.search.mapper.SearchMapper;

@EnableAsync
@Service("SearchServiceImpl")
public class SearchServiceImpl implements SearchService {
	private static final Logger logger = LoggerFactory.getLogger(SearchServiceImpl.class);

	@Autowired
	SearchMapper searchMapper;

	@Override
	public void saveSummonerData(Map<String, Object> summonerMap) throws Exception {
		if (CommonFunction.checkRequiredValue(summonerMap, "accountId")) {
			throw new Exception();
		}
		
		if(searchMapper.selectSummonerCount(summonerMap) > 0) {
			searchMapper.updateSummoner(summonerMap);
		} else {
			searchMapper.insertSummoner(summonerMap);
		}
	}
}
