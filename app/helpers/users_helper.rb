module UsersHelper
  def logged_in_user
    redirect_to user_path(current_user) if current_user
  end

  def authorized_user
    if current_user != @trip.user
      redirect_to user_path(current_user)
      flash[:notice] = "権限がありません"
    end
  end

  def visited_countries_array
    visited_countries = []
    current_user.countries_conquered.each do |country|
      visited_countries << country.iso2
    end
    visited_countries
  end

  def uploaded_photos(user)
    uploaded_photos = []
    if user.user_schedules.length != 0
      user.user_schedules.each do |schedule|
        schedule.images.each do |image|
          uploaded_photos << image
        end
      end
    end
    uploaded_photos
  end
end