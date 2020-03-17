class Api::MessagexxesController < ApplicationController
  def index
     group = Group.find(params[:group_id])
     last_message_id = params[:id].to_i
     @messages = group.messagexxes.includes(:account).where("id > ?", last_message_id)
   end
  end
end