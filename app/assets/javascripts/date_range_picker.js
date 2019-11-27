var date_range_picker;
date_range_picker = function() {
  $(".date-range-picker").each(function() {
    $(this)
      .daterangepicker(
        {
          timePicker: true,
          timePickerIncrement: 15,
          locale: {
            format: "YYYY-MM-DD HH:mm"
          }
        },
        function(start, end, label) {
          $(".start_hidden").val(start.format("YYYY-MM-DD HH:mm"));
          $(".end_hidden").val(end.format("YYYY-MM-DD HH:mm"));
        }
      )
      // .on("show.daterangepicker", function(ev, picker) {
      //   picker.container.find(".calendar-table").hide();
      // });
  });
};
$(document).on("turbolinks:load", date_range_picker);