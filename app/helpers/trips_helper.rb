module TripsHelper
  def date_default
    if action_name == "edit"
    start_day = @trip.start_day.strftime("%Y-%m-%d").to_s
    end_day = @trip.end_day.strftime("%Y-%m-%d").to_s
    start_day + " - " + end_day
    end
  end

  def daily_schedule(schedules, day)
    schedules.where('start BETWEEN ? AND ?', day.beginning_of_day, day.end_of_day)
  end

  def status_finished
    unless @trip.status == "finished"
      redirect_to trips_user_path(current_user)
      flash[:warning] = "この旅行はまだ計画中です"
    end
  end

  def status_planning
    unless @trip.status == "planning"
      redirect_to trips_user_path(current_user)
      flash[:warning] = "この旅行もう終わりましたので、編集できません"
    end
  end
end
