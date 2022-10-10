var fnObj = {};
const SEARCH_COUNT = 10;
const USER_OS = commonObj.getOs();
var webtoon_detail_array = [];
var target = document.querySelector("#card_tab");
var blockUI = new KTBlockUI(target, {
    message: '<div class="blockui-message"><span class="spinner-border text-primary"></span> 처리중...</div>',
});

fnObj.initEvent = function() {

	$('#crawl_tag').hide();
	$('#crawl_url').hide();
	$('#webtoon_tag').hide();

	if($('#crawl_webtoon_id').val() == ''){
		$("#insert_btn").prop("disabled", true);
	}
	if($('#webtoon_webtoon_id').val() == ''){
		$("#update_btn").prop("disabled", true);
	}

	$(document).on("click", "input:radio[name=webtoon_option]", function() {
		var radio_val = $("input:radio[name=webtoon_option]:checked").val();
		fnObj.getWebtoonDetail(radio_val);
	});

	$("#platform_list").on("change", function() {
		blockUI.block();
		var crawl_type = $("#platform_list option:selected").val().toLowerCase();
		fnObj.getNotInsertList(crawl_type);
	});

	$("input[name=search]").on("keyup",function(key){
        if(key.keyCode==13) {
            var crawl_type = $("#platform_list option:selected").val().toLowerCase();
			fnObj.getNotInsertList(crawl_type);
        }
    });

	$("#search_btn").on("click", function() {
		var crawl_type = $("#platform_list option:selected").val().toLowerCase();
		fnObj.getNotInsertList(crawl_type);
	});

	$("#insert_btn").on("click", function() {
		var crawl_type = $("#platform_list option:selected");

		if(confirm(crawl_type.text() + '의 ' + $("#crawl_title").val() + '\n정말로 위 데이터를 신규웹툰으로 넣으시겠습니까?')){
			fnObj.insertWebtoon(crawl_type.val().toLowerCase());
			fnObj.resetWebtoonPage();
		}
	});

	$("#update_btn").on("click", function() {
		var crawl_type = $("#platform_list option:selected");

		if(confirm(crawl_type.text() + '의 ' + $("#crawl_title").val() + '\n정말로 위의 기존웹툰정보를 갱신 하시겠습니까?')){
			fnObj.updateWebtoon(crawl_type.val().toLowerCase());
			fnObj.resetWebtoonPage();
		}
	});


	$("button[name=copy_btn]").on("click", function() {
		let id = $(this).data("id");
		let c_id = id.replace('crawl', 'webtoon');

		$("#"+id).attr("disabled", false);

		$("#"+id).select();
		document.execCommand('copy');

		$("#"+id).attr("disabled", true);


		if($("#"+id).val() != null && $("#"+id).val() != ""){

			toastr.info('클립보드에 복사 되었습니다.');

		}

/*		$("#"+c_id).val($("#"+id).val());

		if($("#"+id).val() != $("#"+c_id).val()){
			$("#"+c_id).addClass('check');
		}else{
			$("#"+c_id).removeClass('check');
		}

		const img_id = $(this).parent().parent().find('img').attr('id');

		if(img_id != null && img_id != ''){
			const c_img_id = img_id.replace('crawl', 'webtoon');
			console.log(c_img_id);
			$("#"+c_img_id).attr("src", $("#"+img_id).attr("src"));
		}
*/
	});

	$("input[name=product_name]").change(function(){
		let c_id = $(this).attr('id');
		let id = c_id.replace('webtoon', 'crawl');

		if($("#"+c_id).val() != $("#"+id).val()){
			$(this).addClass('check');
		}else{
			$(this).removeClass('check');
		}
	});

	$("textarea[name=product_name]").change(function(){
		let c_id = $(this).attr('id');
		let id = c_id.replace('webtoon', 'crawl');

		if($("#"+c_id).val() != $("#"+id).val()){
			$(this).addClass('check');
		}else{
			$(this).removeClass('check');
		}
	});

	$("select[name=product_name]").change(function(){
		let c_id = $(this).attr('id');
		let id = c_id.replace('webtoon', 'crawl');

		if($("#"+c_id).val() != $("#"+id).val()){
			$(this).addClass('check');
		}else{
			$(this).removeClass('check');
		}
	});

}

fnObj.resetWebtoonPage = function(){
	$('#webtoon_url_list').empty();
	$('.radio-list').empty();

	$("#crawl_url").hide();
	$("#crawl_webtoon_id").val('');
	$("#crawl_tag_box").val('');
	$("#crawl_title").val('');
	$("#crawl_thumbnail").val('');
	$("#crawl_introduce").val('');
	$("#crawl_author").val('');
	$("#crawl_genre1").val('');
	$("#crawl_genre2").val('');
	$("#crawl_genre3").val('');
	$("#crawl_days").val('');
	$("#crawl_age_requirement").val('');
	$("#crawl_charge_at").val('');
	$("#crawl_finalize_yn").val('');
	$("#crawl_img").attr("src", '');

	$("#webtoon_webtoon_id").val('');
	$("#webtoon_title").val('');
	$("#webtoon_thumbnail").val('');
	$("#webtoon_introduce").val('');
	$("#webtoon_author").val('');
	$("#webtoon_genre1").val('');
	$("#webtoon_genre2").val('');
	$("#webtoon_genre3").val('');
	$("#webtoon_days").val('');
	$("#webtoon_age_requirement").val('');
	$("#webtoon_charge_at").val('');
	$("#webtoon_finalize_yn").val('');
	$("#webtoon_img").attr("src", '');

	$("#insert_btn").prop("disabled", true);
	$("#update_btn").prop("disabled", true);
}

fnObj.insertWebtoon = function(crawl_type){ // 크롤링 정보로 신규웹툰 추가
	var _url = contextPath + '/api/v1/crawl/insertWebtoon';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type,
		'platform_id' : crawl_type,
		'id' : $('#crawl_webtoon_id').val(),
		'title' : $('#crawl_title').val(),
		'thumbnail' : $('#crawl_thumbnail').val(),
		'introduce' : $('#crawl_introduce').val(),
		'url' : $('#crawl_url_data').val(),
		'author' : $('#crawl_author').val(),
		'genre1' : $('#crawl_genre1').val(),
		'genre2' : $('#crawl_genre2').val(),
		'genre3' : $('#crawl_genre3').val(),
		'days' : $('#crawl_days').val(),
		'age_requirement' : $('#crawl_age_requirement').val(),
		'charge_at' : $('#crawl_charge_at').val(),
		'finalize_yn' : $('#crawl_finalize_yn').val(),
	};

	commonObj.ajaxCall(_url, _postData, fnObj.insertWebtoonCallback);
}

fnObj.insertWebtoonCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;

		if (responseCode == "000") {
			fnObj.getNotInsertList($("#platform_list option:selected").val().toLowerCase());
			alert('성공적으로 신규웹툰을 추가했습니다!');
		} else {
			alert('신규웹툰 추가 중 오류가 발생했습니다.');
			console.log(responseCode);
			console.log(responseMessage);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}

fnObj.updateWebtoon = function(crawl_type){
	var _url = contextPath + '/api/v1/crawl/updateWebtoon';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type,
		'platform_id' : crawl_type,
		'crawl_webtoon_id' : $('#crawl_webtoon_id').val(),
		'url' : $('#crawl_url').attr('href'),
		'id' : $('#crawl_webtoon_id').val(),
		'webtoon_id' : $('#webtoon_webtoon_id').val(),
		'title' : $('#webtoon_title').val(),
		'author' : $('#webtoon_author').val(),
		'thumbnail' : $('#webtoon_thumbnail').val(),
		'introduce' : $('#webtoon_introduce').val(),
		'genre1' : $('#webtoon_genre1').val(),
		'genre2' : $('#webtoon_genre2').val(),
		'genre3' : $('#webtoon_genre3').val(),
		'days' : $('#webtoon_days').val(),
		'age_requirement' : $('#webtoon_age_requirement').val(),
		'charge_at' : $('#webtoon_charge_at').val(),
		'finalize_yn' : $('#webtoon_finalize_yn').val(),
	};

	commonObj.ajaxCall(_url, _postData, fnObj.updateWebtoonCallback);
}

fnObj.updateWebtoonCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;

		if (responseCode == "000") {
			fnObj.getNotInsertList($("#platform_list option:selected").val().toLowerCase());
			alert('성공적으로 기존웹툰 정보를 업데이트 했습니다!');
		} else {
			alert('업데이트 처리중 오류가 발생했습니다.');
			console.log(responseCode);
			console.log(responseMessage);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}

fnObj.getWebtoonDetail = function(radio_val){

	$('#webtoon_url_list').empty();
	var webtoon_url = (webtoon_detail_array[radio_val].url).split(",");
	var webtoon_platform_id = (webtoon_detail_array[radio_val].platform_id).split(",");

	for(var i = 0; i < webtoon_url.length; i++){
		$('#webtoon_url_list').append('<a href="' + webtoon_url[i] +'" type="text" class="mb-2" style="margin: 0.25rem;" target="_blank">'+ webtoon_platform_id[i] +'</a>');
	}

	$("#webtoon_webtoon_id").val(webtoon_detail_array[radio_val].webtoon_id);
	$("#webtoon_title").val(webtoon_detail_array[radio_val].title);
	$("#webtoon_thumbnail").val(webtoon_detail_array[radio_val].thumbnail);
	$("#webtoon_img").attr("src", webtoon_detail_array[radio_val].thumbnail);
	$("#webtoon_introduce").val(webtoon_detail_array[radio_val].introduce);
	$("#webtoon_author").val(webtoon_detail_array[radio_val].author);
	$("#webtoon_genre1").val(webtoon_detail_array[radio_val].genre1);
	$("#webtoon_genre2").val(webtoon_detail_array[radio_val].genre2);
	$("#webtoon_genre3").val(webtoon_detail_array[radio_val].genre3);
	$("#webtoon_days").val(webtoon_detail_array[radio_val].days);
	$("#webtoon_age_requirement").val(webtoon_detail_array[radio_val].age_requirement);
	$("#webtoon_charge_at").val(webtoon_detail_array[radio_val].charge_at).prop("selected", true);
	$("#webtoon_finalize_yn").val(webtoon_detail_array[radio_val].finalize_yn).prop("selected", true);

	$(".copy_col").each(function(index, item){
		let id = $(this).attr('id');
		let c_id = id.replace('crawl', 'webtoon');

		if($("#"+id).val() != $("#"+c_id).val()){
			$("#"+c_id).addClass('check');
		}else{
			$("#"+c_id).removeClass('check');
		}
	});

	if($("#crawl_charge_at").val() != $("#webtoon_charge_at").val()){
		$("#webtoon_charge_at").addClass('check');
	} else {
		$("#webtoon_charge_at").removeClass('check');
	}
	if($("#crawl_finalize_yn").val() != $("#webtoon_finalize_yn").val()){
		$("#webtoon_finalize_yn").addClass('check');
	} else {
		$("#webtoon_finalize_yn").removeClass('check');
	}
}

fnObj.getCrawlWebtoonDetail = function(webtoon_id) {
	var crawl_type = $("#platform_list option:selected").val().toLowerCase();
	var tag_yn = 'N';
	// 태그컬럼이 있는 플랫폼(탑툰, 봄툰, 코미카, 폭스툰)
	if(crawl_type.match("toptoon") || crawl_type.match("bomtoon") || crawl_type.match("comica") || crawl_type.match("foxtoon")){
		tag_yn = 'Y';
	}
	var _url = contextPath + '/api/v1/crawl/getCrawlWebtoonDetail';
	var _postData = {
		'crawl_type' : "crawl_" + crawl_type,
		'webtoon_id' : webtoon_id,
		'tag_yn' : tag_yn
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getCrawlWebtoonDetailCallback);
};

fnObj.getCrawlWebtoonDetailCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var data = response.data;
		var crawl_type = $("#platform_list option:selected").val().toLowerCase();

		if (responseCode == "000") {
			webtoon_detail_array = [];
			$('#crawl_tag').hide();
			$('#webtoon_tag').hide();
			$('#webtoon_url_list').empty();
			$('.radio-list').empty();
			$("#webtoon_webtoon_id").val('');
			$("#webtoon_title").val('');
			$("#webtoon_thumbnail").val('');
			$("#webtoon_img").attr("src", '');
			$("#webtoon_introduce").val('');
			$("#webtoon_author").val('');
			$("#webtoon_genre1").val('');
			$("#webtoon_genre2").val('');
			$("#webtoon_genre3").val('');
			$("#webtoon_days").val('');
			$("#webtoon_age_requirement").val('');
			$("#webtoon_charge_at").val('');
			$("#webtoon_finalize_yn").val('');


			$("#crawl_genre1").prop("disabled", true);
			$("#crawl_genre2").prop("disabled", true);
			$("#crawl_genre3").prop("disabled", true);
			$("#crawl_webtoon_id").val(data.id);
			$("#crawl_title").val(data.title);
			$("#crawl_thumbnail").val(data.thumbnail);
			$("#crawl_img").attr("src", data.thumbnail);
			$("#crawl_introduce").val(data.introduce);
			$("#crawl_url_data").val(data.url);
			$("#crawl_url").show();
			$('#crawl_url').prop('href', data.url);
			$("#crawl_author").val(data.author);
			$("#crawl_genre1").val(data.genre1);
			$("#crawl_genre2").val(data.genre2);
			$("#crawl_genre3").val(data.genre3);
			$("#crawl_days").val(data.days);
			$("#crawl_age_requirement").val(data.age_requirement);
			$("#crawl_charge_at").val(data.charge_at);
			$("#crawl_finalize_yn").val(data.finalize_yn);
			if(data.tag != null && data.tag != 'undefined' && data.tag != ''){ // 태그컬럼이 있으면 태그를 보여준다
				$('#crawl_tag').show();
				$('#webtoon_tag').show();
				$('#crawl_tag_box').val(data.tag);
				$("#crawl_genre1").prop("disabled", false);
				$("#crawl_genre2").prop("disabled", false);
				$("#crawl_genre3").prop("disabled", false);
			}
			fnObj.getWebtoonDetailList();
		} else {
			console.log(responseCode);
			console.log(responseMessage);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}
}

fnObj.getWebtoonDetailList = function() {
	var title = $('#crawl_title').val();
	var _url = contextPath + '/api/v1/crawl/getWebtoonDetailList';
	var _postData = {
		'title' : title
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getWebtoonDetailListCallback);
};

fnObj.getWebtoonDetailListCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var data = response.data;
		var total_count = response.total_count;
		var html = '';

		if (responseCode == "000") {

			$('.radio-list').empty();
			webtoon_detail_array = [];
			$.each(data, function(index, item) {
				webtoon_detail_array.push(item);

				html  = '<span class="form-check form-check-custom form-check-solid form-check-sm align-items-start mt-1 radio-btn" style="margin: 0.2rem;">';
				if(index == 0){
					html += '	<input class="form-check-input" type="radio" name="webtoon_option" value="' + index + '" checked="checked">';
				} else {
					html += '	<input class="form-check-input" type="radio" name="webtoon_option" value="' + index + '">';
				}
				html += '</span>';

				$('.radio-list').append(html);
			});

			fnObj.getWebtoonDetail(0); // 처음으로 나온 것

		} else {
			console.log(responseCode);
			console.log(responseMessage);
		}
	} catch (e) {
		console.log(e);
		console.log(response);
	}

	if($('#webtoon_webtoon_id').val() != '' && $('#webtoon_webtoon_id').val() != null && $('#webtoon_webtoon_id').val() != 'undefined'){
		$("#insert_btn").prop("disabled", false);
		$("#update_btn").prop("disabled", false);
	} else {
		$("#insert_btn").prop("disabled", true);
		$("#update_btn").prop("disabled", true);
	}
}

fnObj.getNotInsertList = function(crawl_type) {
	var _url = contextPath + '/api/v1/crawl/getNotInsertList';
	var title = $('#search_title').val();
	var author = $('#search_author').val();
	var _postData = {
		'title' : title,
		'author' : author,
		'crawl_type' : "crawl_" + crawl_type,
		'search_count' : SEARCH_COUNT,
		'search_page' : pagination.getCurrPage()
	};

	commonObj.ajaxCall(_url, _postData, fnObj.getNotInsertListCallback);
};

fnObj.getNotInsertListCallback = function(response, status, xhr) {
	try {
		var responseCode = response.response_code;
		var responseMessage = response.response_message;
		var data = response.data;
		var total_count = response.total_count;
		var html  = '';

		if (responseCode == "000") {
			$('#erorr_table').empty();
			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : " + total_count);

			$.each(data, function(index, item) {
				html += '<tr onclick="fnObj.getCrawlWebtoonDetail('+ item.id +')" style="cursor: pointer;">';
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

		} else if(responseCode == "201") {
			var html  = '';

			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : 0");

			html += '<div class="card card-flush py-4 flex-row-fluid overflow-hidden error-card">';
			html += '	<div class="position-absolute top-0 end-0 opacity-10 pe-none text-end">';
			html += '		<img src="'+ contextPath +'/assets/media/icons/duotune/ecommerce/ecm006.svg" class="w-175px">';
			html += '	</div>';
			html += '	<div class="card-header">';
			html += '		<div class="card-title">';
			html += '			<h2>'+ $("#platform_list option:selected").text() +'에 추가할 웹툰이 없습니다.</h2>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="card-body pt-0">추가할 웹툰이 발견되지 않았습니다.<br><br><br>';
			html += '	</div>';
			html += '</div>';

			$('#webtoon_list').empty();
			$('#erorr_table').empty();
			$('#erorr_table').append(html);

		} else {
			var html  = '';

			$('#webtoon_count').empty();
			$('#webtoon_count').append("웹툰 개수 : 0");

			html += '<div class="card card-flush py-4 flex-row-fluid overflow-hidden error-card">';
			html += '	<div class="position-absolute top-0 end-0 opacity-10 pe-none text-end">';
			html += '		<img src="'+ contextPath +'/assets/media/icons/duotune/ecommerce/ecm006.svg" class="w-175px">';
			html += '	</div>';
			html += '	<div class="card-header">';
			html += '		<div class="card-title">';
			html += '			<h2>알 수 없는 오류가 발생했습니다.</h2>';
			html += '		</div>';
			html += '	</div>';
			html += '	<div class="card-body pt-0"><br><br><br>';
			html += '	</div>';
			html += '</div>';

			$('#webtoon_list').empty();
			$('#erorr_table').empty();
			$('#erorr_table').append(html);

		}
	} catch (e) {
		console.log(e);
		console.log(response);
	} finally{
		if (blockUI.isBlocked()) {
	        blockUI.release();
	    }
	}
}

var pagination = new PageObject();

fn_go_page = function(page) {
	pagination.setCurrPage(page);
}

$(document).ready(function() {
	commonObj.setPlatformList('combo', 'platform_list', null);
	fnObj.initEvent();
	pagination.init($(".pagination"), 1, SEARCH_COUNT);
});
