class UserGroupsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    params[:user_group][:user_id].each do |id|
      UserGroup.create(user_id: id, group: @group)
    end
    redirect_to group_path(@group)
  end


  private

  def user_group_params
    params.require(:user_group).permit(id: [])
  end
end
