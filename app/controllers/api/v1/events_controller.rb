class Api::V1::EventsController < Api::V1::BaseController
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  def index
    @events = Event.all
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      render :show
    else
      render_error
    end
  end

  def new
    @event = Event.new
  end

  def create
    # create a new hash with params fixed the model, combine date and time
    # 1. create a new hash called attributes ...create from event_params ....= Hash.new
    # 2. ccombine start_date and start_time, end_date and end_time into 2 fields instead of 4
    # 3. pass attributes to Event.new....like Event.new(attributes)
    # attr = {}
    # attr = { event_params[:start_date], event_params[:end_date], event_params[:end_time], event_params[:start_time]}
    d = Date.new(params[:start_date])
    t = (params[:start_time]).to_time
    dd = Date.new(params[:end_date])
    tt = (params[:end_time]).to_time
    debugger
    event_params[:start] = DateTime.new(d.year, d.month, d.day, t.hour, t.min, t.sec, t.zone)
    event_params[:end] = DateTime.new(dd.year, dd.month, dd.day, tt.hour, tt.min, tt.sec, tt.zone)
    @event = Event.new(event_params.except(:start_time, :start_date, :end_time, :end_date))
    p @event
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
    params.require(:event).permit(:address, :longitude, :latitude, :description, :start_date, :end_date, :start_time, :end_time, :start, :end, :capacity, :completed, :user_id)
  end


  def render_error
    render json: { errors: @event.errors.full_messages },
      status: :unprocessable_entity
  end
end
