var trip_date_range_picker;
trip_date_range_picker = function() {
  $(".trip-date-range-picker").each(function() {
    $(this).daterangepicker(
      {
        timePicker: true,
        timePickerIncrement: 15,
        locale: {
          format: "YYYY-MM-DD"
        }
      },
      function(start, end, label) {
        $(".start_date").val(start.format("YYYY-MM-DD"));
        $(".end_date").val(end.format("YYYY-MM-DD"));
      }
    )
    .on("show.daterangepicker", function(ev, picker) {
      picker.container.find(".calendar-time").hide();
    });
  });
};
$(document).on("turbolinks:load", trip_date_range_picker);