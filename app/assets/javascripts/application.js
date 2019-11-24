//= require rails-ujs
//= require activestorage
//= require jquery3
//= require cocoon
//= require_tree .

// State dropdown
$(document).on("change", "#user_country_id", function () {
  return $.ajax({
    type: "GET",
    url: "/locations/get_states",
    data: {
      country_id: $(this).val()
    }
  }).done(function (data) {
    if (data.includes('option')) {
      $(".state-area").html(data);
      $(".state-area").show();
    } else {
      $(".state-area").hide();
    }
  });
});

// City dropdown
$(document).on("change", "#user_state_id", function () {
  return $.ajax({
    type: "GET",
    url: "/locations/get_cities",
    data: {
      state_id: $(this).val()
    }
  }).done(function (data) {
    if (data.includes('option')) {
      $(".city-area").html(data);
      $(".city-area").show();
    } else {
      $(".city-area").hide();
    }
  });
});

// Country dropdown
$(document).on("change", "#trip_continent_id", function () {
  return $.ajax({
    type: "GET",
    url: "/locations/get_countries",
    data: {
      continent_id: $(this).val()
    }
  }).done(function (data) {
    if (data.includes('option')) {
      $(".country-area").html(data);
      $(".country-area").show();
    } else {
      $(".country-area").hide();
    }
  });
});

// State dropdown
$(document).on("change", "#trip_country_id", function () {
  return $.ajax({
    type: "GET",
    url: "/locations/get_states",
    data: {
      country_id: $(this).val()
    }
  }).done(function (data) {
    if (data.includes('option')) {
      $(".state-area").html(data);
      $(".state-area").show();
    } else {
      $(".state-area").hide();
    }
  });
});

// City dropdown
$(document).on("change", "#trip_state_id", function () {
  return $.ajax({
    type: "GET",
    url: "/locations/get_cities",
    data: {
      state_id: $(this).val()
    }
  }).done(function (data) {
    if (data.includes('option')) {
      $(".city-area").html(data);
      $(".city-area").show();
    } else {
      $(".city-area").hide();
    }
  });
});