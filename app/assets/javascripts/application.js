//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require daterangepicker
//= require_tree .

// User sign up
// State dropdown
$(document).on('change', '#user_country_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/locations/get_states',
    data: {
      country_id: $(this).val(),
    },
  }).done(function(data) {
    if (data.includes('option')) {
      $('.state-area').html(data);
      $('.state-area').show();
    } else {
      $('.state-area').hide();
    }
  });
});

// City dropdown
$(document).on('change', '#user_state_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/locations/get_cities',
    data: {
      state_id: $(this).val(),
    },
  }).done(function(data) {
    if (data.includes('option')) {
      $('.city-area').html(data);
      $('.city-area').show();
    } else {
      $('.city-area').hide();
    }
  });
});

// Trip
// Country dropdown
$(document).on('change', '#trip_continent_id', function() {
  $('#trip_to_states_attributes_0_state_id').val('');
  $('#trip_to_cities_attributes_0_city_id').val('');
  $('.state-area').hide();
  $('.city-area').hide();
  return $.ajax({
    type: 'GET',
    url: '/locations/to_countries',
    data: {
      continent_id: $(this).val(),
    },
  }).done(function(data) {
    if (data.includes('option')) {
      $('.country-area').html(data);
      $('.country-area').show();
    } else {
      $('.country-area').hide();
    }
  });
});

// State dropdown
$(document).on(
  'change',
  '#trip_to_countries_attributes_0_country_id',
  function() {
    $('#trip_to_cities_attributes_0_city_id').val('');
    $('.city-area').hide();
    return $.ajax({
      type: 'GET',
      url: '/locations/to_states',
      data: {
        country_id: $(this).val(),
      },
    }).done(function(data) {
      if (data.includes('option')) {
        $('.state-area').html(data);
        $('.state-area').show();
      } else {
        $('.state-area').hide();
        $('.city-area').hide();
      }
    });
  },
);

// City dropdown
$(document).on('change', '#trip_to_states_attributes_0_state_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/locations/to_cities',
    data: {
      state_id: $(this).val(),
    },
  }).done(function(data) {
    if (data.includes('option')) {
      $('.city-area').html(data);
      $('#addCityBtn').show();
      $('#addCityBtn').on('click', function() {
        $('.city-area').show();
      });
    } else {
      $('.city-area').hide();
    }
  });
});

$(document).on('change', '#trip_to_states_attributes_0_state_id', function() {
  return $.ajax({
    type: 'GET',
    url: '/locations/to_cities',
    data: {
      state_id: $(this).val(),
    },
  }).done(function(data) {
    if (data.includes('option')) {
      $('.city-area').html(data);
      $('#addCityBtn').show();
      $('#addCityBtn').on('click', function() {
        $('.city-area').show();
      });
    } else {
      $('.city-area').hide();
    }
  });
});

// Toggle for schedule form
$(document).on('click', '#editInfo', function() {
  $(this)
    .next()
    .slideToggle();
});
