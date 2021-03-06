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

.nav-pills a:hover,.dropdown-divider:focus{
	    color: #ff4e0d;
	    cursor:url("assets/img/mouse.png"),pointer;
}

#menu-detail{
	box-shadow:10px 0px 12px -8px rgba(255,199,162,0.37),-6px 0px 8px -4px rgba(255,199,162,0.37); 
}

</style>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="assets/js/w3.js"></script>
<script src="assets/js/jQuery-3.6.0.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<!-- User Define JS -->
<script src="assets/js/leaflet.js"></script>
<script src="assets/js/leaflet.markercluster-src.js"></script>
<script src="assets/js/index.js"></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
<script src="assets/js/sweetalert.min.js"></script>
<script>
	$(function() {
		$("div#menu-detail").show();
		$("div#menu-detail>div>a[class~='active']").removeClass("active");
		$("div#menu-detail>div>a>small:contains('??????????????????')").parent().addClass(
				"active");
		// ??????????????????
		$("div#menu-detail>div>a:contains('????????????')").next().show();
		// ????????????????????????
		$("div#menu-detail>div>a>small:contains('??????????????????')").parent().show();
	});
</script>
<title>FurHouse</title>

<%-- EL??????session??????member bean?????????????????? --%>
<c:if test="${loginErrorMsg != null}">
	<script>
		window.alert("${loginErrorMsg}");
	</script>
</c:if>
</head>
<body>
	<div
		class="d-flex flex-column flex-md-row align-items-center p-2 px-md-4 mb-3 bg-white border-bottom shadow-sm"
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
						<option value="all">?????????</option>
						<option value="?????????">?????????</option>
						<option value="?????????">?????????</option>
						<option value="?????????">?????????</option>
						<option value="?????????">?????????</option>
						<option value="?????????">?????????</option>
					</select>
					<div class="storeNameTable"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- ????????????????????? Modal start -->
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
	<!-- ????????????????????? Modal end -->

	<!-- ????????????????????????????????????????????? -->
	<c:if test="${sessionScope.login_user != null}">
		<script>
			$(document).ready(function() {
				$("a#anchor-login-modal").text("??????");
				let memberBadge = `<a class="btn btn-warning" href="<c:url value='/member.myPage'/>" role="button">${sessionScope.login_user.name},??????</a>`;
				$("a#anchor-login-modal").before(memberBadge);
                $("a#myShoppingCart").attr("class",
                "btn btn-outline-warning");
	            $("a#myShoppingCart").attr("href", "paymentS1");
	            $("a#myShoppingCart>span").attr("class",
	                "badge btn-danger");
	            $("a#goBuyIt").removeClass("disabled");
			});
		</script>
	</c:if>
	<c:if test="${sessionScope.login_user == null}">
        <script>
            $(document).ready(function () {
                $("body").on("click", "a#myShoppingCart", function () {
                	swal("?????????????????????!", "?????????~~~", "warning");
                });
				if(localStorage.myProducts != null || localStorage.myProducts == ""){
					localStorage.removeItem('myProducts');
				}
				$("a#goBuyIt").addClass("disabled");
            });
        </script>
    </c:if>

	<footer class="pt-4 my-md-5 pt-md-5 border-top"
		w3-include-html="<c:url value='/addFrame.controller/footer'/>"></footer>

	<script>
		$(document).ready(function() {
			createData();
		})

		$('#selectRegion').on('click', function() {
			let RegionData = [
				{name:"?????????", lat: 25.037133596918775, lng: 121.56360440559632},
				{name:"?????????", lat: 24.16219751644647, lng: 120.64902347628696},
				{name:"?????????", lat: 22.986924395388716, lng: 120.18496912570596},
				{name:"?????????", lat: 22.615233150370504, lng: 120.31102698669244},
				{name:"?????????", lat: 22.751378178843673, lng: 121.14622961220473},
			]

			map.closePopup();
			
			let myRegion = this.value;
			if (myRegion != "all") {
				
				RegionData.forEach(function(thisRegion){
					if(thisRegion.name == myRegion){
						map.setView([ thisRegion.lat, thisRegion.lng ], 10);
					}
				});
				
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
							storeName : '????????????'
						} ]
						writetable(nodata);
// 						console.log(xhr.status + "\n" + thrownError);
					}
				});
			} else {
				createData();
				map.setView([ 23.797088003857067, 120.83413767268159 ], 7);
			}
		})

		/*????????????*/
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
							storeName : '????????????'
						} ]
						writetable(nodata);
// 						console.log(xhr.status + "\n" + thrownError);
					}
				});
			} else {
				createData();
			}
		})

		/*-------------------------??????-----------------------------*/

		var alldata;
		/*??????????????????*/
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

		/*??????map???Layer*/
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
		//             { id:0, name: "??? Dreams ???????????????????????????",address:"106????????????????????????????????????161???10???1?????????1???????????????????????????????????????1???",phone:"0227030037",mapimage:"/map/map1.jpg",lat: 25.03470013617105, lng: 121.53474538104331 },
		//             { id:1, name: "????????????????????????",address:"10667????????????????????????????????????265???7???",phone:"0227083289",mapimage:"/map/map2.jpg" ,lat: 25.02756357102076, lng: 121.54348172372552 },
		//             { id:2, name: "?????????????????????",address:"106???????????????????????????53???1 ???",phone:"0227085910",mapimage:"/map/map3.jpg" ,lat: 25.038295577003428, lng: 121.54717244327074 },
		//             { id:3, name: "Woodid??????????????????????????????????????????",address:"106?????????????????????????????????300???19???6???",phone:"0227017739",mapimage:"/map/map4.jpg" ,lat: 25.03814004738934, lng: 121.55429639029988 },
		//             { id:4, name: "????????????6s ???????????????????????????????????????????????????)",address:"106????????????????????????????????????15???2??????3",phone:"0966249068",mapimage:"/map/map5.jpg" ,lat: 25.043431685720645, lng: 121.54472683238332},

		//         ]

		// ??????maker?????????makers
		var markers = new L.MarkerClusterGroup().addTo(map);
		function createMarker(data) {
			// ????????????????????????????????????, ????????????????????????maker?????????????????????.
			for (let i = 0; i < data.length; i++) {
				markers
						.addLayer(L
								.marker([ data[i].lat, data[i].lng ], {
									icon : myIcon
								})
								.bindPopup(
										"<p class='toolong'><b style='font-size: medium;'>"
												+ data[i].storeName
												+ "</b><p>??????: "
												+ data[i].address
												+ "<p>??????: "
												+ data[i].phone
												+ "<p><img src='assets/img" + data[i].mapImage + "' width='180px' height='120px'>")
								.bindTooltip(data[i].storeName, {
									direction : 'left',
									sticky : true,
									permanent : false,
									opacity : 1.0
								}).openTooltip().on('click', changecolor));
			}
			// ????????????????????????map???
			map.addLayer(markers);
		}

		/*????????????*/
		function changecolor(layer) {
			$("img.leaflet-marker-icon").attr("src",
					"assets/css/images/marker-icon-2x-green.png");
			this._icon.src = "assets/css/images/marker-icon-2x.png";
		}

		/*????????????*/
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
													+ "</b><p>??????: "
													+ data.address
													+ "<p>??????: "
													+ data.phone
													+ "<p><img src='assets/img" + data.mapImage + "' width='180px' height='120px'>")
									.openOn(map);

							map.setView([ lat, lng ], 15);

						});
		/*????????????*/
		function writetable(data) {
			let tempstr = "<table class='table table-bordered table-hover'>";
			tempstr += "<thead class='thead-light'><tr><th>????????????</th></tr></thead>";
			for (let i = 0; i < data.length; i++) {
				tempstr += "<tr class='chooselocal' id='"+data[i].id+"'><td>"
						+ data[i].storeName + "</td></tr>";
			}
			tempstr += "</table>";

			$('.storeNameTable').html(tempstr);
		}


// 		function onMapClick(e) {
// 		  let lat = e.latlng.lat; // ??????
// 		  let lng = e.latlng.lng; // ??????
// 		  popup
// 		    .setLatLng(e.latlng)
// 		    .setContent(`?????????`+lat+ `<br/>?????????`+lng)
// 		    .openOn(map);
// 		}
// 		map.on('click', onMapClick);
		
		// /*??????*/
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

		/**********************???????????????******************************/
		         /*?????????????????????*/
		          map.locate({ setView: true, maxZoom: 15 });
		         /*????????????function*/
		         function onLocationFound(e) {
		             let radius = 1000;
		             L.marker(e.latlng).addTo(map)
		                 .bindPopup("????????????").openPopup();
		             L.circle(e.latlng, radius).addTo(map);
		         }
		       	 map.on('locationfound', onLocationFound);
		         /*????????????function*/
		         function onLocationError(e) {
// 		             alert("?????????????????????????????????????????????????????????");
		        	 map.setView([ 23.797088003857067, 120.83413767268159 ], 7);
		         }
		         map.on('locationerror', onLocationError);
	</script>
</body>
</html>