var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function() {
    $(this).daterangepicker(
      {
        timePicker: false,
        locale: {
          format: 'YYYY-MM-DD',
        },
      },
      function(start, end, label) {
        $('.start_date').val(start.format('YYYY-MM-DD'));
        $('.end_date').val(end.format('YYYY-MM-DD'));
      },
    );
  });
};

$(document).on('turbolinks:load', date_range_picker);
