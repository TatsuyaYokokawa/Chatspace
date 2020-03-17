class AccountsController < ApplicationController
  def index
    return nil if params[:keyword] == ""
    @accounts = Account.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_account.id).limit(10)
    respond_to do |format|
      format.html
      format.json
      end
  end

  def edit
  end
  
  def update
    if current_account.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:account).permit(:name, :email)
  end

 end
