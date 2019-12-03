var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function() {
    var calendar = $(this);
    function formatDate(date) {
      year = date.getFullYear();
      month = date.getMonth() + 1;
      day = date.getDate();
      return month + '/' + day + '/' + year;
    }
    var format_start_day = new Date(gon.start_day);
    var format_end_day = new Date(gon.end_day);
    var start_day = formatDate(format_start_day);
    var end_day = formatDate(format_end_day);

    var schedules = '/trips/' + gon.trip_id + '/schedules.json';
    var create_url = '/trips/' + gon.trip_id + '/schedules/new';
    function set_duration() {
      differenceInTime = format_end_day.getTime() - format_start_day.getTime();
      differenceInDays = differenceInTime / (1000 * 3600 * 24);
      tripDuration = differenceInDays + 1;
      if (tripDuration > 2 || tripDuration % 2 === 0) {
        return 2;
      } else {
        return 1;
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
        end: end_day,
      },
      duration: { days: set_duration() },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      contentHeight: 800,
      events: schedules,
      eventColor: '#89C4FF',
      titleFormat: 'YYYY 年 M 月',

      select: function(start, end) {
        $.getScript(create_url, function() {
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

      eventDrop: function(schedule, delta, revertFunc) {
        schedule_data = {
          schedule: {
            id: schedule.id,
            start: schedule.start.format(),
            end: schedule.end.format(),
          },
        };
        $.ajax({
          url: schedule.update_url,
          data: schedule_data,
          type: 'PATCH',
        });
      },

      eventResize: function(schedule) {
        debugger;
        schedule_data = {
          schedule: {
            id: schedule.id,
            start: schedule.start.format(),
            end: schedule.end.format(),
          },
        };
        $.ajax({
          url: schedule.update_url,
          data: schedule_data,
          type: 'PATCH',
        });
        //   // calendar.fullCalendar('unselect');
      },

      eventClick: function(schedule) {
        console.log(schedule);
        $.getScript(schedule.edit_url, function() {
          $('#schedule_date_range').val(
            moment(schedule.start).format('YYYY-MM-DD HH:mm') +
              ' - ' +
              moment(schedule.end).format('YYYY-MM-DD HH:mm'),
          );
          date_range_picker();
          $('.start_hidden').val(
            moment(schedule.start).format('YYYY-MM-DD HH:mm'),
          );
          $('.end_hidden').val(moment(schedule.end).format('YYYY-MM-DD HH:mm'));
        });
      },
    });
  });
};
$(document).on('turbolinks:load', initialize_calendar);
// $(document).on('turbolinks:before-cache', clearCalendar);
