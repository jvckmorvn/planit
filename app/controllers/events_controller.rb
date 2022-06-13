class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.group = @group
    if @event.save
      count = 0
      ((@event.proposed_end_date - @event.proposed_start_date).to_i + 1).times do
        Day.create(event: @event, day_date: @event.proposed_start_date + count)
        count += 1
      end
      redirect_to group_path(@group)
    else
      render "groups/show", status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to group_path(@event), status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:name, :colour, :address, :proposed_start_date, :proposed_end_date)
  end
end
