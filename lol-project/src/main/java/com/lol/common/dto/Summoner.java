package com.lol.common.dto;

import lombok.Data;

@Data
public class Summoner {
	private int profileIconId;
	private String name;
	private String puuid;
	private long summonerLevel;
	private long revisionDate;
	private String id;
	private String accountId;
	
	public Summoner(int profileIconId, String name, String puuid, long summonerLevel, long revisionDate,
			String id, String accountId) {
		this.profileIconId = profileIconId;
		this.name = name;
		this.puuid = puuid;
		this.summonerLevel = summonerLevel;
		this.revisionDate = revisionDate;
		this.id = id;
		this.accountId = accountId;
	}
}
