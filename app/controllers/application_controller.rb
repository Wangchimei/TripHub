class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include TripsHelper
  include UsersHelper
  before_action :authenticate_user!
end
