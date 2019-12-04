function initMap() {
  var styledMap = new google.maps.StyledMapType(
    [
      { elementType: 'geometry', stylers: [{ color: '#ebe3cd' }] },
      { elementType: 'labels.text.fill', stylers: [{ color: '#523735' }] },
      { elementType: 'labels.text.stroke', stylers: [{ color: '#f5f1e6' }] },
      {
        featureType: 'administrative',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#c9b2a6' }],
      },
      {
        featureType: 'administrative.land_parcel',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#dcd2be' }],
      },
      {
        featureType: 'administrative.land_parcel',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#ae9e90' }],
      },
      {
        featureType: 'landscape.natural',
        elementType: 'geometry',
        stylers: [{ color: '#dfd2ae' }],
      },
      {
        featureType: 'poi',
        elementType: 'geometry',
        stylers: [{ color: '#dfd2ae' }],
      },
      {
        featureType: 'poi',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#93817c' }],
      },
      {
        featureType: 'poi.park',
        elementType: 'geometry.fill',
        stylers: [{ color: '#a5b076' }],
      },
      {
        featureType: 'poi.park',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#447530' }],
      },
      {
        featureType: 'road',
        elementType: 'geometry',
        stylers: [{ color: '#f5f1e6' }],
      },
      {
        featureType: 'road.arterial',
        elementType: 'geometry',
        stylers: [{ color: '#fdfcf8' }],
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry',
        stylers: [{ color: '#f8c967' }],
      },
      {
        featureType: 'road.highway',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#e9bc62' }],
      },
      {
        featureType: 'road.highway.controlled_access',
        elementType: 'geometry',
        stylers: [{ color: '#e98d58' }],
      },
      {
        featureType: 'road.highway.controlled_access',
        elementType: 'geometry.stroke',
        stylers: [{ color: '#db8555' }],
      },
      {
        featureType: 'road.local',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#806b63' }],
      },
      {
        featureType: 'transit.line',
        elementType: 'geometry',
        stylers: [{ color: '#dfd2ae' }],
      },
      {
        featureType: 'transit.line',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#8f7d77' }],
      },
      {
        featureType: 'transit.line',
        elementType: 'labels.text.stroke',
        stylers: [{ color: '#ebe3cd' }],
      },
      {
        featureType: 'transit.station',
        elementType: 'geometry',
        stylers: [{ color: '#dfd2ae' }],
      },
      {
        featureType: 'water',
        elementType: 'geometry.fill',
        stylers: [{ color: '#b9d3c2' }],
      },
      {
        featureType: 'water',
        elementType: 'labels.text.fill',
        stylers: [{ color: '#92998d' }],
      },
    ],
    { name: 'レトロ' },
  );
  var center = { lat: gon.lat, lng: gon.lng };
  var schedules = '/trips/' + gon.trip_id + '/schedules.json';
  if (document.getElementById('scheduleMap') !== null) {
    $.getJSON(schedules, function(data) {
      console.log(data);
      debugger;
    });

    $(function() {
      $.ajax({
        url: schedules,
        cache: false,
      }).then(
        function(data) {
          console.log(data);

          // mapData = data['data'];
          // ready['ajax'] = true;
          // generate_map();
        },
        function() {
          // console.log('取得に失敗しました。');
        },
      );
    });

    // generate schedule map
    var map = new google.maps.Map(document.getElementById('scheduleMap'), {
      center: center,
      zoom: 12,
      gestureHandling: 'cooperative',
      streetViewControl: false,
      mapTypeControlOptions: {
        mapTypeIds: ['retro', 'roadmap', 'satellite', 'hybrid'],
        style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
        position: google.maps.ControlPosition.TOP_RIGHT,
      },
    });
    // var Calendarcard = document.getElementById('calendar-card');
    // map.panBy(-300, 0);
    // map.controls[google.maps.ControlPosition.LEFT_TOP].push(Calendarcard);
    google.maps.event.addListener(map, 'click', function(event) {
      // Add marker
      console.log(event);
      // addMarker({ coords: event.latLng });
    });

    map.mapTypes.set('retro', styledMap);
    map.setMapTypeId('retro');
  } else {
    // generate spot map
    var searchMap = new google.maps.Map(document.getElementById('searchMap'), {
      center: center,
      zoom: 9,
      gestureHandling: 'cooperative',
      streetViewControl: false,
      mapTypeControlOptions: {
        mapTypeIds: ['retro', 'roadmap', 'satellite', 'hybrid'],
        // style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
        position: google.maps.ControlPosition.TOP_RIGHT,
      },
    });
    var card = document.getElementById('pac-card');
    var input = document.getElementById('pac-input');
    searchMap.controls[google.maps.ControlPosition.LEFT_TOP].push(card);
    searchMap.mapTypes.set('retro', styledMap);
    searchMap.setMapTypeId('retro');
    var autocomplete = new google.maps.places.Autocomplete(input);
    // Bind the map's bounds (viewport) property to the autocomplete object,
    // so that the autocomplete requests use the current map bounds for the
    // bounds option in the request.
    autocomplete.bindTo('bounds', searchMap);
    autocomplete.setFields([
      'address_components',
      'formatted_address',
      'geometry',
      'icon',
      'name',
      'rating',
      'international_phone_number',
      'opening_hours',
      'place_id',
      'types',
      'website',
    ]);
    var infowindow = new google.maps.InfoWindow();
    var infowindowContent = document.getElementById('infowindow-content');
    infowindow.setContent(infowindowContent);
    var marker = new google.maps.Marker({
      map: searchMap,
      anchorPoint: new google.maps.Point(0, -29),
    });

    autocomplete.addListener('place_changed', function() {
      infowindow.close();
      marker.setVisible(false);
      var place = autocomplete.getPlace();
      resetAutocomplete(place);
      console.log(place);

      if (!place.geometry) {
        window.alert("Google マップで「'" + place.name + "'」が見つかりません");
        return;
      }

      if (place.geometry.viewport) {
        searchMap.fitBounds(place.geometry.viewport);
      } else {
        searchMap.setCenter(place.geometry.location);
        searchMap.setZoom(17);
      }
      marker.setPosition(place.geometry.location);
      marker.setVisible(true);

      // output to info window
      infowindowContent.children['place-icon'].src = place.icon;
      infowindowContent.children['place-name'].textContent = place.name;
      infowindowContent.children['place-rating'].textContent = place.rating;
      infowindowContent.children['place-address'].textContent =
        place.formatted_address;
      infowindowContent.children['place-phone_number'].textContent =
        place.international_phone_number;
      if (place.website) {
        var linkOutput = `
        <a href="${place.website}" target="_blank">${place.website}</a>`;
        document.getElementById('place-website').innerHTML = linkOutput;
      }
      infowindow.open(searchMap, marker);

      function resetAutocomplete(place) {
        document.querySelectorAll('.gmap-reset').value = '';
        document.getElementById('name').value = place.name;
        document.getElementById('address').value = place.formatted_address;
        document.getElementById('place_id').value = place.place_id;
        if (place.international_phone_number) {
          document.getElementById('phone_num').value =
            place.international_phone_number;
        }
        if (place.rating) {
          document.getElementById('rating').value = place.rating;
        }
        if (place.website) {
          document.getElementById('website').value = place.website;
        }
      }
    });
  }
}
