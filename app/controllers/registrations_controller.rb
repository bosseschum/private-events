class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @registration = current_user.registrations.build(event: @event)
    if @registration.save
      redirect_to @event
    else
      render "events/show"
    end
  end

  def destroy
    @registration = current_user.registrations.find(params[:id])
    @registration.destroy
    redirect_to @event
  end
end
