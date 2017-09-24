module Public
  class TripsController < ApplicationController
    
    def index
      @user = User.find_by_url_slug(params[:url_slug])
      @trips = @user.trips.includes(:user)
    end

    def show
      @trip = Trip.find(params[:id])
    end
  end
end