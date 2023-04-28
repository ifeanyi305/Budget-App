class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path, notice: 'Category was successfully created'
    else
      render :new, alert: "Couldn't create Category for user"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_recipes_path, notice: 'Category was successfully deleted'
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
