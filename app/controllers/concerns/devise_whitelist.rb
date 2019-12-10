module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :avatar_cache, :remove_avatar, :country_id, :state_id, :city_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar, :country_id, :state_id, :city_id])
  end

end
