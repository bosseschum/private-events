class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_event, only: [ :show, :edit, :update, :destroy ]

  def index
    @events = Event.all
  end

  def show
    set_event
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
    set_event
  end

  def update
    set_event
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    set_event
    @event.destroy
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
