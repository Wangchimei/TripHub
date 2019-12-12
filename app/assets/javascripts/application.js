//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require daterangepicker
//= require turbolinks
//= require_tree .

// User sign up
// State dropdown
$(document).on('change', '#user_country_id', function() {
  $('.city-area').hide();
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
        $('.city-area').slideToggle();
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
$(document).on('click', '#showInfo', function() {
  $(this)
    .next()
    .slideToggle();
});

$(document).on('click', '.spot-select', function() {
  $('#schedule_admission_fee').val('');
  $('#schedule_other_cost').val('');
  $('#schedule_note').val('');
});

// user profile uploader preview
$(document).on('click', '#imgProfile', function() {
  $('#profile').on('change', function(e) {
    var file = e.target.files[0];
    var $preview = $('#avatar_field');
    var fileReader = new FileReader();
    fileReader.onload = function() {
      // Data URIを取得
      var dataUri = this.result;
      $('#imgProfile').empty();
      $preview.empty();
      $preview.append(
        $('<img>').attr({
          src: dataUri,
          class: 'avatar-image',
        }),
      );
    };
    $('#btnChangePicture').removeClass('d-none');
    fileReader.readAsDataURL(file);
  });
});

// multiple update preview
$(document).on('turbolinks:load', function() {
  // $(function() {
  var imagesPreview = function(input, placeToInsertImagePreview) {
    if (input.files) {
      var filesAmount = input.files.length;

      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();

        reader.onload = function(event) {
          $($.parseHTML('<img>'))
            .attr('src', event.target.result)
            .appendTo(placeToInsertImagePreview);
        };

        reader.readAsDataURL(input.files[i]);
      }
    }
  };

  $('#uploader').on('change', function() {
    imagesPreview(this, 'div.preview-box');
  });
});

// reset btn
$(document).on('click', '.reset-image', function() {
  $('div.preview-box').html('');
  $('#uploader').val('');
});
