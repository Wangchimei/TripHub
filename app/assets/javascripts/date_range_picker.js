var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function() {
    var start_day = moment(gon.start_day)
      .utc()
      .format('YYYY-MM-DD HH:mm');
    var end_day = moment(gon.end_day)
      .utc()
      .format('YYYY-MM-DD HH:mm');
    debugger;
    if (start_day) {
      $(this).daterangepicker(
        {
          minDate: start_day,
          maxDate: end_day,
          timePicker: true,
          timePickerIncrement: 30,
          locale: {
            format: 'YYYY-MM-DD HH:mm',
          },
        },
        function(start, end, label) {
          $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
        },
      );
    } else {
      $(this).daterangepicker(
        {
          timePicker: false,
          locale: {
            format: 'YYYY-MM-DD HH:mm',
          },
        },
        function(start, end, label) {
          $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
        },
      );
    }
  });
};

$(document).on('turbolinks:load', date_range_picker);
