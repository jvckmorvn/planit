class GroupsController < ApplicationController
  def index
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      UserGroup.create(user: current_user, group: @group)
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :picture)
  end
end
