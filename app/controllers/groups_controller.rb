class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.accounts << current_account
  end
  
  def create
    binding.pry

    
  end
  
end
