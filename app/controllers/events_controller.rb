class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_creator!, only: [ :edit, :update, :destroy ]

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show
    @registration = Registration.find_by(attendee: current_user, event: @event)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_creator!
    redirect_to root_path unless @event.creator == current_user
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
