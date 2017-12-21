class RidesController < ApplicationController
  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(User.find(session[:user_id]))
  end
end
