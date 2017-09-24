class TripsController < ApplicationController

  def index
    @trips = current_user.trips.order('created_at desc')
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params.merge(user: current_user))

    if @trip.valid?
      render :create
    else
      render :new
    end
  end


  private
    def trip_params
      params.require(:trip).permit(:title, :description, :check_in_time)
    end

end