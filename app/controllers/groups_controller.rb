class GroupsController < ApplicationController
  def index
    @groups = Group.where(id: UserGroup.where(user_id: current_user.id).pluck(:group_id))
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
        info_window: render_to_string(partial: "events/info_window", locals: { event: event })
      }
    end
    @event = Event.new
  end

  def create
    @group = Group.new(group_params)
    @group.colour = ["rgba(204,138,186,0.3)", "rgba(177,188,230,0.3)", "rgba(183,229,221,0.3)", "rgba(95,113,97,0.3)",
                     "rgba(152,221,202,0.3)", "rgba(241,222,229,0.3)", "rgba(82,94,117,0.3)", "rgba(191,139,103,0.3)", "rgba(83,87,166,0.3)"].sample
    if @group.save
      UserGroup.create(user: current_user, group: @group, is_creator: true)
      redirect_to group_path(@group)
    else
      @groups = Group.where(id: UserGroup.where(user_id: current_user.id).pluck(:group_id))
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
    params.require(:group).permit(:name, :picture, :colour)
  end
end
