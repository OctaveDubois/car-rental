  class CarsController < ApplicationController
    before_action :authenticate_user!

    def index
      @cars = Car.all
    end

    def show
      @car = Car.find(params[:id])
      @booking = Booking.new
    end
  end
