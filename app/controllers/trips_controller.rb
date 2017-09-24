class TripsController < ApplicationController

  def index
    @trips = current_user.trips.order('created_at desc')
  end

  def new
    @trip = Trip.new
  end

  def edit
    @trip = current_user.trips.find(params[:id])
  end

  def update
    @trip = current_user.trips.find(params[:id])
    @trip.update(trip_params)
  end

  def create
    @trip = Trip.create(trip_params.merge(user: current_user))

    if @trip.valid?
      render :create
    else
      render :new
    end
  end

  def destroy
    @trips = current_user.trips
    
    @trip = @trips.find(params[:id])
    @trip.destroy

    render :index
  end


  private
    def trip_params
      params.require(:trip).permit(:title, :description, :check_in_time, :latitude, :longitude)
    end

end