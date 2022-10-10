var fnObj = {};
const USER_OS = commonObj.getOs();
var exist_yn = false;

fnObj.initEvent = function() {

	$("button[name=crawl_btn]").on("click", function() {
		var crawl_type = $(this).data("type");
		fnObj.getTableExist(crawl_type);

//		setTimeout(function(){
		if(exist_yn === true){
			exist_yn = false;
			Swal.fire({ // 등록성공 alert창
		        text: crawl_type +  " 테이블 안에 데이터가 있습니다.\n테이블을 삭제해주세요.",
		        icon: "warning",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-warning"
		        }
		    });
			return false;
		}

		$("#" + crawl_type + "_btn").text("Crawling...");
		$("#" + crawl_type + "_btn").prop("disabled", true);
		$("#" + crawl_type + "_loding").attr("class", "spinner-border spinner-border-sm align-middle ms-0");
		$("#" + crawl_type + "_light").attr("class", "symbol symbol-circle symbol-50px bg-warning h-25px w-25px");
		fnObj.startCrawling(crawl_type);
	});

	$("button[name=delete_btn]").on("click", function() {
		var crawl_type = $(this).data("type");

		Swal.fire({
	        html: `정말로 <strong>` + crawl_type + `</strong>테이블을 삭제 하시겠습니까?`,
	        icon: "question",
	        buttonsStyling: false,
	        showCancelButton: true,
	        confirmButtonText: "확인",
	        cancelButtonText: '취소',
	        customClass: {
	            confirmButton: "btn btn-primary",
	            cancelButton: 'btn btn-danger'
	        }
	    }).then(result => {
			if(result.isConfirmed){
				fnObj.deleteCrawlTable(crawl_type);
				fnObj.getUpdateDate(crawl_type);
			}
		});

//		if(confirm('정말로 ' + crawl_type + ' table을 삭제 하시겠습니까?')){
//			fnObj.deleteCrawlTable(crawl_type);
//			fnObj.getUpdateDate(crawl_type);
//		}
	});
}

fnObj.getTableExist = function(crawl_type){ // 테이블안 데이터 유무 검색
	var _url = contextPath + '/api/v1/crawl/getTableExist';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type
	};

	var _option = {
		"async" : false, // 동기식 옵션
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getTableExistCallback, _option);
}

fnObj.getTableExistCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;

		if (responseCode == "000") {
			exist_yn = true; // 테이블안에 데이터가 있음
		}else if(responseCode == "201"){
			exist_yn = false; // 테이블안에 데이터가 X
		}else {
			Swal.fire({ // 등록실패 alert창
		        text: "DB호출 오류발생",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
			console.log(responseCode);
			console.log(responseMessage);
		}

	} catch (e) {
		console.log(e);
		console.log(response);
	}
}

fnObj.deleteCrawlTable = function(crawl_type){ // 테이블 삭제
	var _url = contextPath + '/api/v1/crawl/deleteCrawlTable';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type
	};
	var _option = {
		"async" : false, // 동기식 옵션
	};

	commonObj.ajaxCall(_url, _postData, fnObj.deleteCrawlTableCallback, _option);
}

fnObj.deleteCrawlTableCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;

		if (responseCode == "000") {
			Swal.fire({ // 성공 alert창
		        text: "테이블을 초기화 했습니다.",
		        icon: "success",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-success"
		        }
		    });
		} else {
			Swal.fire({ // 실패 alert창
		        text: "테이블을 초기화 중 오류가 발생했습니다.",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
			console.log(responseCode);
			console.log(responseMessage);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}


fnObj.getUpdateDate = function(crawl_type) {
	var _url = contextPath + '/api/v1/crawl/getUpdateDate';
	var _postData = {
		'crawl_type' : crawl_type
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getUpdateDateCallback);
};

fnObj.getUpdateDateCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var crawl_type = response.data.crawl_type;
		var reg_date = response.data.reg_date;

		if (responseCode == "000") {
			if(reg_date == null){
				$("#" + crawl_type + "_updated_date").text("Updated Date No Data");
			} else {
				$("#" + crawl_type + "_updated_date").text("Updated Date " + reg_date);
			}
			$("#" + crawl_type + "_total").text("전체건수 : " + response.data.total_count);
			$("#" + crawl_type + "_insert_at").text("미반영건수 : " + response.data.insert_at_count);
		} else if(responseCode == "401") {
			Swal.fire({ // 실패 alert창
		        text: crawl_type + " DB호출오류발생. 담당자에게 문의해주세요.",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
		} else {
			Swal.fire({ // 실패 alert창
		        text: crawl_type + " 알 수 없는 오류가 발생했습니다. 담당자에게 문의해주세요.",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}


// 크롤링 시작 ajax
fnObj.startCrawling = function(crawl_type) {
	var _url = contextPath + '/api/v1/crawl/startCrawling';
	var _postData = {
		'crawl_type' : crawl_type
	};

	commonObj.ajaxCall(_url, _postData, fnObj.startCrawlingCallback);
};

fnObj.startCrawlingCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var crawl_type = response.data.crawl_type;
		var running_time = response.data.running_time;

		if (responseCode == "000") {
			$("#" + crawl_type + "_btn").text("Crawling Ready");
			$("#" + crawl_type + "_btn").prop("disabled", false);
			$("#" + crawl_type + "_loding").attr("class", "bi bi-arrow-clockwise fs-2");
			$("#" + crawl_type + "_light").attr("class", "symbol symbol-circle symbol-50px bg-primary h-25px w-25px");
			Swal.fire({ // 크롤링성공 alert창
		        text: crawl_type + "의 크롤링이 정상적으로 처리되었습니다.\nRunningTime : "+ running_time,
		        icon: "success",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-success"
		        }
		    });
			fnObj.getUpdateDate(crawl_type);
		} else if(responseCode == "401") {
			$("#" + crawl_type + "_btn").text("Error Crawling");
			$("#" + crawl_type + "_loding").attr("class", "bi bi-arrow-clockwise fs-2");
			$("#" + crawl_type + "_light").attr("class", "symbol symbol-circle symbol-50px bg-danger h-25px w-25px");
			Swal.fire({ // 등록실패 alert창
		        text: crawl_type + "에서 크롤링 도중 오류가 발생했습니다.\n담당자에게 문의해주세요.",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
		} else {
			$("#" + crawl_type + "_btn").text("Error Crawling");
			$("#" + crawl_type + "_loding").attr("class", "bi bi-arrow-clockwise fs-2");
			$("#" + crawl_type + "_light").attr("class", "symbol symbol-circle symbol-50px bg-danger h-25px w-25px");
			Swal.fire({ // 등록실패 alert창
		        text: crawl_type + "에서 알 수 없는 오류가 발생했습니다.\n담당자에게 문의해주세요.",
		        icon: "error",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-danger"
		        }
		    });
		}
	} catch (e) {
		$("#" + crawl_type + "_btn").text("Error Crawling");
		$("#" + crawl_type + "_loding").attr("class", "bi bi-arrow-clockwise fs-2");
		$("#" + crawl_type + "_light").attr("class", "symbol symbol-circle symbol-50px bg-danger h-25px w-25px");
		Swal.fire({ // 등록실패 alert창
	        text: crawl_type + "에서 알 수 없는 오류가 발생했습니다.\n담당자에게 문의해주세요.",
	        icon: "error",
	        buttonsStyling: false,
	        confirmButtonText: "확인",
	        customClass: {
	            confirmButton: "btn btn-danger"
	        }
	    });
		console.log(e);
		console.log(response);
	}
}

$(document).ready(function() {
	/* 마지막 업데이트 날짜표시 */
	fnObj.getUpdateDate('naver');
	fnObj.getUpdateDate('kakaopage');
	fnObj.getUpdateDate('kakaowebtoon');
	fnObj.getUpdateDate('lezhincomics');
	fnObj.getUpdateDate('toomics');
	fnObj.getUpdateDate('bufftoon');
	fnObj.getUpdateDate('toptoon');
	fnObj.getUpdateDate('mrblue');
	fnObj.getUpdateDate('bomtoon');
	fnObj.getUpdateDate('mootoon');
	fnObj.getUpdateDate('comica');
	fnObj.getUpdateDate('foxtoon');
	/* 마지막 업데이트 날짜표시 */

	fnObj.initEvent();
});
