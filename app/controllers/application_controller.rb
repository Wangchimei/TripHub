class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include TripsHelper
  before_action :authenticate_user!
end
