package com.lol.common.exception;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.lol.common.util.CommonFunction;

@ControllerAdvice
public class GlobalExceptionHandler {
	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<Map<String, Object>> handleException(Exception e, HttpServletRequest request, HttpServletResponse response) {
		logger.error("에러발생!!");
		logger.error(CommonFunction.printStackTraceToString(e));

		Map<String, Object> errorMap = new HashMap<String, Object>();
		errorMap.put("result_code", "901");
		errorMap.put("result_msg", "에러가 발생했습니다. 시스템 관리자에게 문의해 주세요.");

		return new ResponseEntity<Map<String, Object>>(errorMap, HttpStatus.OK);
	}

	@ExceptionHandler(RuntimeException.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<Map<String, Object>> handleRuntimeException(RuntimeException e, HttpServletRequest request, HttpServletResponse response) {
		logger.debug("RuntimeException 에러발생!!");
		logger.error(CommonFunction.printStackTraceToString(e));

		Map<String, Object> errorMap = new HashMap<String, Object>();
		errorMap.put("result_code", "901");
		errorMap.put("result_msg", "에러가 발생했습니다. 시스템 관리자에게 문의해 주세요.");

		return new ResponseEntity<Map<String, Object>>(errorMap, HttpStatus.OK);
	}

	@ExceptionHandler(value = {SQLException.class, UncategorizedSQLException.class})
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	public ResponseEntity<Map<String, Object>> handleSQLException(RuntimeException e, HttpServletRequest request, HttpServletResponse response) {
		logger.debug("SQLException 에러발생!!");
		logger.error(CommonFunction.printStackTraceToString(e));

		Map<String, Object> errorMap = new HashMap<String, Object>();
		errorMap.put("result_code", "901");
		errorMap.put("result_msg", "에러가 발생했습니다. 시스템 관리자에게 문의해 주세요.");

		return new ResponseEntity<Map<String, Object>>(errorMap, HttpStatus.OK);
	}
}
