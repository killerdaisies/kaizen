class Api::V1::BookingsController < Api::V1::BaseController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy ]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      render :show
    else
      render_error
    end
  end

  def new
    @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(params[:user_id])
    if @booking.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:event_id, :user_id)
  end


  def render_error
    render json: { errors: @booking.errors.full_messages },
      status: :unprocessable_entity
  end
end
