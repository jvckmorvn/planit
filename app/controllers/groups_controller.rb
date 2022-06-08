class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @events = Event.all
    @event = Event.new
    @event.user = current_user
    @event.group = @group
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      UserGroup.create(user: current_user, group: @group, is_creator: true)
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end
end
