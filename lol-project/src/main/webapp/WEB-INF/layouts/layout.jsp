<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:eval expression="@environment.getProperty('cloud.front.domain.name')" var="CLOUD_FRONT_DOMAIN_NAME" />

<!DOCTYPE html>
<html lang="ko">

<!--begin::Head-->
<head><base href="">
	<title>TOT::LOL 유저평가</title>
	<meta charset="utf-8" />
	<meta name="description" content="The most advanced Bootstrap Admin Theme on Themeforest trusted by 94,000 beginners and professionals. Multi-demo, Dark Mode, RTL support and complete React, Angular, Vue &amp; Laravel versions. Grab your copy now and get life-time updates for free." />
	<meta name="keywords" content="Metronic, bootstrap, bootstrap 5, Angular, VueJs, React, Laravel, admin themes, web design, figma, web development, free templates, free admin themes, bootstrap theme, bootstrap template, bootstrap dashboard, bootstrap dak mode, bootstrap button, bootstrap datepicker, bootstrap timepicker, fullcalendar, datatables, flaticon" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta property="og:locale" content="en_US" />
	<meta property="og:type" content="article" />
	<meta property="og:title" content="Metronic - Bootstrap 5 HTML, VueJS, React, Angular &amp; Laravel Admin Dashboard Theme" />
	<meta property="og:url" content="https://keenthemes.com/metronic" />
	<meta property="og:site_name" content="Keenthemes | Metronic" />
	<link rel="canonical" href="https://preview.keenthemes.com/metronic8" />
	<link rel="shortcut icon" href="assets/media/logos/favicon.ico" />
	
	<!-- ycorp -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/common.js"></script>
<%-- 	<link href="${pageContext.request.contextPath}/assets/css/ycorp/ycorp.css" rel="stylesheet" type="text/css" /> --%>
	
	<!--begin::Fonts-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
	<!--end::Fonts-->
	<!--begin::Page Vendor Stylesheets(used by this page)-->
	<link href="${pageContext.request.contextPath}/assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/assets/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
	<!--end::Page Vendor Stylesheets-->
	<!--begin::Global Stylesheets Bundle(used by all pages)-->
	<link href="${pageContext.request.contextPath}/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
	<!--end::Global Stylesheets Bundle-->
	
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	
	<!--begin::Javascript-->
		<script>var hostUrl = "assets/";</script>
		<!--begin::Global Javascript Bundle(used by all pages)-->
		<script src="${pageContext.request.contextPath}/assets/plugins/global/plugins.bundle.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/scripts.bundle.js"></script>
		<!--end::Global Javascript Bundle-->
		<!--begin::Page Vendors Javascript(used by this page)-->
		<script src="${pageContext.request.contextPath}/assets/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
		<script src="${pageContext.request.contextPath}/assets/plugins/custom/datatables/datatables.bundle.js"></script>
		<!--end::Page Vendors Javascript-->
		<!--begin::Page Custom Javascript(used by this page)-->
		<script src="${pageContext.request.contextPath}/assets/js/widgets.bundle.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom/widgets.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom/apps/chat/chat.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom/utilities/modals/upgrade-plan.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom/utilities/modals/create-app.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/custom/utilities/modals/users-search.js"></script>
		<!--end::Page Custom Javascript-->
		<!--end::Javascript-->
</head>
<!--end::Head-->

<body id="kt_body" class="header-fixed header-tablet-and-mobile-fixed toolbar-enabled">
	<!--begin::Root-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="page d-flex flex-row flex-column-fluid">
			<!--begin::Header-->
<!-- 			<div id="kt_header" class="header" data-kt-sticky="true" data-kt-sticky-name="header" data-kt-sticky-offset="{default: '200px', lg: '300px'}"> -->
<%-- 				<tiles:insertAttribute name="header" /> --%>
<!-- 			</div> -->
			<!--end::Header-->
<%-- 			<tiles:insertAttribute name="sidebar" /> --%>
			<!--begin::Wrapper-->
			<div class="wrapper d-flex flex-column flex-row-fluid container-xxl" id="kt_wrapper">
				<tiles:insertAttribute name="content" />
				<tiles:insertAttribute name="footer" />
			</div>
			<!--end::Wrapper-->
		</div>
	</div>
<%-- 	<tiles:insertAttribute name="popup" /> --%>
</body>
</html>
