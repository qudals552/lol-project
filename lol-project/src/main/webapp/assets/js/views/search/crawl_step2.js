var fnObj = {};
const SEARCH_COUNT = 10;
const USER_OS = commonObj.getOs();
var webtoon_not = false; // 웹툰이 없으면 등록버튼 못누르게 만듬
var target = document.querySelector("#card_tab");
var blockUI = new KTBlockUI(target, {
    message: '<div class="blockui-message"><span class="spinner-border text-primary"></span> 처리중...</div>',
});

fnObj.initEvent = function() {

	$("#platform_list").on("change", function() {
		var crawl_type = $("#platform_list option:selected").val().toLowerCase();
		$("#insert_btn").html('<span class="svg-icon svg-icon-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"><path opacity="0.3" d="M10 4H21C21.6 4 22 4.4 22 5V7H10V4Z" fill="black"></path><path d="M10.4 3.60001L12 6H21C21.6 6 22 6.4 22 7V19C22 19.6 21.6 20 21 20H3C2.4 20 2 19.6 2 19V4C2 3.4 2.4 3 3 3H9.2C9.7 3 10.2 3.20001 10.4 3.60001ZM16 12H13V9C13 8.4 12.6 8 12 8C11.4 8 11 8.4 11 9V12H8C7.4 12 7 12.4 7 13C7 13.6 7.4 14 8 14H11V17C11 17.6 11.4 18 12 18C12.6 18 13 17.6 13 17V14H16C16.6 14 17 13.6 17 13C17 12.4 16.6 12 16 12Z" fill="black"></path><path opacity="0.3" d="M11 14H8C7.4 14 7 13.6 7 13C7 12.4 7.4 12 8 12H11V14ZM16 12H13V14H16C16.6 14 17 13.6 17 13C17 12.4 16.6 12 16 12Z" fill="black"></path></svg></span>' + $("#platform_list option:selected").text() + ' 등록');
		blockUI.block(); // 화면 블록
		fnObj.getWebtoonList(crawl_type);
	});

	$("#insert_btn").on("click", function() {
		var crawl_type = $("#platform_list option:selected");
		var webtoon_count = $("#webtoon_count").text();

		Swal.fire({
	        html: crawl_type.text() + '의 ' + webtoon_count + '개를 등록하시겠습니까?',
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
				$("#insert_btn").prop("disabled", true);
				blockUI.block(); // 화면 블록
				fnObj.insertWebtoonList(crawl_type.val().toLowerCase());
			}
		});

//		if(confirm(crawl_type.text() + '의 ' + webtoon_count + '개 \n정말로 위 데이터를 넣으시겠습니까?') && webtoon_not != true){
//			$("#insert_btn").prop("disabled", true);
//			blockUI.block(); // 화면 블록
//			fnObj.insertWebtoonList(crawl_type.val().toLowerCase());
//			fnObj.getWebtoonList(crawl_type.val());
//		}
	});
}

fnObj.insertWebtoonList = function(crawl_type) {
	var _url = contextPath + '/api/v1/crawl/insertWebtoonList';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type,
		'platform_id' : crawl_type
	};

//	var _option = {
//		'async' : false, // 동기화처리
//	}

	commonObj.ajaxCall(_url, _postData, fnObj.insertWebtoonListCallback);
};

fnObj.insertWebtoonListCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var crawl_type = $("#platform_list option:selected").val().toLowerCase();

		if (responseCode == "000") {
			Swal.fire({ // 등록성공 alert창
		        text: crawl_type +  "의 신규웹툰 등록이 완료되었습니다!",
		        icon: "success",
		        buttonsStyling: false,
		        confirmButtonText: "확인",
		        customClass: {
		            confirmButton: "btn btn-success"
		        }
		    });
			fnObj.getWebtoonList(crawl_type);
		} else {
			if (blockUI.isBlocked()) { // 블록상태 해제
	        	blockUI.release();
	    	}
			Swal.fire({ // 등록실패 alert창
		        text: "웹툰 등록중 오류가 발생했습니다.",
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
		if (blockUI.isBlocked()) { // 블록상태 해제
        	blockUI.release();
    	}
		Swal.fire({ // 등록실패 alert창
	        text: "알 수 없는 오류가 발생했습니다.",
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

fnObj.getWebtoonList = function(crawl_type) {
	var _url = contextPath + '/api/v1/crawl/getCrawlWebtoonList';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type,
		'search_count' : SEARCH_COUNT,
		'search_page' : pagination.getCurrPage()
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getWebtoonListCallback);
};

fnObj.getWebtoonListCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var data = response.data;
		var total_count = response.total_count;
		var html  = '';

		if (responseCode == "000") {
			$('#erorr_table').empty();
			$('#webtoon_count').empty();
			$('#webtoon_count').append("신규웹툰 : " + total_count);

			$.each(data, function(index, item) {
				html += '<tr>';
				html += '	<td>';
				html += '		<div class="d-flex align-items-center">';
				html += '			<div class="d-flex justify-content-start flex-column">';
				html += '				<span class="text-dark fw-bold d-block fs-6">'+ item.id +'</span>';
				html += '			</div>';
				html += '		</div>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.title +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.author +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.genre1 +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.genre2 +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.genre3 +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.age_requirement +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.charge_at +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-6">'+ item.finalize_yn +'</span>';
				html += '	</td>';
				html += '</tr>';
			});

			$('#webtoon_list').empty();
			$('#webtoon_list').append(html);

			webtoon_not = false;

		} else if(responseCode == "201") {
			var html  = '';
			webtoon_not = true;

			$('#webtoon_count').empty();
			$('#webtoon_count').append("신규웹툰 : 0");

			html += '<div class="card card-flush py-4 flex-row-fluid overflow-hidden error-card">';
			html += '	<div class="position-absolute top-0 end-0 opacity-10 pe-none text-end">';
			html += '		<img src="'+ contextPath +'/assets/media/icons/duotune/ecommerce/ecm006.svg" class="w-175px">';
			html += '	</div>';
			html += '	<div class="card-header">';
			html += '		<div class="card-title">';
			html += '			<h2>'+ $("#platform_list option:selected").text() +'에 추가할 신규웹툰이 없습니다.</h2>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="card-body pt-0">따로 추가할 웹툰이 발견되지 않았습니다,<br><br><br>';
			html += '	</div>';
			html += '</div>';

			$('#webtoon_list').empty();
			$('#erorr_table').empty();
			$('#erorr_table').append(html);

		} else {
			var html  = '';
			webtoon_not = true;

			$('#webtoon_count').empty();
			$('#webtoon_count').append("신규웹툰 : 0");

			html += '<div class="card card-flush py-4 flex-row-fluid overflow-hidden error-card">';
			html += '	<div class="position-absolute top-0 end-0 opacity-10 pe-none text-end">';
			html += '		<img src="'+ contextPath +'/assets/media/icons/duotune/ecommerce/ecm006.svg" class="w-175px">';
			html += '	</div>';
			html += '	<div class="card-header">';
			html += '		<div class="card-title">';
			html += '			<h2>알 수 없는 오류가 발생했습니다.</h2>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="card-body pt-0">따로 추가할 웹툰이 발견되지 않았습니다,<br><br><br>';
			html += '	</div>';
			html += '</div>';

			$('#webtoon_list').empty();
			$('#erorr_table').empty();
			$('#erorr_table').append(html);

		}
	} catch (e) {
		webtoon_not = true;
		console.log(e);
		console.log(response);
	} finally{
		if(webtoon_not == true){
		$("#insert_btn").prop("disabled", true);
		} else if(webtoon_not == false){
			$("#insert_btn").prop("disabled", false);
		}

		if (blockUI.isBlocked()) { // 블록상태 해제
	        blockUI.release();
	    }
	}
}

var pagination = new PageObject();

fn_go_page = function(page) {
	pagination.setCurrPage(page);
	fnObj.getQuestionList();
}

$(document).ready(function() {
	commonObj.setPlatformList('combo', 'platform_list', null);
	fnObj.initEvent();
	pagination.init($(".pagination"), 1, SEARCH_COUNT);
});
