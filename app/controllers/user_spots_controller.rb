class UserSpotsController < ApplicationController
 respond_to? :js

 def create
   @spot = Spot.find(params[:spot_id])
   current_user.save_spot!(@spot)
 end

 def destroy
   @spot = Spot.find(params[:spot_id])
   current_user.unsave_spot!(@spot)
 end
end