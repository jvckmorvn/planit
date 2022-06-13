class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @user_group = UserGroup.new
    @events = @group.events
    @calendar_events = @group.events
    @calendar_events = @events.where(id: params[:event_id]) if params[:event_id].present?
    @markers = @calendar_events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        colour: event.colour,
        info_window: render_to_string(partial: "events/info_window", locals: { event: event }),
      }
    end
    @event = Event.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      UserGroup.create(user: current_user, group: @group, is_creator: true)
      redirect_to group_path(@group)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to group_path(@group), status: :see_other
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end
end
