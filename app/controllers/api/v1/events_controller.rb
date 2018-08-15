class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def show
  end

  def edit
    # d = params[:event][:start_date].to_date
    # t = params[:event][:start_time].to_time
    # dd = params[:event][:end_date].to_date
    # tt = params[:event][:end_time].to_time
    # @start = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    # @end = DateTime.new(dd.year, dd.month, dd.day, tt.hour, tt.min, tt.sec, tt.zone)
    # @event.start = @start
    # @event.end = @end
  end

  def update
    d = params[:event][:start_date].to_date
    t = params[:event][:start_time].to_time
    dd = params[:event][:end_date].to_date
    tt = params[:event][:end_time].to_time
    @start = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    @end = DateTime.new(dd.year, dd.month, dd.day, tt.hour, tt.min, tt.sec, tt.zone)
    @event.start = @start
    @event.end = @end
    # d = params[:event][:start_date].to_date
    # t = params[:event][:start_time].to_time
    # dd = params[:event][:end_date].to_date
    # tt = params[:event][:end_time].to_time
    # @start = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    # @end = DateTime.new(dd.year, dd.month, dd.day, tt.hour, tt.min, tt.sec, tt.zone)
    if @event.update(event_params)
      render :show
    else
      render_error
    end
  end

  def new
    @user = User.find(params[:user_id])
    @event = Event.new
  end

  def create
    # create a new hash with params fixed the model, combine date and time
    # 1. create a new hash called attributes ...create from event_params ....= Hash.new
    # 2. ccombine start_date and start_time, end_date and end_time into 2 fields instead of 4
    # 3. pass attributes to Event.new....like Event.new(attributes)
    # attr = {}
    # attr = { event_params[:start_date], event_params[:end_date], event_params[:end_time], event_params[:start_time]}
    d = params[:event][:start_date].to_date
    t = params[:event][:start_time].to_time
    dd = params[:event][:end_date].to_date
    tt = params[:event][:end_time].to_time
    @start = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    @end = DateTime.new(dd.year, dd.month, dd.day, tt.hour, tt.min, tt.sec, tt.zone)
    @event = Event.new(event_params)
    @event.start = @start
    @event.end = @end
    @event.user = User.find(params[:user_id])
    if @event.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:address, :longitude, :latitude, :description, :start, :end, :capacity, :completed, :user_id, :photo).except(:start_date, :start_time, :end_time, :end_date)
  end


  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end
end
