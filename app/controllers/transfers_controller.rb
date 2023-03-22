class TransfersController < ApplicationController
  def index
    @transfers = Transfer.joins(:groups).where(groups: { id: params[:group_id] }).order(created_at: :desc)
    @group = Group.find(params[:group_id])
  end

  def new
    @transfer = Transfer.new
    @groups = Group.created_by_current_user(current_user)
  end

  def create
    params = transfer_params
    @transfer = Transfer.new(name: params[:name], amount: params[:amount])
    @transfer.author = current_user
    @group_ids = params[:group_ids]
    @group_ids.each do |id|
      @group = Group.find(id) unless id == ''
      @transfer.groups.push(@group) unless @group.nil?
    end
    if @transfer.save
      redirect_to "/groups/#{@transfer.groups.first.id}/transfers", notice: 'transfer was successfully added'
    else
      render :new, alert: "Couldn't add food to transfer"
    end
  end

  def destroy
    @user = current_user
    @transfer = Transfer.find(params[:id])
    @transfer.destroy

    redirect_to "/groups/#{@group.id}/transfers", notice: 'transfer was successfully deleted'
  end

  def transfer_params
    params.require(:transfer).permit(:name, :amount, group_ids: [])
  end
end
