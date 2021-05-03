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
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">

<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap-icons.css" rel="stylesheet">
<!-- User Define CSS -->
<link rel="stylesheet" href="assets/css/leaflet.css" />
<link rel="stylesheet" href="assets/css/MarkerCluster.css" />
<link rel="stylesheet" href="assets/css/MarkerCluster.Default.css" />
<link href="assets/css/index.css" rel="stylesheet">
<style>
#map {
	width: 70%;
	height: 82vh;
	float: left;
}

.rightside {
	width: 30%;
	float: right;
}

.storeNameTable::-webkit-scrollbar {
	width: 0 !important;
}

.storeNameTable {
	width: 100%;
	height: 75vh;
	overflow-x: hidden;
	overflow-y: scroll;
}

.toolong {
	width: 250px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<!-- User Define JS -->
<script src="assets/js/leaflet.js"></script>
<script src="assets/js/leaflet.markercluster-src.js"></script>
<script src="assets/js/index.js"></script>
<script>
	$(function() {
		$("div#menu-detail").show();
		$("div#menu-detail>div>a[class~='active']").removeClass("active");
		$("div#menu-detail>div>a>small:contains('寵物友善餐廳')").parent().addClass(
				"active");
		// 分隔線要顯示
		$("div#menu-detail>div>a:contains('友善地圖')").next().show();
		// 所有子項目要顯示
		$("div#menu-detail>div>a>small:contains('寵物友善餐廳')").parent().show();
	});
</script>
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

				<div id="map"></div>

				<div class="d-flex justify-content-around rightside row">
					<input type="text" class="form-control col-md-5"
						style="margin-bottom: 15px;" id="storeNameSearch"> <select
						class="form-control col-md-5" id="selectRegion">
						<option value="all">全臺灣</option>
						<option value="台北市">台北市</option>
						<option value="台中市">台中市</option>
						<option value="台南市">台南市</option>
						<option value="高雄市">高雄市</option>
						<option value="台東市">台東市</option>
					</select>
					<div class="storeNameTable"></div>
				</div>
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
			$(document)
					.ready(
							function() {
								$("a#anchor-login-modal").text("登出");
								let memberBadge = `<a class="btn btn-primary" href="<c:url value='/member.myPage'/>" role="button"> Hi ~ ${sessionScope.login_user.account} <span class='badge badge-light'> 0 </span> </a>`;
								$("a#anchor-login-modal").before(memberBadge);
							});
		</script>
	</c:if>

	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>

	<script>
		$(document).ready(function() {
			createData();
		})

		$('#selectRegion').on('change', function() {
			let myRegion = this.value;
			if (myRegion != "all") {
				$.ajax({
					type : "GET",
					url : "selectSomeMapByRegion/" + myRegion,
					dataType : "json",
					beforeSend : function(XMLHttpRequest) {
// 						console.log("gif");
					},
					success : function(maps) {
						writetable(maps);
					},
					error : function(xhr, ajaxOptions, thrownError) {
						let nodata = [ {
							storeName : '查無資料'
						} ]
						writetable(nodata);
// 						console.log(xhr.status + "\n" + thrownError);
					}
				});
			} else {
				createData();
			}
		})

		/*模糊查詢*/
		$("#storeNameSearch").on("keyup", function() {
			let myStoreName = $("#storeNameSearch").val();
			if (myStoreName.length != 0) {
				$.ajax({
					type : "GET",
					url : "selectSomeMapBystoreName/" + myStoreName,
					dataType : "json",
					beforeSend : function(XMLHttpRequest) {
// 						console.log("gif");
					},
					success : function(maps) {
						if (maps != null) {
							writetable(maps);
						} else {
							createData();
						}
					},
					error : function(xhr, ajaxOptions, thrownError) {
						let nodata = [ {
							storeName : '查無資料'
						} ]
						writetable(nodata);
// 						console.log(xhr.status + "\n" + thrownError);
					}
				});
			} else {
				createData();
			}
		})

		/*-------------------------地圖-----------------------------*/

		var alldata;
		/*取得後臺資料*/
		function createData() {
			$.ajax({
				type : "GET",
				url : "selectAllMap",
				dataType : "json",
				beforeSend : function(XMLHttpRequest) {
// 					console.log("gif"); 
				},
				success : function(response) {
					if (alldata == null) {
						createMarker(response);
					}
					;
					alldata = response;
					writetable(response);
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.status + "\n" + thrownError);
				}
			});
		}

		/*設定map與Layer*/
		var map;
		map = L.map('map').setView([ 23.797088003857067, 120.83413767268159 ],
				7);

		L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
			attribution : '<a href="https://www.openstreetmap.org/">OSM</a>',
			maxZoom : 18,
		}).addTo(map);

		var myIcon = L.icon({
			iconUrl : 'assets/css/images/marker-icon-2x-green.png',
			iconSize : [ 25, 41 ],
			iconAnchor : [ 12, 41 ],
			popupAnchor : [ 0, -34 ],
			shadowUrl : 'assets/css/images/marker-shadow.png',
			shadowSize : [ 41, 41 ],
			shadowAnchor : [ 12, 41 ],
			className : myIcon
		});

		//         var data = [
		//             { id:0, name: "兔 Dreams 複合式咖啡寵物餐廳",address:"106台北市大安區新生南路一段161巷10號1號出口1分鐘紅線捷運大安森林公園站1樓",phone:"0227030037",mapimage:"/map/map1.jpg",lat: 25.03470013617105, lng: 121.53474538104331 },
		//             { id:1, name: "益生寵愛寵物餐廳",address:"10667台北市大安區和平東路二段265巷7號",phone:"0227083289",mapimage:"/map/map2.jpg" ,lat: 25.02756357102076, lng: 121.54348172372552 },
		//             { id:2, name: "曜日義式餐酒館",address:"106台北市大安區東豐街53號1 樓",phone:"0227085910",mapimage:"/map/map3.jpg" ,lat: 25.038295577003428, lng: 121.54717244327074 },
		//             { id:3, name: "Woodid우리手作韓食（寵物友善餐廳）",address:"106台北市大安區仁愛路四段300巷19弄6號",phone:"0227017739",mapimage:"/map/map4.jpg" ,lat: 25.03814004738934, lng: 121.55429639029988 },
		//             { id:4, name: "貓咪貓咪6s 桌遊披薩吃到飽餐廳（台北東區旗艦店)",address:"106台北市大安區忠孝東路四段15號2樓之3",phone:"0966249068",mapimage:"/map/map5.jpg" ,lat: 25.043431685720645, lng: 121.54472683238332},

		//         ]

		// 定義maker集合為makers
		var markers = new L.MarkerClusterGroup().addTo(map);
		function createMarker(data) {
			// 當有多筆資料的時候跑迴圈, 把每一個定義好的maker都加到集合體上.
			for (let i = 0; i < data.length; i++) {
				markers
						.addLayer(L
								.marker([ data[i].lat, data[i].lng ], {
									icon : myIcon
								})
								.bindPopup(
										"<p class='toolong'><b style='font-size: medium;'>"
												+ data[i].storeName
												+ "</b><p>地址: "
												+ data[i].address
												+ "<p>電話: "
												+ data[i].phone
												+ "<p><img src='assets/img" + data[i].mapImage + "' width='180px' height='120px'>")
								.bindTooltip(data[i].storeName, {
									direction : 'left',
									sticky : true,
									permanent : false,
									opacity : 1.0
								}).openTooltip().on('click', changecolor));
			}
			// 最後把集合體加到map上
			map.addLayer(markers);
		}

		/*點擊變色*/
		function changecolor(layer) {
			$("img.leaflet-marker-icon").attr("src",
					"assets/css/images/marker-icon-2x-green.png");
			this._icon.src = "assets/css/images/marker-icon-2x.png";
		}

		/*表格事件*/
		const popup = L.popup();
		$('.storeNameTable')
				.on(
						"click",
						".chooselocal",
						function() {
							let cid = this.id;
							let data;

							alldata.forEach(function(element) {
								if (element.id == cid) {
									data = element;
								}
							});

							let lat = data.lat;
							let lng = data.lng;

							popup
									.setLatLng([ lat + 0.00018, lng ])
									.setContent(
											"<p class='toolong'><b style='font-size: medium;'>"
													+ data.storeName
													+ "</b><p>地址: "
													+ data.address
													+ "<p>電話: "
													+ data.phone
													+ "<p><img src='assets/img" + data.mapImage + "' width='180px' height='120px'>")
									.openOn(map);

							map.setView([ lat, lng ], 15);

						});
		/*表格內容*/
		function writetable(data) {
			let tempstr = "<table class='table table-bordered table-hover'>";
			tempstr += "<thead class='thead-light'><tr><th>店家名稱</th></tr></thead>";
			for (let i = 0; i < data.length; i++) {
				tempstr += "<tr class='chooselocal' id='"+data[i].id+"'><td>"
						+ data[i].storeName + "</td></tr>";
			}
			tempstr += "</table>";

			$('.storeNameTable').html(tempstr);
		}

		// /*周圍*/
		// console.log(getMaxMinLongitudeLatitude(25.02756357102076,121.54348172372552,2));

		// function getMaxMinLongitudeLatitude(longitude,latitude,distince){
		//     console.log("MaxMinLongitudeLatitude",longitude,latitude);
		//     let r = 6371.393; 
		//     let lng = longitude;
		//     let lat = latitude;
		//     let dlng = 2 * Math.asin(Math.sin(distince / (2 * r)) / Math.cos(lat * Math.PI / 180));
		//     dlng = dlng * 180 / Math.PI;
		//     let dlat = distince / r;
		//     dlat = dlat * 180 / Math.PI;
		//     let minlat = lat - dlat;
		//     let maxlat = lat + dlat;
		//     let minlng = lng - dlng;
		//     let maxlng = lng + dlng;

		//     return minlng + "-" + maxlng + "-" + minlat + "-" + maxlat; 
		// }

		/**********************使用者位置******************************/
		//          /*抓取使用者位置*/
		//           map.locate({ setView: true, maxZoom: 15 });
		//          /*成功抓取function*/
		//          function onLocationFound(e) {
		//              let radius = 1000;
		//              L.marker(e.latlng).addTo(map)
		//                  .bindPopup("現在位置").openPopup();
		//              L.circle(e.latlng, radius).addTo(map);
		//          }
		//        	 map.on('locationfound', onLocationFound);
		//          /*失敗抓取function*/
		//          function onLocationError(e) {
		//              alert("無法判斷您的所在位置，無法使用此功能。");
		//              map.setView([23.827088003857067, 120.83413767268159], 8);
		//          }
		//          map.on('locationerror', onLocationError);
	</script>
</body>
</html>