class UserGroupsController < ApplicationController
  def new
    @user_group = UserGroup.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    params[:user_group][:user_id].each do |id|
      UserGroup.create(user_id: id, group: @group)
    end
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.find(params[:user_group_id])
    raise
    redirect_to group_path(@group), status: :see_other
  end

  private

  def user_group_params
    params.require(:user_group).permit(id: [])
  end
end
