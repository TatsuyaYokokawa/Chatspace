class GroupsController < ApplicationController
  def index
  end
  
  def new
    @group = Group.new
    @group.accounts << current_account
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    # binding.pry
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messagexxes_path(current_account), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, account_ids: [])
  end
end
