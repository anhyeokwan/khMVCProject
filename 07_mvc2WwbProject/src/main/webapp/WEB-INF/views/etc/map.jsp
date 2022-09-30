<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=e7u26ft5jd&submodules=geocoder"></script>
</head>                                                            <%--내 클아이언트 아이디를 입력 --%>
<body>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
   <div class="page-content">
      <div class="page-title">지도 API</div>
      <h2>1. 다음 주소찾기 API</h2>
      <div class="address-wrap">
         <input type="text" name ="postcode" id="postcode" class="input-form" readonly>
         <button class="btn bc1" onclick="searchAddr();">주소찾기</button>
         <input type="text" name="address" id="address" class="input-form" readonly>
         <input type="text" name="detailAddress" id="detailAddress" class="input-form"> 
      </div>
      <hr>
      <h2>2. 네이버지도 API </h2>
      <div id="map" style="width:100%; height:500px;"></div>
      <button onclick="showMap()" class="btn bc1">지도옮기기</button>
   </div>   
   <script>                  //아무것도 안쓰고 객체만 주면 항상 서울시청지 중심 지도 (map, {옵션})
      const map = new naver.maps.Map("map",{//객체를 만듦 ->2.네이버 지도api이에 띄우고 싶은거니까 div 아이디인 map를 넣어줌
         center : new naver.maps.LatLng(37.533837,126.896836), //위도 경도를 잡아줌으로 -> 당산역을 중심으로 지도에 보여줌 
         zoom : 17, //확대
         zoomControl : true,
         zoomControlOptions : {
        	 position : naver.maps.Position.TOP_RIGHT,
        	 style : naver.maps.ZoomControlStyle.SMALL
         }
      }); 
                  
   	  const marker = new naver.maps.Marker({
   		  position : new naver.maps.LatLng(37.533837,126.896836),
   		  map : map
   	  });
   	  
   	  let contentString = [
   		  "<div class = 'iw_inner'>",
   		  "	<h3>KH정보교육원</h3>",
   		  "	<p>서울시 영등포구 선유동2로 57 이레빌딩 19F A강의장</p>",
   		  "</div>"
   	  ].join("");
   	  
   	  let infoWindow = new naver.maps.InfoWindow();
   	  // 마커에 클릭이벤트 추가
   	  naver.maps.Event.addListener(marker, "click", function(e){ // 클릭했을 때 화면에 위치정보가 뜨게 하는 것
   		infoWindow = new naver.maps.InfoWindow({
   			content : contentString
   		});
   	  	// 생성된 info
   	  	infoWindow.open(map, marker);
   	  });
   	  
   	  naver.maps.Event.addListener(map, "click", function(e){
   		  marker.setPosition(e.coord); // 해당위치로 마커 이동 // 위도/경도 값을 쓰고 있음
   		  if(infoWindow.getMap()){ // 정보창이 지도위에 올라가 있으면
   			  infoWindow.close(); // 닫아주세여
   		  }
   		  // 위경도를 통해서 해당 위치의 주소를 알아내기
   		  naver.maps.Service.reverseGeocode({
   			  location : new naver.maps.LatLng(e.coord.lat(), e.crood.lng())
   		  }, function(status, response){
   			  if(status != naver.maps.Service.Status.OK){
   				  return alter("주소를 찾을 수 없습니다.");
   			  }
   			  console.log(response);
   			  const address = response.result.items[1].address;
   			  console.log(address);
   			  contentString = [
   				  "<div class='iw_inner'>",
   				  " <p>" + address + "</p>",
   				  "</div>"
   			  ]
   		  });
   	  })

      function searchAddr(){
           new daum.Postcode({
                 oncomplete: function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                     // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                     console.log(data);
                     $("#postcode").val(data.zonecode);
                     $("#address").val(data.roadAddress);
                     $("#detailAddress").focus();
                     
                 }
            }).open();
      }
   		function showMap(){
   			const addr = $("#address").val();
   			naver.maps.Service.geocode({address : addr}, function(status, response){
   				if(status === naver.maps.Service.Status.ERROR){ // === 데이터타입까지 검사하는 것
   					return alert("조회에러");
   				}
   				console.log(response); // reserve와 v2값이 나와야함
   				const lng = response.result.items[1].point.x;
   				const lat = response.result.items[1].point.y;
   				const lating = new naver.maps.Lating();
   				map.setCenter(latlng);
   				maker.setPosition(latlng);
   			});// 경도를 찾는 코드 
   		}
   </script>
   <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>






















