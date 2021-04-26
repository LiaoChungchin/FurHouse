<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon"> 
	
	<!-- Bootstrap CSS -->
	<link href="assets/css/bootstrap.css" rel="stylesheet">
	<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
	<!-- User Define CSS -->
	<link href="assets/css/index.css" rel="stylesheet">
	<style>
		.parallax {
			/* width: 100vw; */
			height:100vh;
			font-weight:bold;
			font-size:1.25rem;
			display:flex;
			justify-content:center;
			align-items:center;
		}
		.bg1 {
			background:url("assets/img/background/bg5.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
			text-shadow:white 0.1em 0.1em 0.2em;
		}
		.bg2 {
			background:url("assets/img/background/bg1.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
			text-shadow:white 0.1em 0.1em 0.2em;
		}
		.bg3 {
			background:url("assets/img/background/bg3.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
		}
		.bg4 {
			background:url("assets/img/background/bg4.jpg") no-repeat;
			background-size:cover;
			background-attachment:fixed;
		}
		.parallax .container-anime {
			padding-left:0%;
			padding-right:0%;
			margin-left:0%;
			margin-right:0%;
			padding-top:15%;
			width:900px;
			height:600px;
		}
		.parallax .container {
			padding-left:0%;
			padding-right:0%;
			margin-left:0%;
			margin-right:0%;
		}
		.parallax .badge {
			font-size:1.25rem;
			text-shadow:white 0em 0em 0em;
		}
		.ml9 {
			position:relative;
			font-weight:700;
			font-size:2em;
			margin-left:20%;
			display:inline-block;
		}
		.ml9 .text-wrapper {
			position:relative;
			display:inline-block;
			padding-right:0.05em;
			padding-top:1.2em;
			padding-bottom:1.1em;
			overflow:hidden;
			display:inline-block;
		}
 		.ml9 .letter {
			transform-origin:50% 100%;
			display:inline-block;
			line-height:1em;
 		}
 		.ml9 .keyLetter {
			transform-origin:50% 100%;
			display:inline-block;
			line-height:1em;
 		}
 		.ml9 .cross {
			transform: scale(0);
			display:inline-block;
			line-height:1em;
			color:#000000;
 		}
 		.line-drawing {
			line-height:1em;
 		}
 		.line-drawing .lines path{
 			transform:scale(0.7);
 		}
 		.myCatbow .logoFrame{
 			height:160px;
 			width:160px;
   			overflow:hidden;
 		}
 		.myCatbow .logoFrame img{
 			transform:translateY(160px);
 		}
 		.devide {
  			transform-origin:0% 50%;
 		}
 		.devide .lineUp{
 			height:2px;
 			width:210px;
 			background-color:black;
 		}
 		.devide .lineDown{
 			height:2px;
 			width:210px;
 			background-color:black;
 		}
 		span .letters{
 			display:inline-block;
 		}
	</style>
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/w3.js"></script>
	<script src="assets/js/jQuery-3.6.0.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/anime.min.js"></script>
	<!-- User Define JS -->
	<script src="assets/js/index.js"></script>
	
	<title>FurHouse</title>
	
	<%-- EL接收session中的member bean有沒有認證過 --%>
	<c:if test="${loginErrorMsg != null}">
		<script>
			window.alert("${loginErrorMsg}");
		</script>
	</c:if>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"
		w3-include-html="<c:url value='/addFrame.controller/header'/>"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2" id="menu-detail"
				w3-include-html="<c:url value='/addFrame.controller/aside'/>"></div>
			<div class="col-lg-10" id="div-v-pills">
			
				<div class="parallax bg1">
					<div class="container-anime">
						<h1 class="ml9">
						  <span class="text-wrapper">
						    <span class="letters">盼天下無浪貓，浪貓有家圖溫飽</span>
						    <br>
						    <span class="letters">離不開寶貝貓，你我是牠眼中寶</span>
						  </span>
						</h1>
						<div class="line-drawing">
							<svg width="300" height="62" viewBox="-1 -1 300 62">
								<defs>
								    <filter id="shadow">
								      <feDropShadow dx="0.2" dy="0.4" stdDeviation="0.2"/>
								    </filter>
								    <filter id="shadow2">
								      <feDropShadow dx="0" dy="0" stdDeviation="0.5"
								          flood-color="cyan"/>
								    </filter>
								    <filter id="shadow3">
								      <feDropShadow dx="2.5" dy="2.5" stdDeviation="2"
								          flood-color="white" flood-opacity="0.75"/>
								    </filter>
								  </defs>
								<g class="lines" id="svgGroup" stroke-linecap="round" fill-rule="evenodd" stroke="black" stroke-width="2" fill="none" filter="url(#shadow3)">
									<path d="M 283.711 14.106 L 291.27 14.106 L 284.854 58.228 L 275.581 58.228 L 269.209 39.771 L 267.935 35.288 L 266.484 40.034 L 260.376 58.228 L 251.367 58.228 L 244.995 14.106 L 252.466 14.106 L 256.157 44.077 L 256.948 50.757 L 258.838 44.912 L 265.254 25.093 L 270.747 25.093 L 277.646 44.648 L 279.624 50.493 L 280.283 44.297 L 283.711 14.106 Z" vector-effect="non-scaling-stroke"/>
									<path d="M 137.505 51.021 L 137.505 57.612 A 36.245 36.245 0 0 1 134.7 58.207 Q 133.461 58.42 132.184 58.553 A 39.783 39.783 0 0 1 132.144 58.557 A 53.99 53.99 0 0 1 128.649 58.803 A 56.18 56.18 0 0 1 126.519 58.843 A 34.594 34.594 0 0 1 125.247 58.82 Q 118.275 58.563 114.527 55.437 A 11.057 11.057 0 0 1 114.126 55.085 A 10.857 10.857 0 0 1 112.386 53.03 Q 110.29 49.828 110.066 44.786 A 27.803 27.803 0 0 1 110.039 43.55 L 110.039 20.522 L 97.69 20.522 L 97.69 14.106 L 110.039 14.106 L 110.039 1.978 L 117.686 0 L 117.686 14.106 L 137.505 14.106 L 137.505 20.522 L 117.686 20.522 L 117.686 42.935 A 16.464 16.464 0 0 0 117.714 43.909 Q 117.889 46.872 119.164 48.794 A 6.872 6.872 0 0 0 120.212 50.032 Q 122.739 52.383 127.661 52.383 A 28.957 28.957 0 0 0 128.741 52.362 Q 130.323 52.303 132.109 52.075 A 45.998 45.998 0 0 0 132.275 52.053 A 38.878 38.878 0 0 0 133.542 51.865 Q 135.011 51.622 136.554 51.256 A 50.16 50.16 0 0 0 137.505 51.021 Z " vector-effect="non-scaling-stroke"/>
									<path d="M 39.683 48.691 L 39.683 56.074 Q 32.996 58.842 25.691 58.928 A 39.845 39.845 0 0 1 25.225 58.931 A 39.024 39.024 0 0 1 23.725 58.902 Q 12.836 58.484 6.74 51.893 A 20.993 20.993 0 0 1 6.526 51.658 Q 0.054 44.445 0 30.384 A 61.748 61.748 0 0 1 0 30.146 A 50.992 50.992 0 0 1 0.028 28.442 Q 0.201 23.272 1.436 18.879 A 33.103 33.103 0 0 1 1.802 17.666 Q 3.441 12.589 6.352 8.913 A 23.352 23.352 0 0 1 6.943 8.196 Q 9.558 5.152 13.033 3.198 A 23.784 23.784 0 0 1 15.029 2.197 Q 19.674 0.133 25.412 0.089 A 32.672 32.672 0 0 1 25.664 0.088 A 45.113 45.113 0 0 1 27.144 0.112 Q 29.75 0.197 32.099 0.588 A 32.181 32.181 0 0 1 33.091 0.769 A 31.27 31.27 0 0 1 37.476 1.975 A 30.984 30.984 0 0 1 39.683 2.856 L 39.683 10.547 Q 36.563 8.833 33.223 7.932 A 24.208 24.208 0 0 0 31.514 7.538 Q 28.894 7.031 25.928 7.031 Q 21.885 7.031 18.611 8.547 A 15.163 15.163 0 0 0 16.204 9.94 Q 14.444 11.188 13.052 12.942 A 17.367 17.367 0 0 0 11.979 14.455 Q 10.81 16.302 9.993 18.575 A 25.874 25.874 0 0 0 9.536 19.973 Q 8.306 24.126 8.306 29.443 A 52.563 52.563 0 0 0 8.323 30.817 Q 8.57 40.263 12.268 45.522 A 15.434 15.434 0 0 0 12.832 46.274 Q 17.072 51.585 25.014 51.921 A 25.782 25.782 0 0 0 26.104 51.943 A 30.655 30.655 0 0 0 28.367 51.861 Q 29.606 51.769 30.809 51.575 A 27.336 27.336 0 0 0 33.179 51.086 A 32.979 32.979 0 0 0 39.683 48.691 Z" vector-effect="non-scaling-stroke"/>
									<path d="M 87.671 58.228 L 80.815 58.228 L 80.64 52.295 Q 77.402 55.493 74.076 57.094 A 17.962 17.962 0 0 1 73.323 57.437 Q 70.117 58.802 66.633 58.989 A 20.748 20.748 0 0 1 65.522 59.019 Q 61.743 59.019 59.063 58.052 Q 56.395 57.09 54.663 55.41 A 9.955 9.955 0 0 1 54.646 55.393 A 10.454 10.454 0 0 1 53.314 53.814 Q 52.629 52.814 52.186 51.657 A 10.925 10.925 0 0 1 52.097 51.416 Q 51.315 49.217 51.285 46.651 A 17.533 17.533 0 0 1 51.284 46.45 Q 51.284 40.348 55.465 36.68 A 14.013 14.013 0 0 1 56.228 36.057 A 13.84 13.84 0 0 1 57.495 35.202 Q 61.989 32.511 69.62 32.315 A 47.463 47.463 0 0 1 70.84 32.3 L 79.98 32.3 L 79.98 28.433 A 11.305 11.305 0 0 0 79.936 27.421 Q 79.665 24.396 77.722 22.412 A 8.145 8.145 0 0 0 77.476 22.17 A 7.015 7.015 0 0 0 76.373 21.327 Q 73.949 19.821 69.837 19.819 A 14.016 14.016 0 0 0 69.829 19.819 Q 66.094 19.819 62.468 20.654 Q 58.843 21.489 54.976 23.027 L 54.976 16.128 A 38.421 38.421 0 0 1 55.721 15.866 Q 56.512 15.597 57.389 15.333 A 58.013 58.013 0 0 1 58.206 15.095 Q 59.568 14.708 61.047 14.386 A 53.871 53.871 0 0 1 61.963 14.194 A 45.684 45.684 0 0 1 63.471 13.919 Q 64.748 13.708 66.094 13.557 A 38.919 38.919 0 0 1 70.17 13.316 A 39.865 39.865 0 0 1 70.444 13.315 A 34.447 34.447 0 0 1 71.901 13.346 Q 75.039 13.479 77.651 14.194 A 18.122 18.122 0 0 1 78.82 14.556 Q 80.979 15.308 82.633 16.53 A 12.328 12.328 0 0 1 83.079 16.875 A 11.622 11.622 0 0 1 85.905 20.234 A 12.84 12.84 0 0 1 86.484 21.401 Q 87.604 23.972 87.667 27.402 A 22.464 22.464 0 0 1 87.671 27.817 L 87.671 58.228 Z M 79.98 45.967 L 79.98 38.145 L 70.269 38.145 Q 67.592 38.145 65.61 38.646 A 12.391 12.391 0 0 0 65.347 38.716 Q 63.385 39.258 62.097 40.237 A 6.841 6.841 0 0 0 61.963 40.342 A 7.05 7.05 0 0 0 61.137 41.116 A 6.362 6.362 0 0 0 60.007 42.869 A 7.368 7.368 0 0 0 59.595 44.126 Q 59.37 45.091 59.37 46.187 A 7.708 7.708 0 0 0 59.517 47.699 A 7.355 7.355 0 0 0 59.766 48.625 A 5.42 5.42 0 0 0 61.013 50.663 A 5.959 5.959 0 0 0 61.04 50.691 Q 61.919 51.592 63.325 52.119 A 7.028 7.028 0 0 0 64.061 52.348 Q 65.086 52.609 66.377 52.642 A 14.843 14.843 0 0 0 66.753 52.646 A 9.377 9.377 0 0 0 67.682 52.599 Q 69.709 52.397 72.149 51.335 A 23.93 23.93 0 0 0 72.795 51.042 A 19.817 19.817 0 0 0 73.815 50.525 Q 76.762 48.923 79.98 45.967 Z" vector-effect="non-scaling-stroke"/>
									<path d="M 166.377 58.228 L 151.348 58.228 L 151.348 0.791 L 167.783 0.791 A 50.354 50.354 0 0 1 168.965 0.805 Q 186.987 1.228 186.987 14.766 A 18.447 18.447 0 0 1 186.943 16.05 Q 186.773 18.496 185.938 20.548 A 12.505 12.505 0 0 1 184.768 22.764 Q 182.549 26.104 177.539 27.729 A 16.69 16.69 0 0 1 180.356 28.519 A 16.457 16.457 0 0 1 181.956 29.224 A 13.48 13.48 0 0 1 183.902 30.421 A 13.139 13.139 0 0 1 185.625 31.948 A 11.932 11.932 0 0 1 187.12 33.896 Q 187.697 34.832 188.13 35.903 Q 188.873 37.744 189.018 39.954 A 16.699 16.699 0 0 1 189.053 41.045 A 20.086 20.086 0 0 1 189.005 42.437 Q 188.831 44.951 188.012 47.086 A 13.899 13.899 0 0 1 187.449 48.362 A 14.844 14.844 0 0 1 184.358 52.508 Q 183.71 53.121 182.977 53.672 A 16.928 16.928 0 0 1 182.878 53.745 A 17.951 17.951 0 0 1 181.369 54.748 Q 178.914 56.208 175.762 57.072 A 28.23 28.23 0 0 1 175.715 57.085 Q 172.105 58.068 167.795 58.205 A 44.532 44.532 0 0 1 166.377 58.228 Z M 167.168 31.86 L 159.17 31.86 L 159.17 51.636 L 167.432 51.636 Q 173.311 51.636 176.569 49.721 A 8.954 8.954 0 0 0 177.451 49.131 Q 180.702 46.66 180.746 41.454 A 16.974 16.974 0 0 0 180.747 41.309 Q 180.747 39.111 179.824 37.354 A 7.909 7.909 0 0 0 178.299 35.327 Q 177.857 34.9 177.338 34.525 A 9.687 9.687 0 0 0 177.144 34.387 Q 175.386 33.179 172.859 32.52 Q 170.672 31.949 168.007 31.872 A 29.168 29.168 0 0 0 167.168 31.86 Z M 167.256 7.383 L 159.17 7.383 L 159.17 25.356 L 166.992 25.356 A 23.654 23.654 0 0 0 168.141 25.329 Q 170.044 25.237 171.671 24.831 A 14.997 14.997 0 0 0 171.848 24.785 A 12.542 12.542 0 0 0 172.897 24.461 Q 174.147 24.013 175.161 23.33 A 9.031 9.031 0 0 0 175.583 23.027 A 8.047 8.047 0 0 0 177.805 20.443 A 8.603 8.603 0 0 0 178 20.061 Q 178.8 18.401 178.854 16.148 A 13.748 13.748 0 0 0 178.857 15.82 A 11.019 11.019 0 0 0 178.774 14.451 Q 178.651 13.472 178.35 12.561 A 9.641 9.641 0 0 0 178.33 12.502 A 5.89 5.89 0 0 0 176.951 10.257 A 6.734 6.734 0 0 0 176.484 9.822 Q 175.366 8.871 173.582 8.252 A 14.424 14.424 0 0 0 172.925 8.042 Q 170.965 7.466 168.098 7.393 A 33.38 33.38 0 0 0 167.256 7.383 Z" vector-effect="non-scaling-stroke"/>
									<path d="M 239.279 37.636 A 34.884 34.884 0 0 0 239.326 35.815 A 42.203 42.203 0 0 0 239.323 35.289 Q 239.271 31.13 238.395 27.703 A 24.31 24.31 0 0 0 237.942 26.147 A 23.623 23.623 0 0 0 237.545 25.033 Q 236.64 22.68 235.316 20.798 A 16.591 16.591 0 0 0 233.943 19.094 A 16.515 16.515 0 0 0 231.329 16.799 Q 229.62 15.591 227.571 14.788 A 19.091 19.091 0 0 0 226.821 14.512 Q 223.346 13.315 219.067 13.315 A 28.938 28.938 0 0 0 218.841 13.316 Q 214.012 13.354 210.19 15.007 Q 208.968 15.536 207.862 16.198 A 18.379 18.379 0 0 0 203.555 19.753 A 19.5 19.5 0 0 0 201.886 21.913 Q 200.78 23.569 199.969 25.5 A 24.207 24.207 0 0 0 199.38 27.048 A 24.249 24.249 0 0 0 199.289 27.321 Q 197.93 31.454 197.93 36.431 A 42.866 42.866 0 0 0 197.933 36.96 Q 197.997 42.128 199.314 46.143 A 23.943 23.943 0 0 0 199.626 47.035 Q 200.98 50.669 203.313 53.218 A 16.464 16.464 0 0 0 205.852 55.475 Q 206.859 56.2 207.987 56.78 A 18.26 18.26 0 0 0 209.685 57.546 A 19.091 19.091 0 0 0 210.435 57.822 Q 213.91 59.019 218.188 59.019 A 28.938 28.938 0 0 0 218.415 59.018 Q 223.244 58.98 227.065 57.327 Q 228.288 56.798 229.394 56.136 A 18.379 18.379 0 0 0 233.701 52.581 Q 235.915 50.099 237.287 46.805 A 24.414 24.414 0 0 0 237.876 45.242 A 25.53 25.53 0 0 0 238.445 43.312 Q 239.123 40.628 239.279 37.636 Z M 231.504 36.167 A 34.944 34.944 0 0 0 231.482 34.915 Q 231.363 31.603 230.603 29.026 A 18.555 18.555 0 0 0 230.238 27.916 Q 229.552 26.036 228.535 24.591 A 11.603 11.603 0 0 0 228.032 23.928 A 11.003 11.003 0 0 0 226.806 22.649 Q 225.544 21.532 223.967 20.852 Q 221.889 19.956 219.397 19.837 A 16.19 16.19 0 0 0 218.628 19.819 Q 216.132 19.819 214.16 20.53 A 9.797 9.797 0 0 0 212.761 21.16 A 12.139 12.139 0 0 0 211.255 22.136 A 11.519 11.519 0 0 0 208.762 24.741 Q 207.202 26.982 206.477 29.949 A 24.803 24.803 0 0 0 205.994 32.502 Q 205.85 33.562 205.792 34.655 A 28.31 28.31 0 0 0 205.752 36.167 A 34.989 34.989 0 0 0 205.774 37.419 Q 205.893 40.735 206.653 43.33 A 18.684 18.684 0 0 0 207.018 44.447 Q 207.682 46.28 208.657 47.695 A 11.54 11.54 0 0 0 209.224 48.45 A 11.171 11.171 0 0 0 210.336 49.628 A 10.551 10.551 0 0 0 213.267 51.526 Q 215.64 52.559 218.628 52.559 Q 221.124 52.559 223.096 51.848 A 9.797 9.797 0 0 0 224.495 51.218 A 12.139 12.139 0 0 0 226.001 50.242 A 11.519 11.519 0 0 0 228.494 47.637 Q 230.054 45.396 230.779 42.429 Q 231.504 39.463 231.504 36.167 Z" vector-effect="non-scaling-stroke"/></g>
								</g>
							</svg>
						</div>
						<div class="devide">
							<div class="lineUp"></div>
						</div>
						<div class="devide">
							<div class="lineDown"></div>
						</div>
						<div class="myCatbow">
							<div class="logoFrame">
								<img class="myLogo" src="assets\img\Catbow-nobg.png" alt="" height="160px">
							</div>
						</div>
					</div>
				</div>
				<div class="parallax bg2">
						<div class="container marketing">
							<div class="text-center my-lg-3">
								<h1>我們團隊</h1>
							</div>
							<div class="row">		
								<div class="text-center col-lg-3 offset-lg-2">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0919.jpeg" width="160" height="160">
									<h2 class="text-center">
										<span class="badge badge-pill badge-secondary">組長</span>
										廖崇欽
									</h2>
									<p class="text-justify text-center">學歷：<br>成功大學 機械工程學系 碩士</p><br>
									<p class="text-justify text-center">項目：<br>整合專案與專案版本控制，客服系統開發與維護</p>
								</div>
								<div class="text-center col-lg-3 offset-lg-2">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0797.jpeg" width="160" height="160">
									<h2 class="text-center">
										<span class="badge badge-pill badge-secondary">副組長</span>
										鄭弘翔
									</h2>
									<p class="text-justify text-center">學歷：<br>南臺科技大學 多媒體與電腦娛樂科學系 學士</p>
									<p class="text-justify text-center">項目：<br>資料庫系統建置，流浪貓預約看貓系統的開發與維護</p>
								</div>
							</div>
							<div class="row">		
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0918.jpeg" width="160" height="160">
									<h2 class="text-center">林純歆</h2>
									<p class="text-justify text-center">學歷：<br>中國文化大學 機械工程學系 學士</p>
									<p class="text-justify text-center">項目：<br>前端網頁建構，商品訂單系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0799.jpeg" width="160" height="160">
									<h2 class="text-center">羅振旂</h2>
									<p class="text-justify text-center">學歷：<br>真理大學 法律系 學士</p><br>
									<p class="text-justify text-center">項目：<br>後台框架設置，流浪貓名冊管理系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0800.jpeg" width="160" height="160">
									<h2 class="text-center">陳皓</h2>
									<p class="text-justify text-center">學歷：<br>真理大學 法律系 學士</p><br>
									<p class="text-justify text-center">項目：<br>後台框架設置，會員管理系統的開發與維護</p>
								</div>
								<div class="text-center col-lg-3">
									<img class="rounded rounded-circle mb-1"
										src="assets/img/team/IMG_0920.jpeg" width="160" height="160">
									<h2 class="text-center">李政瑩</h2>
									<p class="text-justify text-center">學歷：<br>淡江大學 化學系 學士</p><br>
									<p class="text-justify text-center">項目：<br>前端網頁建構，商品管理系統的開發與維護</p>
								</div>
							</div>
						</div>
				</div>
				<div class="parallax bg3">
					<div class="container marketing">
						<div class="text-center">
							<p>學習藍圖</p>
						</div>
						<div class="text-center">
							<img alt="" src="assets/img/eeit-092101.png" height="640px">
						</div>
					</div>
				</div>
				<div class="parallax bg4">使用技術</div>
			</div>
		</div>
	</div>

	<!-- 插入會員登入的 Modal start -->
	<c:if test="${sessionScope.login_user == null}">
		<div class="modal fade" id="component-login" tabindex="-1"
			role="dialog" aria-labelledby="LoginTitle" aria-hidden="true"
			w3-include-html="<c:url value='/component.login'/>"></div>
	</c:if>
	<c:if test="${sessionScope.login_user != null}">
		<div class="modal fade" id="component-login" tabindex="-1"
			role="dialog" aria-labelledby="LoginTitle" aria-hidden="true"
			w3-include-html="<c:url value='/component.relogin'/>"></div>
	</c:if>
	<!-- 插入會員登入的 Modal end -->
	
	<!-- 登入會員後會出現的會員專區連結 -->
	<c:if test="${sessionScope.login_user != null}">
		<script>
			$(document).ready(function () {
				$("a#anchor-login-modal").text("登出");
				let memberBadge = `<a class="btn btn-primary" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
				$("a#anchor-login-modal").before(memberBadge);
				$("a#myShoppingCart").attr("class","btn btn-outline-primary");
				$("a#myShoppingCart").attr("href","paymentS1");
				$("a#myShoppingCart>span").attr("class","badge btn-danger");
			});
		</script>
	</c:if>
	
	<c:if test="${sessionScope.login_user == null}">
		<script>
			$(document).ready(function (){
				$("body").on("click","a#myShoppingCart",function() {
					alert("請先登入會員喔~~~");
				});
			});
		</script>
	</c:if>
	
	<script>
	// Wrap every letter in a span
		var textWrapper = document.querySelectorAll(".ml9 .letters");
		for(let i = 0; i < textWrapper.length; i++){
			textWrapper[i].innerHTML = textWrapper[i].innerText.replace(/\S/g, "<span class='letter'>$&</span>");
		}
		$(".ml9 .letter:eq(5)").addClass("keyLetter");
		$(".ml9 .letter:eq(13)").addClass("keyLetter");
		$(".ml9 .letter:eq(19)").addClass("keyLetter");
		$(".ml9 .letter:eq(27)").addClass("keyLetter");
		$(".ml9 .letters").eq(0).append("<span class='cross'>+</span>");
		
		anime.timeline({loop: true})
			.add({
				targets:".ml9 .letter",
				scale:[0, 1],
				duration:1500,
				elasticity:600,
				delay:(el, i) => 100 * (i+1)
			}).add({
				targets:".ml9 .keyLetter",
				color:"rgba(0, 0, 0, 1)",
				duration:3000
			}).add({
				targets:".ml9>span>span>span[class='letter']",
				opacity:0,
				duration:3000,
				easing:"easeOutQuint"
			}).add({
				targets:".ml9>span>span>span[class*='keyLetter']",
				translateX:function(el, i, l){
					if(i == 1) return -280;
					if(i == 3) return -280;
					return 0;
				},
				duration:400,
				easing: "linear"
			},"-=800").add({
				targets:".ml9>span>span>span[class*='keyLetter']",
				translateY:function(el, i, l){
					if(i == 0) return -20;
					if(i == 1) return -20;
					if(i == 2) return 20;
					if(i == 3) return 20;
					return 0;
				},
				duration:1000
			}).add({
				targets:".ml9 .cross",
				translateX:-330,
				translateY:20,
				duration:400,
				easing:"linear",
				scale:{
				    value:[0, 1.5],
				    duration:200,
				    delay:400,
				},
			}, "-=1500").add({
				targets:".ml9 .cross",
				rotate:45,
				duration:450,
				easing:"linear"
		  	}).add({
				targets:".ml9>span>span>span[class*='keyLetter']",
				translateX: function(el, i, l){
					if(i == 0) return   -60;
					if(i == 1) return  -340;
					if(i == 2) return    60;
					if(i == 3) return  -220;
					return 0;				  
			},
				translateY: function(el, i, l){
					if(i == 0) return  20;
					if(i == 1) return  20;
					if(i == 2) return -29;
					if(i == 3) return -29;
					return 0;				  
				},
				duration:450,
				easing:"linear"
			}, "-=450").add({
				targets:".line-drawing",
				translateX:315,
				translateY:-85,
				duration:100,
				easing:"linear"
			}).add({
				targets:".line-drawing .lines path",
				strokeDashoffset:[anime.setDashoffset, 0],
				easing:"easeInOutSine",
				duration:3000,
				direction:"linear",
				delay:function(el, i) { return i * 250 },
				fill:['rgba(0, 0, 0, 0)', 'rgba(0, 0, 0, 1)']
			}).add({
				targets:".devide",
			  	translateX:function(el, i, l) {
					if(i == 0) return 315;
					if(i == 1) return 315;
					return 0;
				},
				translateY:function(el, i, l) {
					if(i == 0) return -154;
					if(i == 1) return -154;
					return 0;
				},
				duration:100,
				easing:"linear"
			}).add({
				targets:[".devide .lineUp", ".devide .lineDown"],
				scaleX:[0, 1],
				duration:1000,
				easing:"linear"
			}).add({
				targets:".myCatbow",
				translateX:350,
		  		translateY:-316,
		  		duration:1000,
		  		endDelay: 2000,
			  	easing:"linear"
			}, "-=1000").add({
			  	targets:".myLogo",
			  	translateY:[160, 100],
			  	duration:2000,
			  	easing:"linear"
			}).add({
			  	targets:".ml9",
			  	translateY:[0, -60],
			  	duration:2000,
			  	easing:"linear"
			}, "-=2000").add({
			  	targets:".devide",
			  	translateY:function(el, i){
			  		if(i == 0) return [-154, -214];
			  	},
			  	duration:2000,
			  	easing:"linear"
			}, "-=2000").add({
				targets:".myLogo",
				translateY:[100, 5],
				duration:500,
				delay:1000,
				easing:"easeOutElastic"
			}).add({
				targets:".ml9",
				translateY:[-60, -170],
				duration:500,
				easing:"easeOutExpo"
			}, "-=500").add({
				targets:".devide",
				translateY:function(el, i){
		  			if(i == 0) return [-214, -324];
		  		},
				duration:500,
				easing:"easeOutExpo"
			}, "-=500").add({
				targets:".ml9",
				translateY:[-170, -155],
				duration:500,
				easing:"easeOutElastic",
				delay:500,
			}).add({
				targets:".devide",
				translateY:function(el, i){
		  			if(i == 0) return [-324, -309];
		  		},
				duration:500,
				easing:"easeOutElastic"
			}, "-=500").add({
				targets:".container-anime",
				opacity:0,
				duration:3000,
				delay:1000,
				easing:"easeOutQuint",
			});
	</script>
	
	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>
</body>
</html>