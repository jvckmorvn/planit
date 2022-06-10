class UserGroupsController < ApplicationController
  def new
    @user_group = UserGroup.new
    @group = Group.find(params[:group_id])
  end

  def update
    @group = Group.find(params[:group_id])
    @user_group = UserGroup.new(user_group_params)
    if @user_group.save
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_group_params
    params.require(:user_group).permit(id: [])
  end
end
