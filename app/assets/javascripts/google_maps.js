var map;
var markersData;
var styledMap;

function initMap() {
  // set up custom style
  styledMap = new google.maps.StyledMapType(
    [
      { elementType: 'geometry', stylers: [{ color: '#ebe3cd' }] },
      { elementType: 'labels.text.fill', stylers: [{ color: '#523735' }] },
      {
        elementType: 'labels.text.stroke',
        stylers: [{ color: '#f5f1e6' }],
      },
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
  if (!!document.getElementById('scheduleMap')) {
    get_json();
  } else {
    autocomplete();
  }
}

function get_json() {
  var schedules = '/trips/' + gon.trip_id + '/schedules.json';
  $.getJSON(schedules, function(data) {
    if (data) {
      markersData = generateMarkers(data);
      generate_map();
    } else {
      generate_map();
    }
  });
}

function generateMarkers(data) {
  dataArray = [];
  for (i = 0; i < data.length; i++) {
    marker = data[i];
    dataArray.push({
      coords: { lat: data[i].spot.lat, lng: data[i].spot.lng },
      content: `
          <h4 class="h6">${data[i].start} - ${data[i].end}<h4>
          <h4 class="lead">${data[i].name}</h4>
          <p class="h7">${data[i].spot.address}</p>
          `,
    });
  }
  return dataArray;
}

function generate_map() {
  if (!!gon.trip_state_lat) {
    var center = { lat: gon.trip_state_lat, lng: gon.trip_state_lng };
  } else {
    var center = { lat: gon.trip_country_lat, lng: gon.trip_country_lng };
  }
  // generate schedule map
  var map = new google.maps.Map(document.getElementById('scheduleMap'), {
    center: center,
    zoom: 9,
    gestureHandling: 'cooperative',
    streetViewControl: false,
    mapTypeControlOptions: {
      mapTypeIds: ['retro', 'roadmap', 'satellite', 'hybrid'],
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
      position: google.maps.ControlPosition.TOP_RIGHT,
    },
  });
  var infoWindow = new google.maps.InfoWindow();
  map.mapTypes.set('retro', styledMap);
  map.setMapTypeId('retro');

  if (markersData) {
    addMarker(markersData);
  } else {
    alert(`読み込みエラーが発生しました。
            リフレッシュしてください。`);
  }

  function addMarker(data) {
    for (var i = 0; i < data.length; i++) {
      var props = data[i];
      var marker = new google.maps.Marker({
        position: props.coords,
        map: map,
        // animation: google.maps.Animation.DROP,
      });
      content = props.content;
      if (props.content) {
        google.maps.event.addListener(
          marker,
          'click',
          (function(marker, content) {
            return function() {
              infoWindow.setContent(content);
              infoWindow.open(map, marker);
            };
          })(marker, content),
        );
      }
    }
  }
}

//* generate spot map
function autocomplete() {
  var center = { lat: gon.lat, lng: gon.lng };
  var searchMap = new google.maps.Map(document.getElementById('searchMap'), {
    center: center,
    zoom: 9,
    gestureHandling: 'cooperative',
    streetViewControl: false,
    mapTypeControlOptions: {
      mapTypeIds: ['retro', 'roadmap', 'satellite', 'hybrid'],
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
      position: google.maps.ControlPosition.TOP_RIGHT,
    },
  });
  var card = document.getElementById('pac-card');
  var input = document.getElementById('pac-input');
  searchMap.controls[google.maps.ControlPosition.LEFT_TOP].push(card);
  searchMap.mapTypes.set('retro', styledMap);
  searchMap.setMapTypeId('retro');
  // searchMap.panBy(250, -200);
  var autocomplete = new google.maps.places.Autocomplete(input);
  // Bind the map's bounds (viewport) property to the autocomplete object,
  // so that the autocomplete requests use the current map bounds for the
  // bounds option in the request.
  // autocomplete.bindTo('bounds', searchMap);
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

  google.maps.event.trigger(input, 'focus');
  google.maps.event.trigger(input, 'keydown', { keyCode: 13 });

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    // console.log(place);
    resetAutocomplete(place);

    if (!place.geometry) {
      window.alert("Google マップで「'" + place.name + "'」が見つかりません");
      return;
    }

    if (place.geometry.viewport) {
      searchMap.fitBounds(place.geometry.viewport);
    } else {
      searchMap.setCenter(center);
      searchMap.setZoom(10);
    }
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    document.getElementById('trigger-search').onclick = function() {
      var input = document.getElementById('pac-input');

      google.maps.event.trigger(input, 'focus');
      google.maps.event.trigger(input, 'keydown', {
        keyCode: 13,
      });
    };

    // output to info window
    infowindowContent.children['place-name'].textContent = place.name;
    infowindowContent.children['place-address'].textContent =
      place.formatted_address;
    infowindowContent.children['place-phone_number'].textContent =
      place.international_phone_number;
    if (place.website) {
      var hostnameRegexp = new RegExp('^https?://.+?/');
      var website = hostnameRegexp.exec(place.website);
      var linkOutput = `
          <a href="${place.website}" target="_blank">${website}</a>`;
      document.getElementById('place-website').innerHTML = linkOutput;
    }
    infowindow.open(searchMap, marker);

    // define functions: reset form inputs
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
