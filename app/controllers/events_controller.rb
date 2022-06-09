class EventsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.group = @group
    if @event.save
      redirect_to group_path(@group)
    else
      render group_path(@group), status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :colour, :address)
  end
end
