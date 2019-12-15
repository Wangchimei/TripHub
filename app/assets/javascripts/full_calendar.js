var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function() {
    var calendar = $(this);
    var cal_format_start = moment(gon.start_day)
      .utc()
      .format('MM/DD/YYYY');
    var cal_format_end = moment(gon.cal_end_day).format('MM/DD/YYYY');
    var schedules = '/trips/' + gon.trip_id + '/schedules.json';
    var create_url = '/trips/' + gon.trip_id + '/schedules/new';
    calendar.fullCalendar({
      customButtons: {
        add_event: {
          text: '　＋　',
          click: function(e) {
            $.getScript(create_url, function() {
              start = moment(gon.start_day)
                .utc()
                .format('YYYY-MM-DD HH:mm');
              end = moment(gon.end_day)
                .utc()
                .format('YYYY-MM-DD HH:mm');
              $('#schedule_date_range').val(start + ' - ' + end);
              date_range_picker();
              $('.start_hidden').val(start);
              $('.end_hidden').val(end);
            });
          },
        },
      },
      header: {
        left: 'add_event',
        center: 'title',
        right: 'prev, next',
      },
      defaultView: 'agenda',
      defaultDate: cal_format_start,
      validRange: {
        start: cal_format_start,
        end: cal_format_end,
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,
      height: self.innerHeight - 120,
      events: schedules,
      eventColor: '#9FD7FF',
      titleFormat: 'YYYY 年 M 月 D 日',

      select: function(start, end) {
        $.getScript(create_url, function() {
          $('#schedule_date_range').val(
            moment(start)
              .utc()
              .format('YYYY-MM-DD HH:mm') +
              ' - ' +
              moment(end)
                .utc()
                .format('YYYY-MM-DD HH:mm'),
          );
          date_range_picker(start, end);
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(schedule, delta, revertFunc) {
        schedule_data = {
          schedule: {
            id: schedule.id,
            start_time: schedule.start.format(),
            end_time: schedule.end.format(),
          },
        };
        $.ajax({
          url: schedule.update_url,
          data: schedule_data,
          type: 'PATCH',
        });
      },

      eventResize: function(schedule) {
        schedule_data = {
          schedule: {
            id: schedule.id,
            start_time: schedule.start.format(),
            end_time: schedule.end.format(),
          },
        };
        $.ajax({
          url: schedule.update_url,
          data: schedule_data,
          type: 'PATCH',
        });
      },

      eventClick: function(schedule) {
        $.getScript(schedule.edit_url, function() {
          $('#schedule_date_range').val(
            moment(schedule.start).format('YYYY-MM-DD HH:mm') +
              ' - ' +
              moment(schedule.end).format('YYYY-MM-DD HH:mm'),
          );
          date_range_picker(schedule.start, schedule.end);
          $('.start_hidden').val(
            moment(schedule.start).format('YYYY-MM-DD HH:mm'),
          );
          $('.end_hidden').val(moment(schedule.end).format('YYYY-MM-DD HH:mm'));
        });
      },

      eventRender: function(schedule, element) {
        element.find('.fc-time').addClass('text-center');
        element
          .find('.fc-time')
          .append('<p class="name h6 my-2">' + schedule.name + '</p>');
        element
          .find('.fc-time')
          .append(
            '<p class="h7 mb-1 mt-2 text-wrap"> 入場料金：' +
              schedule.admission_fee +
              '</p>',
          );
        element
          .find('.fc-time')
          .append(
            '<p class="h7 text-wrap"> 他の費用：' +
              schedule.other_cost +
              '</p>',
          );
      },

      // height responsive
      windowResize: function() {
        calendar.fullCalendar('option', 'height', self.innerHeight - 120);
      },
    });
  });
};
