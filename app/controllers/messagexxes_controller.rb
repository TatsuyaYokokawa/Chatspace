class MessagexxesController < ApplicationController
  before_action :set_group

  def index
    @message = Messagexx.new
    @messages = @group.messagexxes.includes(:account)
  end
  
  def create
    @message = @group.messagexxes.new(messagexx_params)
    if @message.save
      respond_to do |format|
        format.json
      end
    else
      @messages = @group.messagexxes.includes(:account)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

	private

  def messagexx_params
    params.require(:messagexx).permit(:content, :image).merge(account_id: current_account.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end

