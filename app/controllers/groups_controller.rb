class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      UserGroup.create(user_id: current_user.id, group: @group, is_creator: true)
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
