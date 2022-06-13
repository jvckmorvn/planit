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

  def update
    @event = Event.find(params[:id])
    max_count = 0
    winning_day = nil
    @event.days.each do |day|
      if day.day_votes.count > max_count
        max_count = day.day_votes.count
        winning_day = day.day_date
      end
    end
    p winning_day
    if winning_day != nil
      @event.update(locked_start: winning_day, locked_end: winning_day, locked: true)
      flash[:notice] = "Congratulations, the event is on #{@event.locked_start}"
      redirect_to group_path(@event.group)
    else
      flash[:notice] = "There isn't a winning date yet."
      redirect_to group_path(@event.group)
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
