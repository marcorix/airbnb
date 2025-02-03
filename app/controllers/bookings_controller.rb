class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @message = Message.new
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking was successfully created."
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message, :guests)
  end
end
