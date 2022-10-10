package com.lol.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TimeUtil {

	Logger logger = LoggerFactory.getLogger(TimeUtil.class);

	public void getRunningTime(double secDiffTime, String type) {
		type = type.toLowerCase();
		long hour = (long) (secDiffTime / (1000 * 60 * 60)) ;
		long min = (long) ((secDiffTime / (1000 * 60)) % 60);
		double sec = (secDiffTime / 1000) % 60;
		if("running".equals(type)) {
			logger.info("@ Running Time : "  + hour + "h " + min + "m " + Math.round(sec*100)/100.0 + "s");
		} else if("delay".equals(type)) {
			logger.info("@ Random Delay Time : "  + hour + "h " + min + "m " + Math.round(sec*100)/100.0 + "s");
		}
	}

	public String getRunningTime(double secDiffTime) {
		long hour = (long) (secDiffTime / (1000 * 60 * 60)) ;
		long min = (long) ((secDiffTime / (1000 * 60)) % 60);
		double sec = (secDiffTime / 1000) % 60;

		return hour + "h " + min + "m " + Math.round(sec*100)/100.0 + "s";
	}
}
