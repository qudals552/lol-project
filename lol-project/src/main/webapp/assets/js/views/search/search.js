var fnObj = {};
const SEARCH_COUNT = 10;
const USER_OS = commonObj.getOs();

fnObj.initEvent = function() {
	
	$("#search_btn").on("click", function() {
		var search_word = $("#search_word").val();
		if(search_word == '' || search_word == null || search_word == undefined){
			return;
		}
		location.href = contextPath + "/search/" + search_word.replaceAll(" ","");
	});
	
	$("#search_word").on("keyup", function(key) {
		if(key.keyCode==13){
			var search_word = $("#search_word").val();
			if(search_word == '' || search_word == null || search_word == undefined){
				return;
			}
			location.href = contextPath + "/search/" + search_word.replaceAll(" ","");
		}
	});
}

fnObj.getWebtoonList = function() {
	var platform = $("#platform option:selected").val();
	var search_by_title = $("#search_by_title").val();
	var search_by_author = $("#search_by_author").val();
	
	var date_ranger= $("#kt_daterangepicker_1").val();
	var date_range = date_ranger.replace(/\//g, '');
	var date_range_array = date_range.split(" - ");
	var date_range_start = date_range_array[0];
	var date_range_end = date_range_array[1];
	
	var _url = contextPath + '/api/v1/webtoon/getWebtoonList';
	var _postData = {
		'search_count' : SEARCH_COUNT,
		'search_page' : pagination.getCurrPage(),
		'search_by_author' : search_by_author,
		'platform' : platform,
		'search_by_title' : search_by_title,
		'date_range' : date_range,
		'date_range_start' : date_range_start,
		'date_range_end' : date_range_end
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getWebtoonListCallback)
};

fnObj.getWebtoonListCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var data = response.data;
		var total_count = response.total_count;
		console.log(response);
		console.log(total_count);

		var html  = '';
		if (responseCode == "000") {
			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : " + total_count);

			$.each(data, function(index, item) {
				var platforms = item.platform_ids;
				var platform_array = platforms.split(',');
					
				html += '<tr>';
				html += '	<td>';
				html += '		<div class="d-flex align-items-center">';
				html += '			<div class="d-flex justify-content-start flex-column">';
				html += '				<span class="text-dark fw-bold d-block fs-7">'+ item.webtoon_id +'</span>';
				html += '			</div>';
				html += '		</div>';
				html += '	</td>';
				html += '	<td>';
				html += '		<button class="fs-5 text-gray-800 text-hover-primary fw-bolder crawl_btn webtoon"  data-bs-toggle="modal" data-bs-target="#kt_modal_new_target" onclick="fnObj.getWebtoonInfo(\''+ item.webtoon_id + '\')">'+ item.title +'</button>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-7">'+ item.author +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-7">'+ item.genre1 +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-7">'+ item.genre2 +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '		<span class="text-dark fw-bold d-block fs-7">'+ item.age_requirement +'</span>';
				html += '	</td>';
				html += '	<td>';
				html += '	    <div class="d-flex gap-2 mb-2">';
				
				for(var i in platform_array) {
					html += '		<img src="' + fnObj.getWebtoonImageURL(platform_array[i]) + '" class="w-30px" alt="">';
				}
				html += '	    </div>';
				html += '	</td>';
				html += '</tr>';
			});

			$("#webtoon_list").empty();
			$("#webtoon_list").append(html);
			pagination.drawPage(total_count);
			
		} else if(responseCode == "201") {
			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : 0");
			$("#webtoon_list").empty();
				html += '<tr>';
				html += '	<td colspan="6" style="text-align:center;">';
				html += '		<span class="text-dark fw-bold d-block fs-7">조회된 데이터가 없습니다.</span>';
				html += '	</td>';
				html += '</tr>';
			$("#webtoon_list").append(html);
			pagination.drawPage(0);
		} else {
			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : 0");
			$("#webtoon_list").empty();
				html += '<tr>';
				html += '	<td colspan="6" style="text-align:center;">';
				html += '		<span class="text-dark fw-bold d-block fs-7">조회된 데이터가 없습니다.</span>';
				html += '	</td>';
				html += '</tr>';
			$("#webtoon_list").append(html);
			pagination.drawPage(0);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}


$(document).ready(function() {
	fnObj.initEvent();
});
