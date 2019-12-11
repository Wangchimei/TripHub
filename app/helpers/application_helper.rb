module ApplicationHelper
  def trip_duration(trip)
    (trip.end_day-trip.start_day).to_i + 1
  end
  
  def avatar(user, arg)
    avatar = user.avatar.url
    if avatar.nil?
      user_avatar = image_tag("default_avatar.png", alt:user.name, class: "#{arg}", id:"imgProfile")
    else
      user_avatar = image_tag(avatar, alt:user.name, class: "#{arg}", id:"imgProfile")
    end
    user_avatar
  end
end
