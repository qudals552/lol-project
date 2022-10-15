<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="${pageContext.request.contextPath}/assets/js/views/search/search.js"></script>


<!--begin::Main-->
<div class="d-flex flex-row flex-column-fluid align-items-stretch">
	<!--begin::Content-->
	<div class="content flex-row-fluid" id="kt_content" style="margin-top: 4.5rem; border-radius: 0.95rem;">
	<!--begin::Toolbar-->
	<div class="toolbar d-flex flex-stack flex-wrap py-4 gap-2" id="kt_toolbar" style="justify-content: space-evenly; margin: 0px 2rem 2.5rem; border-radius: 0.95rem; margin-top: 3rem;">
		<!--begin::Page title-->
		<div class="page-title d-flex flex-column align-items-start me-3 gap-1">
			<!--begin::Title-->
			<h1 class="d-flex text-dark fw-bolder m-0 fs-3">소환사 검색
			<!--begin::Separator-->
			<span class="h-20px border-gray-400 border-start mx-3"></span>
			<!--end::Separator-->
			<!--begin::Description-->
			<small class="text-gray-500 fs-7 fw-bold my-1">KR-Server</small>
			<!--end::Description--></h1>
			<!--end::Title-->
		</div>
		<!--end::Page title-->
		<!--begin::Block-->
		<div class="d-lg-flex align-lg-items-center">
			<!--begin::Simple form-->
			<div class="rounded d-flex flex-column flex-lg-row align-items-lg-center bg-body p-5 w-xxl-850px h-lg-60px me-lg-10 my-5">
				<!--begin::Row-->
				<div class="row flex-grow-1 mb-5 mb-lg-0">
					<!--begin::Col-->
					<div class="col-lg-0 d-flex align-items-center mb-3 mb-lg-0">
						<!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
						<span class="svg-icon svg-icon-1 svg-icon-gray-400 me-1">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2" rx="1" transform="rotate(45 17.0365 15.1223)" fill="currentColor"></rect>
								<path d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z" fill="currentColor"></path>
							</svg>
						</span>
						<!--end::Svg Icon-->
						<!--begin::Input-->
						<input type="text" class="form-control form-control-flush flex-grow-1" id="search_word" name="search" value="" placeholder="Summoner Search">
						<!--end::Input-->
					</div>
					<!--end::Col-->
				</div>
				<!--end::Row-->
				<!--begin::Action-->
				<div class="min-w-150px text-end">
					<button type="button" class="btn btn-dark" id="search_btn">Search</button>
				</div>
				<!--end::Action-->
			</div>
			<!--end::Simple form-->
		</div>
		<!--end::Block-->
	</div>
	<!--end::Toolbar-->
	<div class="d-flex flex-column">
		
	</div>
		<!--begin::Row-->
		<div class="row gy-5 g-xl-8" style="margin-top: 3.5rem;">
			<!--begin::Col-->
			<div class="col-xl-4">
				<!--begin::List Widget 2-->
				<div class="card card-xl-stretch mb-xl-8">
					<!--begin::Header-->
					<div class="card-header border-0">
						<h3 class="card-title fw-bolder text-dark">월간 트롤러 BEST 5</h3>
						<div class="card-toolbar">
							<!--begin::Menu-->
							<button type="button" class="btn btn-sm btn-icon btn-color-primary btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
								<!--begin::Svg Icon | path: icons/duotune/general/gen024.svg-->
								<span class="svg-icon svg-icon-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="5" y="5" width="5" height="5" rx="1" fill="#000000" />
											<rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
										</g>
									</svg>
								</span>
								<!--end::Svg Icon-->
							</button>
							<!--begin::Menu 2-->
							<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px" data-kt-menu="true">
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<div class="menu-content fs-6 text-dark fw-bolder px-3 py-4">Quick Actions</div>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu separator-->
								<div class="separator mb-3 opacity-75"></div>
								<!--end::Menu separator-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">New Ticket</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">New Customer</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-start">
									<!--begin::Menu item-->
									<a href="#" class="menu-link px-3">
										<span class="menu-title">New Group</span>
										<span class="menu-arrow"></span>
									</a>
									<!--end::Menu item-->
									<!--begin::Menu sub-->
									<div class="menu-sub menu-sub-dropdown w-175px py-4">
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Admin Group</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Staff Group</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Member Group</a>
										</div>
										<!--end::Menu item-->
									</div>
									<!--end::Menu sub-->
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">New Contact</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu separator-->
								<div class="separator mt-3 opacity-75"></div>
								<!--end::Menu separator-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<div class="menu-content px-3 py-3">
										<a class="btn btn-primary btn-sm px-4" href="#">Generate Reports</a>
									</div>
								</div>
								<!--end::Menu item-->
							</div>
							<!--end::Menu 2-->
							<!--end::Menu-->
						</div>
					</div>
					<!--end::Header-->
					<!--begin::Body-->
					<div class="card-body pt-2">
						<!--begin::Item-->
						<div class="d-flex align-items-center mb-7">
							<!--begin::Avatar-->
							<div class="symbol symbol-50px me-5">
								<img src="assets/media/avatars/300-6.jpg" class="" alt="" />
							</div>
							<!--end::Avatar-->
							<!--begin::Text-->
							<div class="flex-grow-1">
								<a href="#" class="text-dark fw-bolder text-hover-primary fs-6">Emma Smith</a>
								<span class="text-muted d-block fw-bold">Project Manager</span>
							</div>
							<!--end::Text-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center mb-7">
							<!--begin::Avatar-->
							<div class="symbol symbol-50px me-5">
								<img src="assets/media/avatars/300-5.jpg" class="" alt="" />
							</div>
							<!--end::Avatar-->
							<!--begin::Text-->
							<div class="flex-grow-1">
								<a href="#" class="text-dark fw-bolder text-hover-primary fs-6">Sean Bean</a>
								<span class="text-muted d-block fw-bold">PHP, SQLite, Artisan CLI</span>
							</div>
							<!--end::Text-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center mb-7">
							<!--begin::Avatar-->
							<div class="symbol symbol-50px me-5">
								<img src="assets/media/avatars/300-11.jpg" class="" alt="" />
							</div>
							<!--end::Avatar-->
							<!--begin::Text-->
							<div class="flex-grow-1">
								<a href="#" class="text-dark fw-bolder text-hover-primary fs-6">Brian Cox</a>
								<span class="text-muted d-block fw-bold">PHP, SQLite, Artisan CLI</span>
							</div>
							<!--end::Text-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center mb-7">
							<!--begin::Avatar-->
							<div class="symbol symbol-50px me-5">
								<img src="assets/media/avatars/300-9.jpg" class="" alt="" />
							</div>
							<!--end::Avatar-->
							<!--begin::Text-->
							<div class="flex-grow-1">
								<a href="#" class="text-dark fw-bolder text-hover-primary fs-6">Francis Mitcham</a>
								<span class="text-muted d-block fw-bold">PHP, SQLite, Artisan CLI</span>
							</div>
							<!--end::Text-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center">
							<!--begin::Avatar-->
							<div class="symbol symbol-50px me-5">
								<img src="assets/media/avatars/300-23.jpg" class="" alt="" />
							</div>
							<!--end::Avatar-->
							<!--begin::Text-->
							<div class="flex-grow-1">
								<a href="#" class="text-dark fw-bolder text-hover-primary fs-6">Dan Wilson</a>
								<span class="text-muted d-block fw-bold">PHP, SQLite, Artisan CLI</span>
							</div>
							<!--end::Text-->
						</div>
						<!--end::Item-->
					</div>
					<!--end::Body-->
				</div>
				<!--end::List Widget 2-->
			</div>
			<!--end::Col-->
			<!--begin::Col-->
			<div class="col-xl-4">
				<!--begin::List Widget 6-->
				<div class="card card-xl-stretch mb-xl-8">
					<!--begin::Header-->
					<div class="card-header border-0">
						<h3 class="card-title fw-bolder text-dark">주간 트롤러 BEST 5</h3>
						<div class="card-toolbar">
							<!--begin::Menu-->
							<button type="button" class="btn btn-sm btn-icon btn-color-primary btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
								<!--begin::Svg Icon | path: icons/duotune/general/gen024.svg-->
								<span class="svg-icon svg-icon-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="5" y="5" width="5" height="5" rx="1" fill="#000000" />
											<rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
										</g>
									</svg>
								</span>
								<!--end::Svg Icon-->
							</button>
							<!--begin::Menu 3-->
							<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3" data-kt-menu="true">
								<!--begin::Heading-->
								<div class="menu-item px-3">
									<div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Payments</div>
								</div>
								<!--end::Heading-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">Create Invoice</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link flex-stack px-3">Create Payment
									<i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Specify a target name for future usage and reference"></i></a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">Generate Bill</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-end">
									<a href="#" class="menu-link px-3">
										<span class="menu-title">Subscription</span>
										<span class="menu-arrow"></span>
									</a>
									<!--begin::Menu sub-->
									<div class="menu-sub menu-sub-dropdown w-175px py-4">
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Plans</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Billing</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Statements</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu separator-->
										<div class="separator my-2"></div>
										<!--end::Menu separator-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content px-3">
												<!--begin::Switch-->
												<label class="form-check form-switch form-check-custom form-check-solid">
													<!--begin::Input-->
													<input class="form-check-input w-30px h-20px" type="checkbox" value="1" checked="checked" name="notifications" />
													<!--end::Input-->
													<!--end::Label-->
													<span class="form-check-label text-muted fs-6">Recuring</span>
													<!--end::Label-->
												</label>
												<!--end::Switch-->
											</div>
										</div>
										<!--end::Menu item-->
									</div>
									<!--end::Menu sub-->
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3 my-1">
									<a href="#" class="menu-link px-3">Settings</a>
								</div>
								<!--end::Menu item-->
							</div>
							<!--end::Menu 3-->
							<!--end::Menu-->
						</div>
					</div>
					<!--end::Header-->
					<!--begin::Body-->
					<div class="card-body pt-0">
						<!--begin::Item-->
						<div class="d-flex align-items-center bg-light-warning rounded p-5 mb-7">
							<!--begin::Icon-->
							<span class="svg-icon svg-icon-warning me-5">
								<!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
								<span class="svg-icon svg-icon-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
										<path opacity="0.3" d="M21.25 18.525L13.05 21.825C12.35 22.125 11.65 22.125 10.95 21.825L2.75 18.525C1.75 18.125 1.75 16.725 2.75 16.325L4.04999 15.825L10.25 18.325C10.85 18.525 11.45 18.625 12.05 18.625C12.65 18.625 13.25 18.525 13.85 18.325L20.05 15.825L21.35 16.325C22.35 16.725 22.35 18.125 21.25 18.525ZM13.05 16.425L21.25 13.125C22.25 12.725 22.25 11.325 21.25 10.925L13.05 7.62502C12.35 7.32502 11.65 7.32502 10.95 7.62502L2.75 10.925C1.75 11.325 1.75 12.725 2.75 13.125L10.95 16.425C11.65 16.725 12.45 16.725 13.05 16.425Z" fill="black" />
										<path d="M11.05 11.025L2.84998 7.725C1.84998 7.325 1.84998 5.925 2.84998 5.525L11.05 2.225C11.75 1.925 12.45 1.925 13.15 2.225L21.35 5.525C22.35 5.925 22.35 7.325 21.35 7.725L13.05 11.025C12.45 11.325 11.65 11.325 11.05 11.025Z" fill="black" />
									</svg>
								</span>
								<!--end::Svg Icon-->
							</span>
							<!--end::Icon-->
							<!--begin::Title-->
							<div class="flex-grow-1 me-2">
								<a href="#" class="fw-bolder text-gray-800 text-hover-primary fs-6">Group lunch celebration</a>
								<span class="text-muted fw-bold d-block">Due in 2 Days</span>
							</div>
							<!--end::Title-->
							<!--begin::Lable-->
							<span class="fw-bolder text-warning py-1">+28%</span>
							<!--end::Lable-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center bg-light-success rounded p-5 mb-7">
							<!--begin::Icon-->
							<span class="svg-icon svg-icon-success me-5">
								<!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
								<span class="svg-icon svg-icon-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
										<path opacity="0.3" d="M21.25 18.525L13.05 21.825C12.35 22.125 11.65 22.125 10.95 21.825L2.75 18.525C1.75 18.125 1.75 16.725 2.75 16.325L4.04999 15.825L10.25 18.325C10.85 18.525 11.45 18.625 12.05 18.625C12.65 18.625 13.25 18.525 13.85 18.325L20.05 15.825L21.35 16.325C22.35 16.725 22.35 18.125 21.25 18.525ZM13.05 16.425L21.25 13.125C22.25 12.725 22.25 11.325 21.25 10.925L13.05 7.62502C12.35 7.32502 11.65 7.32502 10.95 7.62502L2.75 10.925C1.75 11.325 1.75 12.725 2.75 13.125L10.95 16.425C11.65 16.725 12.45 16.725 13.05 16.425Z" fill="black" />
										<path d="M11.05 11.025L2.84998 7.725C1.84998 7.325 1.84998 5.925 2.84998 5.525L11.05 2.225C11.75 1.925 12.45 1.925 13.15 2.225L21.35 5.525C22.35 5.925 22.35 7.325 21.35 7.725L13.05 11.025C12.45 11.325 11.65 11.325 11.05 11.025Z" fill="black" />
									</svg>
								</span>
								<!--end::Svg Icon-->
							</span>
							<!--end::Icon-->
							<!--begin::Title-->
							<div class="flex-grow-1 me-2">
								<a href="#" class="fw-bolder text-gray-800 text-hover-primary fs-6">Navigation optimization</a>
								<span class="text-muted fw-bold d-block">Due in 2 Days</span>
							</div>
							<!--end::Title-->
							<!--begin::Lable-->
							<span class="fw-bolder text-success py-1">+50%</span>
							<!--end::Lable-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center bg-light-danger rounded p-5 mb-7">
							<!--begin::Icon-->
							<span class="svg-icon svg-icon-danger me-5">
								<!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
								<span class="svg-icon svg-icon-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
										<path opacity="0.3" d="M21.25 18.525L13.05 21.825C12.35 22.125 11.65 22.125 10.95 21.825L2.75 18.525C1.75 18.125 1.75 16.725 2.75 16.325L4.04999 15.825L10.25 18.325C10.85 18.525 11.45 18.625 12.05 18.625C12.65 18.625 13.25 18.525 13.85 18.325L20.05 15.825L21.35 16.325C22.35 16.725 22.35 18.125 21.25 18.525ZM13.05 16.425L21.25 13.125C22.25 12.725 22.25 11.325 21.25 10.925L13.05 7.62502C12.35 7.32502 11.65 7.32502 10.95 7.62502L2.75 10.925C1.75 11.325 1.75 12.725 2.75 13.125L10.95 16.425C11.65 16.725 12.45 16.725 13.05 16.425Z" fill="black" />
										<path d="M11.05 11.025L2.84998 7.725C1.84998 7.325 1.84998 5.925 2.84998 5.525L11.05 2.225C11.75 1.925 12.45 1.925 13.15 2.225L21.35 5.525C22.35 5.925 22.35 7.325 21.35 7.725L13.05 11.025C12.45 11.325 11.65 11.325 11.05 11.025Z" fill="black" />
									</svg>
								</span>
								<!--end::Svg Icon-->
							</span>
							<!--end::Icon-->
							<!--begin::Title-->
							<div class="flex-grow-1 me-2">
								<a href="#" class="fw-bolder text-gray-800 text-hover-primary fs-6">Rebrand strategy planning</a>
								<span class="text-muted fw-bold d-block">Due in 5 Days</span>
							</div>
							<!--end::Title-->
							<!--begin::Lable-->
							<span class="fw-bolder text-danger py-1">-27%</span>
							<!--end::Lable-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-center bg-light-info rounded p-5">
							<!--begin::Icon-->
							<span class="svg-icon svg-icon-info me-5">
								<!--begin::Svg Icon | path: icons/duotune/abstract/abs027.svg-->
								<span class="svg-icon svg-icon-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
										<path opacity="0.3" d="M21.25 18.525L13.05 21.825C12.35 22.125 11.65 22.125 10.95 21.825L2.75 18.525C1.75 18.125 1.75 16.725 2.75 16.325L4.04999 15.825L10.25 18.325C10.85 18.525 11.45 18.625 12.05 18.625C12.65 18.625 13.25 18.525 13.85 18.325L20.05 15.825L21.35 16.325C22.35 16.725 22.35 18.125 21.25 18.525ZM13.05 16.425L21.25 13.125C22.25 12.725 22.25 11.325 21.25 10.925L13.05 7.62502C12.35 7.32502 11.65 7.32502 10.95 7.62502L2.75 10.925C1.75 11.325 1.75 12.725 2.75 13.125L10.95 16.425C11.65 16.725 12.45 16.725 13.05 16.425Z" fill="black" />
										<path d="M11.05 11.025L2.84998 7.725C1.84998 7.325 1.84998 5.925 2.84998 5.525L11.05 2.225C11.75 1.925 12.45 1.925 13.15 2.225L21.35 5.525C22.35 5.925 22.35 7.325 21.35 7.725L13.05 11.025C12.45 11.325 11.65 11.325 11.05 11.025Z" fill="black" />
									</svg>
								</span>
								<!--end::Svg Icon-->
							</span>
							<!--end::Icon-->
							<!--begin::Title-->
							<div class="flex-grow-1 me-2">
								<a href="#" class="fw-bolder text-gray-800 text-hover-primary fs-6">Product goals strategy</a>
								<span class="text-muted fw-bold d-block">Due in 7 Days</span>
							</div>
							<!--end::Title-->
							<!--begin::Lable-->
							<span class="fw-bolder text-info py-1">+8%</span>
							<!--end::Lable-->
						</div>
						<!--end::Item-->
					</div>
					<!--end::Body-->
				</div>
				<!--end::List Widget 6-->
			</div>
			<!--end::Col-->
			<!--begin::Col-->
			<div class="col-xl-4">
				<!--begin::List Widget 4-->
				<div class="card card-xl-stretch mb-5 mb-xl-8">
					<!--begin::Header-->
					<div class="card-header border-0 pt-5">
						<h3 class="card-title align-items-start flex-column">
							<span class="card-label fw-bolder text-dark">명예 소환사 BEST 5</span>
							<span class="text-muted mt-1 fw-bold fs-7">Latest tech trends</span>
						</h3>
						<div class="card-toolbar">
							<!--begin::Menu-->
							<button type="button" class="btn btn-sm btn-icon btn-color-primary btn-active-light-primary" data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">
								<!--begin::Svg Icon | path: icons/duotune/general/gen024.svg-->
								<span class="svg-icon svg-icon-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<rect x="5" y="5" width="5" height="5" rx="1" fill="#000000" />
											<rect x="14" y="5" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="5" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
											<rect x="14" y="14" width="5" height="5" rx="1" fill="#000000" opacity="0.3" />
										</g>
									</svg>
								</span>
								<!--end::Svg Icon-->
							</button>
							<!--begin::Menu 3-->
							<div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-800 menu-state-bg-light-primary fw-bold w-200px py-3" data-kt-menu="true">
								<!--begin::Heading-->
								<div class="menu-item px-3">
									<div class="menu-content text-muted pb-2 px-3 fs-7 text-uppercase">Payments</div>
								</div>
								<!--end::Heading-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">Create Invoice</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link flex-stack px-3">Create Payment
									<i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Specify a target name for future usage and reference"></i></a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3">
									<a href="#" class="menu-link px-3">Generate Bill</a>
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3" data-kt-menu-trigger="hover" data-kt-menu-placement="right-end">
									<a href="#" class="menu-link px-3">
										<span class="menu-title">Subscription</span>
										<span class="menu-arrow"></span>
									</a>
									<!--begin::Menu sub-->
									<div class="menu-sub menu-sub-dropdown w-175px py-4">
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Plans</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Billing</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<a href="#" class="menu-link px-3">Statements</a>
										</div>
										<!--end::Menu item-->
										<!--begin::Menu separator-->
										<div class="separator my-2"></div>
										<!--end::Menu separator-->
										<!--begin::Menu item-->
										<div class="menu-item px-3">
											<div class="menu-content px-3">
												<!--begin::Switch-->
												<label class="form-check form-switch form-check-custom form-check-solid">
													<!--begin::Input-->
													<input class="form-check-input w-30px h-20px" type="checkbox" value="1" checked="checked" name="notifications" />
													<!--end::Input-->
													<!--end::Label-->
													<span class="form-check-label text-muted fs-6">Recuring</span>
													<!--end::Label-->
												</label>
												<!--end::Switch-->
											</div>
										</div>
										<!--end::Menu item-->
									</div>
									<!--end::Menu sub-->
								</div>
								<!--end::Menu item-->
								<!--begin::Menu item-->
								<div class="menu-item px-3 my-1">
									<a href="#" class="menu-link px-3">Settings</a>
								</div>
								<!--end::Menu item-->
							</div>
							<!--end::Menu 3-->
							<!--end::Menu-->
						</div>
					</div>
					<!--end::Header-->
					<!--begin::Body-->
					<div class="card-body pt-5">
						<!--begin::Item-->
						<div class="d-flex align-items-sm-center mb-7">
							<!--begin::Symbol-->
							<div class="symbol symbol-50px me-5">
								<span class="symbol-label">
									<img src="assets/media/svg/brand-logos/plurk.svg" class="h-50 align-self-center" alt="" />
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Section-->
							<div class="d-flex align-items-center flex-row-fluid flex-wrap">
								<div class="flex-grow-1 me-2">
									<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Top Authors</a>
									<span class="text-muted fw-bold d-block fs-7">Mark, Rowling, Esther</span>
								</div>
								<span class="badge badge-light fw-bolder my-2">+82$</span>
							</div>
							<!--end::Section-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-sm-center mb-7">
							<!--begin::Symbol-->
							<div class="symbol symbol-50px me-5">
								<span class="symbol-label">
									<img src="assets/media/svg/brand-logos/telegram.svg" class="h-50 align-self-center" alt="" />
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Section-->
							<div class="d-flex align-items-center flex-row-fluid flex-wrap">
								<div class="flex-grow-1 me-2">
									<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Popular Authors</a>
									<span class="text-muted fw-bold d-block fs-7">Randy, Steve, Mike</span>
								</div>
								<span class="badge badge-light fw-bolder my-2">+280$</span>
							</div>
							<!--end::Section-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-sm-center mb-7">
							<!--begin::Symbol-->
							<div class="symbol symbol-50px me-5">
								<span class="symbol-label">
									<img src="assets/media/svg/brand-logos/vimeo.svg" class="h-50 align-self-center" alt="" />
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Section-->
							<div class="d-flex align-items-center flex-row-fluid flex-wrap">
								<div class="flex-grow-1 me-2">
									<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">New Users</a>
									<span class="text-muted fw-bold d-block fs-7">John, Pat, Jimmy</span>
								</div>
								<span class="badge badge-light fw-bolder my-2">+4500$</span>
							</div>
							<!--end::Section-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-sm-center mb-7">
							<!--begin::Symbol-->
							<div class="symbol symbol-50px me-5">
								<span class="symbol-label">
									<img src="assets/media/svg/brand-logos/bebo.svg" class="h-50 align-self-center" alt="" />
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Section-->
							<div class="d-flex align-items-center flex-row-fluid flex-wrap">
								<div class="flex-grow-1 me-2">
									<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Active Customers</a>
									<span class="text-muted fw-bold d-block fs-7">Mark, Rowling, Esther</span>
								</div>
								<span class="badge badge-light fw-bolder my-2">+686$</span>
							</div>
							<!--end::Section-->
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div class="d-flex align-items-sm-center mb-7">
							<!--begin::Symbol-->
							<div class="symbol symbol-50px me-5">
								<span class="symbol-label">
									<img src="assets/media/svg/brand-logos/kickstarter.svg" class="h-50 align-self-center" alt="" />
								</span>
							</div>
							<!--end::Symbol-->
							<!--begin::Section-->
							<div class="d-flex align-items-center flex-row-fluid flex-wrap">
								<div class="flex-grow-1 me-2">
									<a href="#" class="text-gray-800 text-hover-primary fs-6 fw-bolder">Bestseller Theme</a>
									<span class="text-muted fw-bold d-block fs-7">Disco, Retro, Sports</span>
								</div>
								<span class="badge badge-light fw-bolder my-2">+726$</span>
							</div>
							<!--end::Section-->
						</div>
						<!--end::Item-->
					</div>
					<!--end::Body-->
				</div>
				<!--end::List Widget 4-->
			</div>
			<!--end::Col-->
		</div>
		<!--end::Row-->
		<!--begin::Modals-->
		<!--begin::Modal - New Product-->
		<div class="modal fade" id="kt_modal_add_event" tabindex="-1" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog modal-dialog-centered mw-650px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Form-->
					<form class="form" action="#" id="kt_modal_add_event_form">
						<!--begin::Modal header-->
						<div class="modal-header">
							<!--begin::Modal title-->
							<h2 class="fw-bolder" data-kt-calendar="title">Add Event</h2>
							<!--end::Modal title-->
							<!--begin::Close-->
							<div class="btn btn-icon btn-sm btn-active-icon-primary" id="kt_modal_add_event_close">
								<!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
								<span class="svg-icon svg-icon-1">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
										<rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="black" />
										<rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="black" />
									</svg>
								</span>
								<!--end::Svg Icon-->
							</div>
							<!--end::Close-->
						</div>
						<!--end::Modal header-->
						<!--begin::Modal body-->
						<div class="modal-body py-10 px-lg-17">
							<!--begin::Input group-->
							<div class="fv-row mb-9">
								<!--begin::Label-->
								<label class="fs-6 fw-bold required mb-2">Event Name</label>
								<!--end::Label-->
								<!--begin::Input-->
								<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_name" />
								<!--end::Input-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="fv-row mb-9">
								<!--begin::Label-->
								<label class="fs-6 fw-bold mb-2">Event Description</label>
								<!--end::Label-->
								<!--begin::Input-->
								<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_description" />
								<!--end::Input-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="fv-row mb-9">
								<!--begin::Label-->
								<label class="fs-6 fw-bold mb-2">Event Location</label>
								<!--end::Label-->
								<!--begin::Input-->
								<input type="text" class="form-control form-control-solid" placeholder="" name="calendar_event_location" />
								<!--end::Input-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="fv-row mb-9">
								<!--begin::Checkbox-->
								<label class="form-check form-check-custom form-check-solid">
									<input class="form-check-input" type="checkbox" value="" id="kt_calendar_datepicker_allday" />
									<span class="form-check-label fw-bold" for="kt_calendar_datepicker_allday">All Day</span>
								</label>
								<!--end::Checkbox-->
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row row-cols-lg-2 g-10">
								<div class="col">
									<div class="fv-row mb-9">
										<!--begin::Label-->
										<label class="fs-6 fw-bold mb-2 required">Event Start Date</label>
										<!--end::Label-->
										<!--begin::Input-->
										<input class="form-control form-control-solid" name="calendar_event_start_date" placeholder="Pick a start date" id="kt_calendar_datepicker_start_date" />
										<!--end::Input-->
									</div>
								</div>
								<div class="col" data-kt-calendar="datepicker">
									<div class="fv-row mb-9">
										<!--begin::Label-->
										<label class="fs-6 fw-bold mb-2">Event Start Time</label>
										<!--end::Label-->
										<!--begin::Input-->
										<input class="form-control form-control-solid" name="calendar_event_start_time" placeholder="Pick a start time" id="kt_calendar_datepicker_start_time" />
										<!--end::Input-->
									</div>
								</div>
							</div>
							<!--end::Input group-->
							<!--begin::Input group-->
							<div class="row row-cols-lg-2 g-10">
								<div class="col">
									<div class="fv-row mb-9">
										<!--begin::Label-->
										<label class="fs-6 fw-bold mb-2 required">Event End Date</label>
										<!--end::Label-->
										<!--begin::Input-->
										<input class="form-control form-control-solid" name="calendar_event_end_date" placeholder="Pick a end date" id="kt_calendar_datepicker_end_date" />
										<!--end::Input-->
									</div>
								</div>
								<div class="col" data-kt-calendar="datepicker">
									<div class="fv-row mb-9">
										<!--begin::Label-->
										<label class="fs-6 fw-bold mb-2">Event End Time</label>
										<!--end::Label-->
										<!--begin::Input-->
										<input class="form-control form-control-solid" name="calendar_event_end_time" placeholder="Pick a end time" id="kt_calendar_datepicker_end_time" />
										<!--end::Input-->
									</div>
								</div>
							</div>
							<!--end::Input group-->
						</div>
						<!--end::Modal body-->
						<!--begin::Modal footer-->
						<div class="modal-footer flex-center">
							<!--begin::Button-->
							<button type="reset" id="kt_modal_add_event_cancel" class="btn btn-light me-3">Cancel</button>
							<!--end::Button-->
							<!--begin::Button-->
							<button type="button" id="kt_modal_add_event_submit" class="btn btn-primary">
								<span class="indicator-label">Submit</span>
								<span class="indicator-progress">Please wait...
								<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
							</button>
							<!--end::Button-->
						</div>
						<!--end::Modal footer-->
					</form>
					<!--end::Form-->
				</div>
			</div>
		</div>
		<!--end::Modal - New Product-->
		<!--begin::Modal - New Product-->
		<div class="modal fade" id="kt_modal_view_event" tabindex="-1" aria-hidden="true">
			<!--begin::Modal dialog-->
			<div class="modal-dialog modal-dialog-centered mw-650px">
				<!--begin::Modal content-->
				<div class="modal-content">
					<!--begin::Modal header-->
					<div class="modal-header border-0 justify-content-end">
						<!--begin::Edit-->
						<div class="btn btn-icon btn-sm btn-color-gray-400 btn-active-icon-primary me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="Edit Event" id="kt_modal_view_event_edit">
							<!--begin::Svg Icon | path: icons/duotune/art/art005.svg-->
							<span class="svg-icon svg-icon-2">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<path opacity="0.3" d="M21.4 8.35303L19.241 10.511L13.485 4.755L15.643 2.59595C16.0248 2.21423 16.5426 1.99988 17.0825 1.99988C17.6224 1.99988 18.1402 2.21423 18.522 2.59595L21.4 5.474C21.7817 5.85581 21.9962 6.37355 21.9962 6.91345C21.9962 7.45335 21.7817 7.97122 21.4 8.35303ZM3.68699 21.932L9.88699 19.865L4.13099 14.109L2.06399 20.309C1.98815 20.5354 1.97703 20.7787 2.03189 21.0111C2.08674 21.2436 2.2054 21.4561 2.37449 21.6248C2.54359 21.7934 2.75641 21.9115 2.989 21.9658C3.22158 22.0201 3.4647 22.0084 3.69099 21.932H3.68699Z" fill="black" />
									<path d="M5.574 21.3L3.692 21.928C3.46591 22.0032 3.22334 22.0141 2.99144 21.9594C2.75954 21.9046 2.54744 21.7864 2.3789 21.6179C2.21036 21.4495 2.09202 21.2375 2.03711 21.0056C1.9822 20.7737 1.99289 20.5312 2.06799 20.3051L2.696 18.422L5.574 21.3ZM4.13499 14.105L9.891 19.861L19.245 10.507L13.489 4.75098L4.13499 14.105Z" fill="black" />
								</svg>
							</span>
							<!--end::Svg Icon-->
						</div>
						<!--end::Edit-->
						<!--begin::Edit-->
						<div class="btn btn-icon btn-sm btn-color-gray-400 btn-active-icon-danger me-2" data-bs-toggle="tooltip" data-bs-dismiss="click" title="Delete Event" id="kt_modal_view_event_delete">
							<!--begin::Svg Icon | path: icons/duotune/general/gen027.svg-->
							<span class="svg-icon svg-icon-2">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<path d="M5 9C5 8.44772 5.44772 8 6 8H18C18.5523 8 19 8.44772 19 9V18C19 19.6569 17.6569 21 16 21H8C6.34315 21 5 19.6569 5 18V9Z" fill="black" />
									<path opacity="0.5" d="M5 5C5 4.44772 5.44772 4 6 4H18C18.5523 4 19 4.44772 19 5V5C19 5.55228 18.5523 6 18 6H6C5.44772 6 5 5.55228 5 5V5Z" fill="black" />
									<path opacity="0.5" d="M9 4C9 3.44772 9.44772 3 10 3H14C14.5523 3 15 3.44772 15 4V4H9V4Z" fill="black" />
								</svg>
							</span>
							<!--end::Svg Icon-->
						</div>
						<!--end::Edit-->
						<!--begin::Close-->
						<div class="btn btn-icon btn-sm btn-color-gray-500 btn-active-icon-primary" data-bs-toggle="tooltip" title="Hide Event" data-bs-dismiss="modal">
							<!--begin::Svg Icon | path: icons/duotune/arrows/arr061.svg-->
							<span class="svg-icon svg-icon-1">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<rect opacity="0.5" x="6" y="17.3137" width="16" height="2" rx="1" transform="rotate(-45 6 17.3137)" fill="black" />
									<rect x="7.41422" y="6" width="16" height="2" rx="1" transform="rotate(45 7.41422 6)" fill="black" />
								</svg>
							</span>
							<!--end::Svg Icon-->
						</div>
						<!--end::Close-->
					</div>
					<!--end::Modal header-->
					<!--begin::Modal body-->
					<div class="modal-body pt-0 pb-20 px-lg-17">
						<!--begin::Row-->
						<div class="d-flex">
							<!--begin::Icon-->
							<!--begin::Svg Icon | path: icons/duotune/general/gen014.svg-->
							<span class="svg-icon svg-icon-1 svg-icon-muted me-5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<path opacity="0.3" d="M21 22H3C2.4 22 2 21.6 2 21V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5V21C22 21.6 21.6 22 21 22Z" fill="black" />
									<path d="M6 6C5.4 6 5 5.6 5 5V3C5 2.4 5.4 2 6 2C6.6 2 7 2.4 7 3V5C7 5.6 6.6 6 6 6ZM11 5V3C11 2.4 10.6 2 10 2C9.4 2 9 2.4 9 3V5C9 5.6 9.4 6 10 6C10.6 6 11 5.6 11 5ZM15 5V3C15 2.4 14.6 2 14 2C13.4 2 13 2.4 13 3V5C13 5.6 13.4 6 14 6C14.6 6 15 5.6 15 5ZM19 5V3C19 2.4 18.6 2 18 2C17.4 2 17 2.4 17 3V5C17 5.6 17.4 6 18 6C18.6 6 19 5.6 19 5Z" fill="black" />
									<path d="M8.8 13.1C9.2 13.1 9.5 13 9.7 12.8C9.9 12.6 10.1 12.3 10.1 11.9C10.1 11.6 10 11.3 9.8 11.1C9.6 10.9 9.3 10.8 9 10.8C8.8 10.8 8.59999 10.8 8.39999 10.9C8.19999 11 8.1 11.1 8 11.2C7.9 11.3 7.8 11.4 7.7 11.6C7.6 11.8 7.5 11.9 7.5 12.1C7.5 12.2 7.4 12.2 7.3 12.3C7.2 12.4 7.09999 12.4 6.89999 12.4C6.69999 12.4 6.6 12.3 6.5 12.2C6.4 12.1 6.3 11.9 6.3 11.7C6.3 11.5 6.4 11.3 6.5 11.1C6.6 10.9 6.8 10.7 7 10.5C7.2 10.3 7.49999 10.1 7.89999 10C8.29999 9.90003 8.60001 9.80003 9.10001 9.80003C9.50001 9.80003 9.80001 9.90003 10.1 10C10.4 10.1 10.7 10.3 10.9 10.4C11.1 10.5 11.3 10.8 11.4 11.1C11.5 11.4 11.6 11.6 11.6 11.9C11.6 12.3 11.5 12.6 11.3 12.9C11.1 13.2 10.9 13.5 10.6 13.7C10.9 13.9 11.2 14.1 11.4 14.3C11.6 14.5 11.8 14.7 11.9 15C12 15.3 12.1 15.5 12.1 15.8C12.1 16.2 12 16.5 11.9 16.8C11.8 17.1 11.5 17.4 11.3 17.7C11.1 18 10.7 18.2 10.3 18.3C9.9 18.4 9.5 18.5 9 18.5C8.5 18.5 8.1 18.4 7.7 18.2C7.3 18 7 17.8 6.8 17.6C6.6 17.4 6.4 17.1 6.3 16.8C6.2 16.5 6.10001 16.3 6.10001 16.1C6.10001 15.9 6.2 15.7 6.3 15.6C6.4 15.5 6.6 15.4 6.8 15.4C6.9 15.4 7.00001 15.4 7.10001 15.5C7.20001 15.6 7.3 15.6 7.3 15.7C7.5 16.2 7.7 16.6 8 16.9C8.3 17.2 8.6 17.3 9 17.3C9.2 17.3 9.5 17.2 9.7 17.1C9.9 17 10.1 16.8 10.3 16.6C10.5 16.4 10.5 16.1 10.5 15.8C10.5 15.3 10.4 15 10.1 14.7C9.80001 14.4 9.50001 14.3 9.10001 14.3C9.00001 14.3 8.9 14.3 8.7 14.3C8.5 14.3 8.39999 14.3 8.39999 14.3C8.19999 14.3 7.99999 14.2 7.89999 14.1C7.79999 14 7.7 13.8 7.7 13.7C7.7 13.5 7.79999 13.4 7.89999 13.2C7.99999 13 8.2 13 8.5 13H8.8V13.1ZM15.3 17.5V12.2C14.3 13 13.6 13.3 13.3 13.3C13.1 13.3 13 13.2 12.9 13.1C12.8 13 12.7 12.8 12.7 12.6C12.7 12.4 12.8 12.3 12.9 12.2C13 12.1 13.2 12 13.6 11.8C14.1 11.6 14.5 11.3 14.7 11.1C14.9 10.9 15.2 10.6 15.5 10.3C15.8 10 15.9 9.80003 15.9 9.70003C15.9 9.60003 16.1 9.60004 16.3 9.60004C16.5 9.60004 16.7 9.70003 16.8 9.80003C16.9 9.90003 17 10.2 17 10.5V17.2C17 18 16.7 18.4 16.2 18.4C16 18.4 15.8 18.3 15.6 18.2C15.4 18.1 15.3 17.8 15.3 17.5Z" fill="black" />
								</svg>
							</span>
							<!--end::Svg Icon-->
							<!--end::Icon-->
							<div class="mb-9">
								<!--begin::Event name-->
								<div class="d-flex align-items-center mb-2">
									<span class="fs-3 fw-bolder me-3" data-kt-calendar="event_name"></span>
									<span class="badge badge-light-success" data-kt-calendar="all_day"></span>
								</div>
								<!--end::Event name-->
								<!--begin::Event description-->
								<div class="fs-6" data-kt-calendar="event_description"></div>
								<!--end::Event description-->
							</div>
						</div>
						<!--end::Row-->
						<!--begin::Row-->
						<div class="d-flex align-items-center mb-2">
							<!--begin::Icon-->
							<!--begin::Svg Icon | path: icons/duotune/abstract/abs050.svg-->
							<span class="svg-icon svg-icon-1 svg-icon-success me-5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<circle fill="#000000" cx="12" cy="12" r="8" />
								</svg>
							</span>
							<!--end::Svg Icon-->
							<!--end::Icon-->
							<!--begin::Event start date/time-->
							<div class="fs-6">
								<span class="fw-bolder">Starts</span>
								<span data-kt-calendar="event_start_date"></span>
							</div>
							<!--end::Event start date/time-->
						</div>
						<!--end::Row-->
						<!--begin::Row-->
						<div class="d-flex align-items-center mb-9">
							<!--begin::Icon-->
							<!--begin::Svg Icon | path: icons/duotune/abstract/abs050.svg-->
							<span class="svg-icon svg-icon-1 svg-icon-danger me-5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
									<circle fill="#000000" cx="12" cy="12" r="8" />
								</svg>
							</span>
							<!--end::Svg Icon-->
							<!--end::Icon-->
							<!--begin::Event end date/time-->
							<div class="fs-6">
								<span class="fw-bolder">Ends</span>
								<span data-kt-calendar="event_end_date"></span>
							</div>
							<!--end::Event end date/time-->
						</div>
						<!--end::Row-->
						<!--begin::Row-->
						<div class="d-flex align-items-center">
							<!--begin::Icon-->
							<!--begin::Svg Icon | path: icons/duotune/general/gen018.svg-->
							<span class="svg-icon svg-icon-1 svg-icon-muted me-5">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
									<path opacity="0.3" d="M18.0624 15.3453L13.1624 20.7453C12.5624 21.4453 11.5624 21.4453 10.9624 20.7453L6.06242 15.3453C4.56242 13.6453 3.76242 11.4453 4.06242 8.94534C4.56242 5.34534 7.46242 2.44534 11.0624 2.04534C15.8624 1.54534 19.9624 5.24534 19.9624 9.94534C20.0624 12.0453 19.2624 13.9453 18.0624 15.3453Z" fill="black" />
									<path d="M12.0624 13.0453C13.7193 13.0453 15.0624 11.7022 15.0624 10.0453C15.0624 8.38849 13.7193 7.04535 12.0624 7.04535C10.4056 7.04535 9.06241 8.38849 9.06241 10.0453C9.06241 11.7022 10.4056 13.0453 12.0624 13.0453Z" fill="black" />
								</svg>
							</span>
							<!--end::Svg Icon-->
							<!--end::Icon-->
							<!--begin::Event location-->
							<div class="fs-6" data-kt-calendar="event_location"></div>
							<!--end::Event location-->
						</div>
						<!--end::Row-->
					</div>
					<!--end::Modal body-->
				</div>
			</div>
		</div>
		<!--end::Modal - New Product-->
		<!--end::Modals-->
	</div>
	<!--end::Content-->
</div>
<!--end::Main-->
