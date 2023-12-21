class BookingsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.new(booking_params.merge(user: current_user))

    if @booking.save
      redirect_to @car, notice: 'Voiture réservée avec succès.'
    else
      render 'cars/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
