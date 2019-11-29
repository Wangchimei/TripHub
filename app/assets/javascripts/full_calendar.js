var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function() {
    var calendar = $(this);
    function formatDate(date) {
      var datePart = date.match(/\d+/g),
        year = datePart[0],
        month = datePart[1],
        day = datePart[2];
      return month + '/' + day + '/' + year;
    }
    var start_day = new Date(formatDate(gon.start_day));
    var end_day = new Date(formatDate(gon.end_day));
    var cal_end_day = new Date(formatDate(gon.cal_end_day));
    var create_link = '/trips/' + gon.trip_id + '/schedules/new';
    function set_duration() {
      differenceInTime = end_day.getTime() - start_day.getTime();
      differenceInDays = differenceInTime / (1000 * 3600 * 24);
      tripDuration = differenceInDays + 1;
      if (tripDuration === 1) {
        return 1;
      } else if (tripDuration % 3 === 0) {
        return 3;
      } else {
        return 2;
      }
    }
    calendar.fullCalendar({
      header: {
        left: '',
        center: 'title',
        right: 'prev, next',
      },
      defaultView: 'agenda',
      defaultDate: start_day,
      // visibleRange: {
      //   start: start_day,
      //   end: end_day
      // },
      validRange: {
        start: start_day,
        end: cal_end_day,
      },
      duration: { days: set_duration() },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      // events: '/schedules.json',

      select: function(start, end) {
        $.getScript(create_link, function() {
          $('#schedule_date_range').val(
            moment(start).format('YYYY-MM-DD HH:mm') +
              ' - ' +
              moment(end).format('YYYY-MM-DD HH:mm'),
          );
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },

      // eventDrop: function(event, delta, revertFunc) {
      //   event_data = {
      //     event: {
      //       id: event.id,
      //       start: event.start.format(),
      //       end: event.end.format()
      //     }
      //   };
      //   $.ajax({
      //     url: event.update_url,
      //     data: event_data,
      //     type: "PATCH"
      //   });
      // },

      // eventClick: function(event, jsEvent, view) {
      //   $.getScript(event.edit_url, function() {
      //     $("#event_date_range").val(
      //       moment(event.start).format("YYYY-MM-DD HH:mm") +
      //         " - " +
      //         moment(event.end).format("YYYY-MM-DD HH:mm")
      //     );
      //     date_range_picker();
      //     $(".start_hidden").val(moment(event.start).format("YYYY-MM-DD HH:mm"));
      //     $(".end_hidden").val(moment(event.end).format("YYYY-MM-DD HH:mm"));
      //   });
      // }
    });
  });
};
$(document).on('turbolinks:load', initialize_calendar);
