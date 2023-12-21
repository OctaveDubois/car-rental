class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @car = Car.find(params[:car_id])
    @booking = @car.bookings.new(booking_params)
    @booking.user_id = current_user.id

    if @booking.save
      redirect_to @car, notice: 'Voiture réservée avec succès.'
    else
      render 'cars/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
