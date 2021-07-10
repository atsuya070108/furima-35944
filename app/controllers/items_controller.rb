class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end
  
  
  
  
  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
