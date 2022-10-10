package com.lol.common.util;

import java.util.List;

import com.lol.common.response.CommonResponse;
import com.lol.common.response.ListResponse;
import com.lol.common.response.ResponseCode;
import com.lol.common.response.SingleResponse;

public class CommonResponseUtil {

    public static <T> SingleResponse<T> getSingleResponse(T data) {
    	SingleResponse<T> response = new SingleResponse<>();
    	response.setData(data);
    	setSuccessResponse(response);
    	return response;
    }

	public static <T> SingleResponse<T> getSingleResponseWithCode(T data, ResponseCode responseCode) {
    	SingleResponse<T> response = new SingleResponse<>();
    	response.setData(data);
    	response.setResponse_code(responseCode.getCode());
    	response.setResponse_message(responseCode.getMessage());
    	return response;
    }

    public static <T> ListResponse<T> getListResponse(List<T> list) {
    	ListResponse<T> response = new ListResponse<>();
    	response.setData(list);
    	setSuccessResponse(response);
    	return response;
    }

    public static <T> ListResponse<T> getListResponseWithPage(List<T> list, int total_count, int search_count, int search_page) {
    	ListResponse<T> response = new ListResponse<>();
    	response.setData(list);
    	response.setTotal_count(total_count);
    	response.setSearch_count(search_count);
    	response.setSearch_page(search_page);
    	setSuccessResponse(response);
    	return response;
    }

    public static <T> ListResponse<T> getListResponseWithPageWithCnt(List<T> list, int total_count, int search_count, int search_page, int total_count_cnt) {
    	ListResponse<T> response = new ListResponse<>();
    	response.setData(list);
    	response.setTotal_count(total_count);
    	response.setTotal_count_cnt(total_count_cnt);
    	response.setSearch_count(search_count);
    	response.setSearch_page(search_page);
    	setSuccessResponse(response);
    	return response;
    }

    public static CommonResponse getSuccessResponse() {
    	CommonResponse response = new CommonResponse();
    	setSuccessResponse(response);
    	return response;
    }

    public static CommonResponse getErrorResponse(ResponseCode responseCode) {
    	CommonResponse response = new CommonResponse();
    	response.setResponse_code(responseCode.getCode());
    	response.setResponse_message(responseCode.getMessage());
    	return response;
    }

    private static void setSuccessResponse(CommonResponse response) {
    	response.setResponse_code(ResponseCode.SUCCESS.getCode());
    	response.setResponse_message(ResponseCode.SUCCESS.getMessage());
    }
}
