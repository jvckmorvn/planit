class UserGroupsController < ApplicationController
  def new
    @user_group = UserGroup.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    # @emails = []
    params[:user_group][:user_id].each do |id|
      UserGroup.create(user_id: id, group: @group)
      # user = User.find(id)
      # user && emails.push(user.email)
    end

    # ApplicationMailer.with(order: @order).new_order_email.deliver_later
    redirect_to group_path(@group)
  end

  def destroy
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy
    redirect_to group_path(@user_group.group), status: :see_other
  end

  private

  def user_group_params
    params.require(:user_group).permit(id: [])
  end
end
