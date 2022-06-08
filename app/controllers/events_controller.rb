class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.group = @group
    if @event.save
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end

    private

    def event_params
      params.require(:event).permit()
    end
  end
