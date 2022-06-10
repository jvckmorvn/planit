class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.group = @group
    if @event.save!
      redirect_to group_path(@group)
    else
      render "groups/show", status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :colour, :address)
  end
end
