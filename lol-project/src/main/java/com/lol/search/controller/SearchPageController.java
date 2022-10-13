package com.lol.search.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.lol.common.dto.Summoner;
import com.lol.search.service.SearchService;

@Controller
@RequestMapping(value="", method=RequestMethod.GET)
public class SearchPageController {	
	final static String API_KEY = "RGAPI-6e886ccc-8ca3-4947-a494-afdf80ef50a9";
	final static String GAME_VERSION = "12.19.1";
	
	@Autowired
	private SearchService searchService;
	
	@GetMapping(value = "")
	public ModelAndView searchMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("page.1.search.search");
		return mv;
	}
	
	@GetMapping(value="/search/{summonerName}")
	public ModelAndView searchSummoner(HttpServletRequest request, HttpServletResponse response, @PathVariable String summonerName) throws Exception {
		ModelAndView mv = new ModelAndView();
		BufferedReader br = null;
		Map<String, Object> summonerMap = new HashMap<>();
		try {
			String urlstr = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" +	summonerName + "?api_key=" + API_KEY;
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			String result = "";
			String line;
			while((line = br.readLine()) != null) { // 받아온 JSON문자열을 계속 br에서 줄단위로 받고 출력
				result = result + line;
			}
			JsonParser jsonParser = new JsonParser();
			JsonObject k = (JsonObject) jsonParser.parse(result);
			
			summonerMap.put("accountId", k.get("accountId").getAsString());
			summonerMap.put("id", k.get("id").getAsString());
			summonerMap.put("name", k.get("name").getAsString());
			summonerMap.put("summonerLevel", k.get("summonerLevel").getAsLong());
			summonerMap.put("profileIconId", k.get("profileIconId").getAsInt());
			summonerMap.put("revisionDate", k.get("revisionDate").getAsLong());
			summonerMap.put("puuid", k.get("puuid").getAsString());
			
			String id = k.get("id").getAsString();
			urlstr = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key=" + API_KEY;
			
			url = new URL(urlstr);
			urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			result = "";
			line = "";
			while((line = br.readLine()) != null) { // 받아온 JSON문자열을 계속 br에서 줄단위로 받고 출력
				result = result + line;
			}
			
			JsonArray ja = (JsonArray) jsonParser.parse(result);
			for(JsonElement je : ja) {
				JsonObject jo = (JsonObject) je;
				if("RANKED_SOLO_5x5".equals(jo.get("queueType").getAsString())) { // 솔로랭크
					summonerMap.put("tier", jo.get("tier").getAsString());
					summonerMap.put("rank", jo.get("rank").getAsString());
					summonerMap.put("leagueId", jo.get("leagueId").getAsString());
					summonerMap.put("leaguePoints", jo.get("leaguePoints").getAsInt());
					summonerMap.put("wins", jo.get("wins").getAsInt());
					summonerMap.put("losses", jo.get("losses").getAsInt());
					// 이긴판수 ÷ 총판수 x 100
					summonerMap.put("winningRate", Math.round(jo.get("wins").getAsDouble() / (jo.get("wins").getAsInt() + jo.get("losses").getAsInt()) * 100));
				} else if("RANKED_FLEX_SR".equals(jo.get("queueType").getAsString())) { // 자유랭크
					summonerMap.put("tierTr", jo.get("tier").getAsString()); // TR = Team Rank 약자
					summonerMap.put("rankTr", jo.get("rank").getAsString());
					summonerMap.put("leagueIdTr", jo.get("leagueId").getAsString()); 
					summonerMap.put("leaguePointsTr", jo.get("leaguePoints").getAsInt());
					summonerMap.put("winsTr", jo.get("wins").getAsInt());
					summonerMap.put("lossesTr", jo.get("losses").getAsInt());
					// 이긴판수 ÷ 총판수 x 100
					summonerMap.put("winningRateTr", Math.round(jo.get("wins").getAsDouble() / (jo.get("wins").getAsInt() + jo.get("losses").getAsInt()) * 100));
				}
			}
			
			// 소환사정보 DB에 추가
			searchService.saveSummonerData(summonerMap);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		mv.addObject("summoner", summonerMap);
		mv.addObject("iconImgURL", "http://ddragon.leagueoflegends.com/cdn/"+ GAME_VERSION +"/img/profileicon/"+summonerMap.get("profileIconId")+".png");
		mv.setViewName("page.1.search.summoner_info");
		return mv;
	}
}